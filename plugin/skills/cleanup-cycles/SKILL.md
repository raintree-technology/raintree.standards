---
name: cleanup-cycles
description: "Detect and untangle circular dependencies. Runs madge/skott (TS), pycycle (Py), or compiler-only checks (Go/Rust). Auto-fixes leaf-extractable cycles; reports core cycles for human review. Use when the user asks to find circular imports, fix dependency cycles, or untangle module graph."
argument-hint: "[scope (optional path or glob)]"
user-invocable: true
---

Detect circular import dependencies and break them where it's mechanically safe. Cycles between leaf utilities can be fixed by extraction; cycles between core modules need architectural decisions and are reported, not auto-fixed.

## Working rules

These apply to every step below and override anything later in this file.

- **No commits.** Leave changes uncommitted and list the changed files in the report. Commit only when the user asks.
- **Other work in the tree.** Record `git status --porcelain` before starting. Do not edit a file that already had changes, and never stash, reset, or check out anyone else's work. To undo this skill's edit to a file, restore only that file; `git checkout -- <file>` is safe only for files that were clean at the start.
- **Scratch space.** Write tool output and the report under `$SCRATCH`: the session scratchpad directory when one is listed, otherwise a `mktemp -d` directory. Do not write to `/tmp`, `.claude/`, or `.gitignore`.
- **Tools.** Prefer tools and configs the project already has (for example a `knip` script with its config file). Ask before installing anything.
- **Verify with the project's own gates.** Read the `package.json` scripts (or Makefile and CI workflow) and run the checks CI runs: typecheck, lint with warnings as errors, any custom lint (such as oxlint or ESLint plugins), and the project's test scripts. Run each as its own command; a non-zero exit fails verification. Never chain fallbacks with `||` or `|| true`, because the fallback can pass when the real check failed. If a check also fails on files this skill did not touch, report it and do not revert for it.

## Preflight

1. **Language detect**: `package.json` (TS/JS), `pyproject.toml` (Py), `go.mod` (Go), `Cargo.toml` (Rust). Note: Go and Rust prevent cycles at compile time, so this skill is mostly TS/Py work.
2. **Git state**: record `git status --porcelain` and skip files that already have changes (see Working rules).
3. **Report dir**: `mkdir -p $SCRATCH/cleanup-reports`.
4. **Existing scripts**: check `package.json` for `cycle:check` or similar — if the repo already wires up madge with config, prefer their config over defaults.

## Detect

### TypeScript / JavaScript
```bash
# Madge is the standard. Skott is faster for large repos.
# Use the project's cycle script and config when one exists. Pass the paths that exist.
bunx madge --circular --extensions ts,tsx,js,jsx --json apps/ packages/ > $SCRATCH/madge.json
# Path aliases (such as `@/`) resolve only with a tsconfig. Also run each workspace with its own:
bunx madge --circular --extensions ts,tsx --ts-config apps/app/tsconfig.json --json apps/app > $SCRATCH/madge-app.json
```
Each entry is an array describing one cycle: `["a.ts", "b.ts", "a.ts"]`.

### Python
```bash
pipx run pycycle --here --verbose > $SCRATCH/pycycle.txt 2>&1
# Or, when the project configures it: lint-imports > $SCRATCH/import-linter.txt
```

### Go
```bash
# Go enforces acyclic at compile; this just confirms build is clean.
go build ./... 2>&1
# Optional visualization with goda: ask before installing it.
```
If `go build` fails with `import cycle`, that's the report.

### Rust
```bash
cargo build 2>&1   # rustc rejects cycles
# Optional module tree with cargo-modules: ask before installing it.
```

## Assess

Write `$SCRATCH/cleanup-reports/cleanup-cycles-{YYYY-MM-DD}.md`:

```markdown
# Circular Dependencies Assessment — YYYY-MM-DD

## Summary
- Total cycles: N
- HIGH confidence (auto-fixable by leaf extraction): X
- MEDIUM confidence (refactor needed): Y
- LOW (architectural redesign): Z

## Cycles

### Cycle 1 — HIGH
- Path: `a/util.ts → b/helper.ts → a/util.ts`
- Shared piece: `formatCurrency` defined in `b/helper.ts`, called by `a/util.ts`. `b/helper.ts` imports a single constant `LOCALE` from `a/util.ts`.
- Plan: Extract `LOCALE` to new `a/constants.ts`. `b/helper.ts` imports from there. Cycle broken.

### Cycle 2 — MEDIUM
- Path: `domains/user/index.ts → domains/account/index.ts → domains/user/index.ts`
- Both modules export and consume each other's primary types. No leaf to extract.
- Recommendation: introduce a `domains/shared/types.ts` for cross-domain types, OR invert one direction with dependency injection.

## Critical Assessment
[2-3 paragraphs: what does the cycle pattern reveal about the architecture? Are cycles concentrated in one area? Is there a missing layer?]
```

## Apply

**Auto-fix HIGH-confidence leaf-extraction cycles only.**

### Confidence rubric

**HIGH (auto-apply):**
- Cycle has exactly 2 modules.
- One direction of the cycle is a single small thing: a constant, a type, a pure utility function ≤20 lines, with no further dependencies inside the cycle.
- Extracting that thing to a new module will provably break the cycle.

**MEDIUM (report only):**
- Cycle has 3+ modules.
- Both directions consume non-trivial APIs of the other.
- Extracting would require moving classes/functions with their own dependency tails.

**LOW (note for human):**
- Cycle is structural (e.g., bidirectional ORM relations, parent/child component refs) — may be intentional.
- Cycle disappears under conditional imports — leave alone, document.

### Execution (HIGH only)

1. Identify the leaf piece (constant/type/util).
2. Create new file at the appropriate location: `src/<area>/<name>.ts`. Prefer placing inside the consumer that has fewer outside imports.
3. Move the leaf there.
4. Update both old modules' imports.
5. Re-run madge/pycycle to confirm the cycle is gone.
6. Leave the changes uncommitted and list the changed files in the report.

## Verify

Rerun cycle detection with the same command and paths. The HIGH cycles that were fixed must be gone, and no new cycles may appear.

Run the project's own gates as separate commands (see Working rules). Typical examples: `bun run typecheck`, `bun run lint:ci`, a custom lint script such as `bun run lint:slop:ci`, and the test scripts (`bun run test:checks` or the equivalent). For other languages: `go build ./...` and `go test ./...`; `cargo check` and `cargo test`; `mypy` and `pytest` only when the project configures them.

If a gate fails or a new cycle appears, restore the files this skill changed, mark those fixes MEDIUM, and escalate.

## Output

- "Broke N circular dependencies. M cycles deferred for architectural review."
- Path to report.
- Verify status.

## NEVER

- Auto-apply on cycles with 3+ modules — these always need human judgment.
- Use barrel files (`index.ts` re-exports) as the cycle-breaking solution — they often hide cycles instead of fixing them.
- Touch framework-imposed cycles (e.g., React component file importing its own types from a sibling) — those are conventions, not bugs.
- Move types into a `types.ts` god-file — prefer co-location with the smallest scope that breaks the cycle.
- Suppress cycle warnings via tooling config — fix or report, never silence.
