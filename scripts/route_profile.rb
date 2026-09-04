#!/usr/bin/env ruby
# frozen_string_literal: true

# Returns deterministic, machine-readable task-profile routes.
#
# Exit statuses: 0 valid route, 1 invalid library content, 2 invalid invocation.

require "date"
require "json"

require_relative "lib/standards"
require_relative "lib/standards/catalog_validator"

options = Standards::CLI.parse(
  ARGV,
  banner: "Usage: ruby scripts/route_profile.rb (--list | --profile PROFILE-ID) --format json",
  description: "Lists profiles or resolves one profile and its dependency-ordered documents."
) do |parser, parsed|
  parser.on("--list", "List available task profiles") { parsed[:list] = true }
  parser.on("--profile PROFILE-ID", "Resolve one task profile") { |value| parsed[:profile] = value }
  parser.on("--format FORMAT", "Output format; only json is supported") { |value| parsed[:format] = value }
end

unless options[:format] == "json"
  warn "route_profile.rb: --format json is required"
  exit Standards::EXIT_USAGE
end

list_mode = options[:list] == true
profile_mode = !options[:profile].to_s.empty?
unless list_mode ^ profile_mode
  warn "route_profile.rb: specify exactly one of --list or --profile PROFILE-ID"
  exit Standards::EXIT_USAGE
end

root = ENV["STANDARDS_ROOT"].to_s.empty? ? File.expand_path("..", __dir__) : File.expand_path(ENV.fetch("STANDARDS_ROOT"))
validator = Standards::CatalogValidator.new(root).run
unless validator.valid?
  puts JSON.pretty_generate(
    "schemaVersion" => 1,
    "routeStatus" => "invalid-library",
    "selectedProfile" => nil,
    "documents" => [],
    "ruleIdsAndTitles" => [],
    "verificationRequirements" => [],
    "missingEvidence" => [],
    "warnings" => validator.findings.to_a,
    "unresolvedReferences" => validator.findings.to_a.grep(/unknown (?:dependency|governed reference)/)
  )
  exit Standards::EXIT_INVALID
end

catalog = Standards::YamlSource.load_file(
  File.join(root, "catalog.yaml"), "catalog.yaml", Standards::Findings.new, permitted_classes: [Date]
)
sections = Standards::CatalogValidator::GOVERNED_KEYS
entries = sections.flat_map { |section| Array(catalog[section]) }.sort_by { |entry| entry.fetch("id") }
records = entries.to_h do |entry|
  path = entry.fetch("path")
  findings = Standards::Findings.new
  document = Standards::Document.load(File.join(root, path), path, findings, permitted_classes: [Date, Time])
  [entry.fetch("id"), { "path" => path, "document" => document, "metadata" => document.metadata }]
end

date_value = lambda { |value| value.respond_to?(:iso8601) ? value.iso8601 : value }
profile_metadata = lambda do |record|
  metadata = record.fetch("metadata")
  {
    "id" => metadata["id"],
    "title" => metadata["title"],
    "description" => metadata["description"],
    "path" => record.fetch("path"),
    "status" => metadata["status"],
    "governanceStatus" => metadata["governance_status"],
    "lastReviewed" => date_value.call(metadata["last_reviewed"]),
    "reviewBy" => date_value.call(metadata["review_by"]),
    "staleAfter" => date_value.call(metadata["stale_after"]),
    "dependsOn" => Array(metadata["depends_on"]).sort,
    "completionEvidence" => record.fetch("document").section("Completion evidence").to_s
      .scan(/^[-*]\s+(.+?)(?=\n[-*]\s|\z)/m).flatten.map { |item| item.gsub(/\s+/, " ").strip }
  }
end

profiles = records.values.select { |record| record.dig("metadata", "type") == "profile" }.sort_by do |record|
  record.dig("metadata", "id")
end

