# frozen_string_literal: true

require "set"

require_relative "findings"
require_relative "paths"
require_relative "yaml_source"

module Standards
  # Validates the machine-readable testing routes against the authoritative
  # standard and the human reference artifacts. The reference may summarize a
  # rule, but it may not invent an ID, lose a rule, or point to a stale heading.
  class TestingReferenceValidator
    REQUIRED_DOCUMENTS = %w[field_guide recipes templates examples].freeze
    REQUIRED_ROUTE_KEYS = %w[version updated standard profile documents rule_index stages test_types situations].freeze
    RULE_PATTERN = /^### (ENGINEERING-TESTING-\d{3})\s+—\s+.+$/
    RULE_REFERENCE_PATTERN = /ENGINEERING-TESTING-\d{3}/
    ABBREVIATED_RULE_REFERENCE_PATTERN = /`-\d{3}`/
    SLUG_PATTERN = /^[a-z0-9]+(?:-[a-z0-9]+)*$/

    attr_reader :findings, :rule_count, :test_type_count, :situation_count

    def initialize(root)
      @root = File.expand_path(root)
      @findings = Findings.new
      @rule_count = 0
      @test_type_count = 0
      @situation_count = 0
    end

    def run
      @routes = YamlSource.load_file(route_path, "testing/routes.yaml", findings, permitted_classes: [Date])
      check_header
      load_standard_rules
      load_documents
      check_rule_index
      check_stage_definitions
      check_test_types
      check_situations
      check_reference_rule_ids
      self
    end

    def valid?
      findings.empty?
    end

    def summary
      "Testing reference valid: #{rule_count} rules, #{test_type_count} test types, #{situation_count} situations"
    end

    private

    def route_path
      File.join(@root, "testing", "routes.yaml")
    end

    def check_header
      REQUIRED_ROUTE_KEYS.each do |key|
        findings.add("testing/routes.yaml: missing #{key}") unless @routes.key?(key)
      end
      findings.add("testing/routes.yaml: version must be 1") unless @routes["version"] == 1
      findings.add("testing/routes.yaml: updated must be an ISO 8601 date") unless @routes["updated"].is_a?(Date)
      findings.add("testing/routes.yaml: standard must be ENGINEERING-TESTING") unless @routes["standard"] == "ENGINEERING-TESTING"
      findings.add("testing/routes.yaml: profile must be PROFILE-SOFTWARE-CHANGE") unless @routes["profile"] == "PROFILE-SOFTWARE-CHANGE"
      catalog = YamlSource.load_file(File.join(@root, "catalog.yaml"), "catalog.yaml", findings, permitted_classes: [Date])
      unless catalog.dig("reference_routes", "testing") == "testing/routes.yaml"
        findings.add("catalog.yaml: reference_routes.testing must be testing/routes.yaml")
      end
    end

    def load_standard_rules
      path = File.join(@root, "engineering", "testing.md")
      unless File.file?(path)
        findings.add("Missing engineering/testing.md")
        @rules = Set.new
        return
      end
      content = File.read(path)
      @rules = content.lines.filter_map { |line| line.match(RULE_PATTERN)&.[](1) }.to_set
      taxonomy = content[/Use the following primary meanings consistently:(.*?)\n\nA check may support/m, 1].to_s
      @standard_test_types = taxonomy.lines.filter_map do |line|
        name = line[/^\| ([^|]+) \|/, 1]&.strip
        slugify(name) unless name.nil? || %w[Layer ---].include?(name)
      end.to_set
      @rule_count = @rules.length
      findings.add("engineering/testing.md: no ENGINEERING-TESTING rules found") if @rules.empty?
      findings.add("engineering/testing.md: no test taxonomy found") if @standard_test_types.empty?
    end

    def load_documents
      @document_paths = {}
      @anchors = {}
      documents = @routes["documents"]
      unless documents.is_a?(Hash)
        findings.add("testing/routes.yaml: documents must be a mapping")
        return
      end

      REQUIRED_DOCUMENTS.each do |name|
        relative = documents[name]
        if relative.to_s.empty?
          findings.add("testing/routes.yaml: documents.#{name} is required")
          next
        end
        unless relative.is_a?(String)
          findings.add("testing/routes.yaml: documents.#{name} must be a path string")
          next
        end
        path = Paths.resolve(@root, relative)
        if path.nil?
          findings.add("testing/routes.yaml: documents.#{name} escapes the bundle root")
        elsif !File.file?(path)
          findings.add("testing/routes.yaml: missing document #{relative}")
        else
          @document_paths[name] = path
          @anchors[relative] = markdown_anchors(path)
        end
      end

      values = documents.values.select { |value| value.is_a?(String) }
      findings.add("testing/routes.yaml: document paths must be unique") unless values.uniq.length == values.length
    end

    def markdown_anchors(path)
      anchors = File.readlines(path).filter_map do |line|
        heading = line[/^\#{1,6}\s+(.+?)\s*$/, 1]
        slugify(heading) unless heading.nil?
      end
      anchors.tally.each do |anchor, count|
        findings.add("#{path.delete_prefix("#{@root}/")}: duplicate heading anchor ##{anchor}") if count > 1
      end
      findings.add("#{path.delete_prefix("#{@root}/")}: heading produces an empty anchor") if anchors.include?("")
      anchors.to_set
    end

    def slugify(text)
      text.downcase
          .gsub(/`[^`]*`/, "")
          .gsub(/[^a-z0-9\s-]/, "")
          .strip
          .gsub(/\s+/, "-")
          .gsub(/-+/, "-")
    end

    def check_rule_index
      index = @routes["rule_index"]
      unless index.is_a?(Hash)
        findings.add("testing/routes.yaml: rule_index must be a mapping")
        return
      end

      indexed = index.keys.map(&:to_s).to_set
      (@rules - indexed).sort.each { |rule| findings.add("testing/routes.yaml: rule_index missing #{rule}") }
      (indexed - @rules).sort.each { |rule| findings.add("testing/routes.yaml: rule_index references unknown rule #{rule}") }

      index.each do |rule, target|
        normalized_rule = rule.to_s
        check_rule(normalized_rule, "rule_index")
        check_target(target, "rule_index.#{normalized_rule}")
      end
    end

    def check_target(target, label)
      relative, anchor = target.to_s.split("#", 2)
      path = Paths.resolve(@root, relative)
      if path.nil?
        findings.add("testing/routes.yaml: #{label} escapes the bundle root")
      elsif !File.file?(path)
        findings.add("testing/routes.yaml: #{label} references missing #{relative}")
      elsif anchor.to_s.empty?
        findings.add("testing/routes.yaml: #{label} requires a heading anchor")
      elsif !anchor.match?(SLUG_PATTERN)
        findings.add("testing/routes.yaml: #{label} has invalid anchor #{anchor.inspect}")
      else
        @anchors[relative] ||= markdown_anchors(path)
        findings.add("testing/routes.yaml: #{label} references missing anchor ##{anchor}") unless @anchors[relative].include?(anchor)
      end
    end

    def check_test_types
      rows = @routes["test_types"]
      unless rows.is_a?(Hash) && !rows.empty?
        findings.add("testing/routes.yaml: test_types must be a non-empty mapping")
        return
      end
      @test_type_count = rows.length
      missing = @standard_test_types - rows.keys.map(&:to_s).to_set
      missing.sort.each { |name| findings.add("testing/routes.yaml: test_types missing standard taxonomy type #{name}") }
      rows.each do |name, row|
        check_route_name(name, "test_types")
        check_route_row(row, "test_types.#{name}", require_recipe: false)
      end
    end

    def check_situations
      rows = @routes["situations"]
      unless rows.is_a?(Hash) && !rows.empty?
        findings.add("testing/routes.yaml: situations must be a non-empty mapping")
        return
      end
      @situation_count = rows.length
      rows.each do |name, row|
        check_route_name(name, "situations")
        check_route_row(row, "situations.#{name}", require_recipe: true)
        next unless row.is_a?(Hash)

        recipe = row["recipe"].to_s
        check_named_anchor("recipes", recipe, "situations.#{name}.recipe")
        templates = row["templates"]
        unless templates.is_a?(Array) && !templates.empty?
          findings.add("testing/routes.yaml: situations.#{name}.templates must be a non-empty list")
          next
        end
        check_unique_list(templates, "situations.#{name}.templates")
        templates.each do |template|
          check_named_anchor("templates", template.to_s, "situations.#{name}.templates")
        end
      end
    end

    def check_stage_definitions
      stages = @routes["stages"]
      unless stages.is_a?(Array) && !stages.empty?
        findings.add("testing/routes.yaml: stages must be a non-empty list")
        return
      end
      check_unique_list(stages, "stages")
      stages.each do |stage|
        findings.add("testing/routes.yaml: invalid stage #{stage.inspect}") unless stage.to_s.match?(SLUG_PATTERN)
      end
    end

    def check_route_row(row, label, require_recipe:)
      unless row.is_a?(Hash)
        findings.add("testing/routes.yaml: #{label} must be a mapping")
        return
      end
      findings.add("testing/routes.yaml: #{label}.recipe is required") if require_recipe && row["recipe"].to_s.empty?

      rules = row["rules"]
      if !rules.is_a?(Array) || rules.empty?
        findings.add("testing/routes.yaml: #{label}.rules must be a non-empty list")
      else
        check_unique_list(rules, "#{label}.rules")
        rules.each { |rule| check_rule(rule, "#{label}.rules") }
      end

      stages = row["stages"]
      return if stages.nil?
      unless stages.is_a?(Array) && !stages.empty?
        findings.add("testing/routes.yaml: #{label}.stages must be a non-empty list")
        return
      end
      check_unique_list(stages, "#{label}.stages")
      allowed = Array(@routes["stages"])
      stages.each do |stage|
        findings.add("testing/routes.yaml: #{label}.stages references unknown stage #{stage}") unless allowed.include?(stage)
      end
    end

    def check_route_name(name, section)
      findings.add("testing/routes.yaml: #{section} has invalid key #{name.inspect}") unless name.to_s.match?(SLUG_PATTERN)
    end

    def check_unique_list(values, label)
      findings.add("testing/routes.yaml: #{label} must not contain duplicates") unless values.uniq.length == values.length
    end

    def check_named_anchor(document_name, anchor, label)
      path = @document_paths[document_name]
      return if path.nil?
      unless anchor.match?(SLUG_PATTERN)
        findings.add("testing/routes.yaml: #{label} has invalid anchor #{anchor.inspect}")
        return
      end
      relative = @routes.dig("documents", document_name)
      findings.add("testing/routes.yaml: #{label} references missing anchor ##{anchor}") unless @anchors.fetch(relative, Set.new).include?(anchor)
    end

    def check_rule(rule, label)
      findings.add("testing/routes.yaml: #{label} references unknown rule #{rule}") unless @rules.include?(rule)
    end

    def check_reference_rule_ids
      @document_paths.each_value do |path|
        content = File.read(path)
        content.scan(RULE_REFERENCE_PATTERN).uniq.each do |rule|
          findings.add("#{path.delete_prefix("#{@root}/")}: references unknown rule #{rule}") unless @rules.include?(rule)
        end
        content.scan(ABBREVIATED_RULE_REFERENCE_PATTERN).uniq.each do |rule|
          findings.add("#{path.delete_prefix("#{@root}/")}: abbreviated rule reference #{rule} is not allowed")
        end
      end
    end
  end
end
