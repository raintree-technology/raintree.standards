---
name: standards-navigator
description: Route a task through Raintree Standards when the user asks which Raintree standard or task profile applies, requests a governed checklist, or needs requirement IDs, verification evidence, exceptions, maturity, or review status. Select a profile only when the task maps clearly. When two or more profiles are plausible, present the closest profiles and ask the user to choose.
---

# Standards navigator

Use the installed library as the source of truth. Do not rely on remembered rule
text and do not claim certification.

## Select a route

1. Identify the task, intended outcome, affected system, and material risk.
2. Resolve the installed plugin root from this skill's location. It is two
   directories above this `SKILL.md` file.
3. Run `ruby <plugin-root>/scripts/route_profile.rb --list --format json`.
4. Select a profile only when the task maps clearly to one profile's stated
   purpose. Otherwise, show the closest profile IDs, titles, and descriptions,
   then ask the user to choose.
5. Run `ruby <plugin-root>/scripts/route_profile.rb --profile PROFILE-ID --format json`.
6. Read the dependency-ordered documents from the route before applying their
   rules. Preserve each document's source path, maturity, governance status,
   review dates, exceptions, warnings, and unresolved references.

## Apply the route

- Determine each rule's applicability from its stated condition.
- Treat every returned verification requirement as unverified until the task
  produces direct evidence.
- Record missing evidence as missing or unknown. Do not infer approval.
- Keep draft status visible. A released library can contain draft documents.
- Use the exception process when a required rule cannot be met; do not weaken or
  omit the rule.
- If routing returns `invalid-library`, stop governed work and report the exact
  validation findings.

## Output

Lead with the selected profile or the choice the user must make. Then report the
applicable rule IDs, required evidence, draft or stale warnings, approved
exceptions, and unresolved gaps. Never describe the result as certified unless
an external certification authority supplied that exact claim.
