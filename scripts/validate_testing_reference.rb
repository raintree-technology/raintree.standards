#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "lib/standards"
require_relative "lib/standards/testing_reference_validator"

Standards::CLI.parse(
  ARGV,
  banner: "Usage: ruby scripts/validate_testing_reference.rb [options]",
  description: "Validates testing routes, rule coverage, document targets, and heading anchors."
)

root = ENV["TESTING_REFERENCE_ROOT"].to_s.empty? ? File.expand_path("..", __dir__) : File.expand_path(ENV.fetch("TESTING_REFERENCE_ROOT"))

input_findings = Standards::Findings.new
unless Standards::InputLimits.validate(root, input_findings)
  input_findings.report
  exit Standards::EXIT_INVALID
end

validator = Standards::TestingReferenceValidator.new(root).run
if validator.valid?
  puts validator.summary
  exit Standards::EXIT_SUCCESS
end

validator.findings.report
exit Standards::EXIT_INVALID
