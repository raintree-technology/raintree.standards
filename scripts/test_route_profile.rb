#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "open3"
require "rbconfig"

require_relative "lib/standards"

root = File.expand_path("..", __dir__)
command = File.join(root, "scripts", "route_profile.rb")
failures = []
checks = 0

run = lambda do |*arguments|
  stdout, stderr, status = Open3.capture3(RbConfig.ruby, command, *arguments)
  [stdout, stderr, status]
end

stdout, stderr, status = run.call("--list", "--format", "json")
checks += 1
failures << "list route failed: #{stderr}" unless status.success?
list = JSON.parse(stdout)
checks += 1
failures << "profiles are not deterministically ordered" unless list.fetch("profiles").map { |row| row.fetch("id") } == list.fetch("profiles").map { |row| row.fetch("id") }.sort

profile_id = list.fetch("profiles").first.fetch("id")
first, first_error, first_status = run.call("--profile", profile_id, "--format", "json")
second, second_error, second_status = run.call("--profile", profile_id, "--format", "json")
checks += 1
failures << "profile route failed: #{first_error} #{second_error}" unless first_status.success? && second_status.success?
checks += 1
failures << "profile route is not deterministic" unless first == second
route = JSON.parse(first)
positions = route.fetch("documents").each_with_index.to_h { |document, index| [document.fetch("id"), index] }
checks += 1
dependency_ordered = route.fetch("documents").all? do |document|
  document.fetch("dependsOn").all? { |dependency| positions.fetch(dependency) < positions.fetch(document.fetch("id")) }
end
failures << "dependencies do not precede their consumers" unless dependency_ordered
checks += 1
failures << "route omitted maturity or governance status" unless route.fetch("documents").all? { |document| document.key?("status") && document.key?("governanceStatus") }
checks += 1
failures << "route omitted unverified evidence requirements" unless route.fetch("verificationRequirements").all? { |item| item.fetch("status") == "unverified" }

_stdout, stderr, status = run.call("--profile", "PROFILE-NOT-FOUND", "--format", "json")
checks += 1
failures << "invalid profile ID did not exit 2" unless status.exitstatus == Standards::EXIT_USAGE && stderr.include?("unknown profile")

_stdout, _stderr, status = run.call("--list")
checks += 1
failures << "missing format did not exit 2" unless status.exitstatus == Standards::EXIT_USAGE

if failures.empty?
  puts "Profile routing checks valid: #{checks} assertions"
  exit Standards::EXIT_SUCCESS
end

failures.each { |failure| warn failure }
exit Standards::EXIT_INVALID