if options[:list]
  puts JSON.pretty_generate(
    "schemaVersion" => 1,
    "routeStatus" => "valid",
    "selectedProfile" => nil,
    "profiles" => profiles.map { |record| profile_metadata.call(record) },
    "documents" => [],
    "ruleIdsAndTitles" => [],
    "verificationRequirements" => [],
    "missingEvidence" => [],
    "warnings" => [],
    "unresolvedReferences" => []
  )
  exit Standards::EXIT_SUCCESS
end

selected = records[options[:profile]]
unless selected&.dig("metadata", "type") == "profile"
  warn "route_profile.rb: unknown profile #{options[:profile].inspect}"
  exit Standards::EXIT_USAGE
end

ordered_ids = []
visited = {}
visit = lambda do |id|
  return if visited[id]

  visited[id] = true
  Array(records.dig(id, "metadata", "depends_on")).sort.each { |dependency| visit.call(dependency) }
  ordered_ids << id
end
visit.call(options[:profile])

warnings = []
rules = []
verification = []
missing_evidence = []
documents = ordered_ids.map do |id|
  record = records.fetch(id)
  metadata = record.fetch("metadata")
  document = record.fetch("document")
  review_by = metadata["review_by"]
  warnings << "#{id} is draft and requires qualified review before stability" if metadata["status"] == "draft"
  warnings << "#{id} review date passed on #{date_value.call(review_by)}" if review_by && Date.today > Date.parse(review_by.to_s)

  document_rules = document.content.to_enum(:scan, Standards::CatalogValidator::RULE_HEADING_PATTERN).map do
    heading = Regexp.last_match
    rule_id = heading[1]
    title = heading[0].sub(/^###\s+#{Regexp.escape(rule_id)}\s+—\s+/, "")
    block_start = heading.end(0)
    block_end = document.content.index(/^###\s+/, block_start) || document.content.index(/^##\s+/, block_start) || document.content.length
    block = document.content[block_start...block_end]
    verify_text = block[/\*\*Verify:\*\*\s*(.*?)(?=\n\*\*Exceptions:\*\*)/m, 1].to_s.strip
    verify_items = verify_text.scan(/^[-*]\s+(.+?)(?=\n[-*]\s|\z)/m).flatten.map { |item| item.gsub(/\s+/, " ").strip }
    verify_items = [verify_text.gsub(/\s+/, " ").strip] if verify_items.empty? && !verify_text.empty?
    exceptions = block[/\*\*Exceptions:\*\*\s*(.*?)(?=\n###\s|\n##\s|\z)/m, 1].to_s.gsub(/\s+/, " ").strip
    rule = {
      "id" => rule_id,
      "title" => title,
      "level" => block[/\*\*Level:\*\*\s*([^\n]+)/, 1]&.strip,
      "verificationRequirements" => verify_items,
      "exceptions" => exceptions
    }
    rules << { "id" => rule_id, "title" => title }
    verify_items.each do |requirement|
      item = { "ruleId" => rule_id, "requirement" => requirement, "status" => "unverified" }
      verification << item
      missing_evidence << item
    end
    rule
  end

  {
    "id" => id,
    "title" => metadata["title"],
    "path" => record.fetch("path"),
    "type" => metadata["type"],
    "status" => metadata["status"],
    "governanceStatus" => metadata["governance_status"],
    "lastReviewed" => date_value.call(metadata["last_reviewed"]),
    "reviewBy" => date_value.call(review_by),
    "staleAfter" => date_value.call(metadata["stale_after"]),
    "dependsOn" => Array(metadata["depends_on"]).sort,
    "verificationEvents" => metadata["verified"],
    "rules" => document_rules
  }
end

puts JSON.pretty_generate(
  "schemaVersion" => 1,
  "routeStatus" => "valid",
  "selectedProfile" => profile_metadata.call(selected),
  "documents" => documents,
  "ruleIdsAndTitles" => rules,
  "verificationRequirements" => verification,
  "missingEvidence" => missing_evidence,
  "warnings" => warnings.uniq,
  "unresolvedReferences" => []
)
exit Standards::EXIT_SUCCESS
