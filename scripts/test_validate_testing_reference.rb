#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "lib/standards"
require_relative "lib/standards/test_support"

include Standards

suite = TestSupport::Suite.new(
  "Testing reference validator",
  validator: "validate_testing_reference.rb",
  root_env: "TESTING_REFERENCE_ROOT",
  prepare: TestSupport.method(:copy_repository)
)

def routes(root)
  File.join(root, "testing", "routes.yaml")
end

suite.accepts("clean reference", "Testing reference valid")

suite.rejects_usage("unknown option", "invalid option: --nonsense", ["--nonsense"])

suite.rejects("missing field guide", "missing document testing/field-guide.md") do |root|
  File.delete(File.join(root, "testing", "field-guide.md"))
end

suite.rejects("unknown rule", "references unknown rule ENGINEERING-TESTING-999") do |root|
  TestSupport.edit_yaml(routes(root)) do |document|
    document["test_types"]["unit"]["rules"] << "ENGINEERING-TESTING-999"
  end
end

suite.rejects("missing rule index entry", "rule_index missing ENGINEERING-TESTING-001") do |root|
  TestSupport.edit_yaml(routes(root)) do |document|
    document["rule_index"].delete("ENGINEERING-TESTING-001")
  end
end

suite.rejects("missing recipe anchor", "references missing anchor #absent-recipe") do |root|
  TestSupport.edit_yaml(routes(root)) do |document|
    document["situations"]["bug-fix"]["recipe"] = "absent-recipe"
  end
end

suite.rejects("missing template anchor", "references missing anchor #absent-template") do |root|
  TestSupport.edit_yaml(routes(root)) do |document|
    document["situations"]["bug-fix"]["templates"] = ["absent-template"]
  end
end

suite.rejects("unknown stage", "references unknown stage overnight") do |root|
  TestSupport.edit_yaml(routes(root)) do |document|
    document["test_types"]["unit"]["stages"] << "overnight"
  end
end

suite.rejects("catalog route drift", "reference_routes.testing must be testing/routes.yaml") do |root|
  TestSupport.edit_yaml(File.join(root, "catalog.yaml")) do |document|
    document["reference_routes"]["testing"] = "testing/absent.yaml"
  end
end

suite.rejects("abbreviated rule reference", "abbreviated rule reference `-001` is not allowed") do |root|
  path = File.join(root, "testing", "field-guide.md")
  File.write(path, "#{File.read(path)}\nAbbreviated drift: `-001`.\n")
end

suite.rejects("invalid update date", "updated must be an ISO 8601 date") do |root|
  TestSupport.edit_yaml(routes(root)) { |document| document["updated"] = "someday" }
end

suite.rejects("duplicate stage definition", "stages must not contain duplicates") do |root|
  TestSupport.edit_yaml(routes(root)) { |document| document["stages"] << document["stages"].first }
end

suite.rejects("duplicate route rule", "test_types.unit.rules must not contain duplicates") do |root|
  TestSupport.edit_yaml(routes(root)) do |document|
    document["test_types"]["unit"]["rules"] << document["test_types"]["unit"]["rules"].first
  end
end

suite.rejects("situation without templates", "situations.bug-fix.templates must be a non-empty list") do |root|
  TestSupport.edit_yaml(routes(root)) { |document| document["situations"]["bug-fix"]["templates"] = [] }
end

suite.rejects("missing standard taxonomy type", "test_types missing standard taxonomy type smoke") do |root|
  TestSupport.edit_yaml(routes(root)) { |document| document["test_types"].delete("smoke") }
end

suite.rejects("duplicate reference heading", "duplicate heading anchor #thirty-second-decision-path") do |root|
  path = File.join(root, "testing", "field-guide.md")
  File.write(path, "#{File.read(path)}\n## Thirty-second decision path\n")
end

suite.rejects("non-string document path", "documents.field_guide must be a path string") do |root|
  TestSupport.edit_yaml(routes(root)) { |document| document["documents"]["field_guide"] = [] }
end

exit(suite.run ? EXIT_SUCCESS : EXIT_INVALID)
