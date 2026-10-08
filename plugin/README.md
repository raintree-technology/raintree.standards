# Raintree Standards Codex plugin recipe

The public Raintree marketplace combines this recipe with the governed library
from the same immutable release tag. The generated plugin remains self-contained.

Run `ruby scripts/route_profile.rb --list --format json` from the installed
plugin root to list profiles. Resolve one route with
`ruby scripts/route_profile.rb --profile PROFILE-ID --format json`.

Routes preserve maturity, governance status, review dates, exceptions, and
unverified evidence. They do not certify conformance.

## Skills

- `standards-navigator` routes a task to a profile and its standards.
- `cleanup-all` runs the eight cleanup skills in order: `cleanup-unused`,
  `cleanup-cycles`, `cleanup-dedupe`, `cleanup-types`, `cleanup-weak-types`,
  `cleanup-defensive`, `cleanup-legacy`, and `cleanup-slop`. Each skill leaves
  its changes uncommitted and verifies with the target project's own CI gates.
  `cleanup-unused` and `cleanup-legacy` apply `ENGINEERING-CODE-REMOVAL`.
