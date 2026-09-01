# frozen_string_literal: true

root = File.expand_path("..", __dir__)
readme = File.read(File.join(root, "README.md"))
llms = File.read(File.join(root, "llms.txt"))

required = [
  "<!-- project-record: raintree-standards -->",
  "**Version 1 open-source standards library",
  "## Start with a task",
  "## Lifecycle and trust boundary",
  "## Raintree open-source system",
  "## Project policies"
]

missing = required.reject { |value| readme.include?(value) }
abort("README.md missing required project sections: #{missing.join(', ')}") unless missing.empty?
abort("README.md must contain exactly one H1") unless readme.lines.count { |line| line.start_with?("# ") } == 1
abort("README.md must not contain concept frontmatter") if readme.start_with?("---\n")

llms_required = [
  "# Raintree Standards",
  "## Apply the library correctly",
  "Select the closest task profile",
  "Read every standard in the profile's `depends_on` field",
  "Activate every conditional route",
  "stable rule ID",
  "Do not invent approval, verification, or certification",
  "Marketing Skills and other third-party procedures are informative task aids",
  "profiles/index.md",
  "governance/authority.md",
  "foundations/evidence.md",
  "governance/exceptions.md"
]

llms_missing = llms_required.reject { |value| llms.include?(value) }
abort("llms.txt missing required routing content: #{llms_missing.join(', ')}") unless llms_missing.empty?
abort("llms.txt must contain exactly one H1") unless llms.lines.count { |line| line.start_with?("# ") } == 1
abort("llms.txt must not contain concept frontmatter") if llms.start_with?("---\n")

raw_prefix = "https://raw.githubusercontent.com/raintree-technology/raintree.standards/main/"
raw_paths = llms.scan(/\]\((#{Regexp.escape(raw_prefix)}[^)]+)\)/).flatten.map { |url| url.delete_prefix(raw_prefix) }
abort("llms.txt must contain unique explicit routes") unless raw_paths.any? && raw_paths.uniq.size == raw_paths.size

missing_targets = raw_paths.reject { |path| File.file?(File.join(root, path)) }
abort("llms.txt links to missing repository files: #{missing_targets.join(', ')}") unless missing_targets.empty?

puts "project README and llms.txt checks passed"
