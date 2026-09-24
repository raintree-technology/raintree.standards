---
name: cleanup-unused
description: "Detect and delete unused code, exports, files, and dependencies. Runs knip/vulture/staticcheck/cargo-machete appropriate to the language, writes a critical assessment, and auto-applies HIGH-confidence deletions. Use when the user asks to remove dead code, find unused exports, clean up dependencies, or run dead-code analysis."
argument-hint: "[scope (optional path or glob)]"
user-invocable: true
---

Detect unused code, exports, files, and dependencies. Auto-delete only what's verifiably dead. Write a critical assessment with confidence ratings; defer ambiguous items to the human.

## Governing standard

This skill applies Raintree Standard `ENGINEERING-CODE-REMOVAL` (`raintree.standards/engineering/code-removal.md`). Read it before running. Where this file and the standard differ, the standard wins.

## Working rules

These apply to every step below and override anything later in this file.

- **No commits.** Leave changes uncommitted and list the changed files in the report. Commit only when the user asks.
- **Other work in the tree.** Record `git status --porcelain` before starting. Do not edit a file that already had changes, and never stash, reset, or check out anyone else's work. To undo this skill's edit to a file, restore only that file; `git checkout -- <file>` is safe only for files that were clean at the start.
- **Scratch space.** Write tool output and the report under `$SCRATCH`: the session scratchpad directory when one is listed, otherwise a `mktemp -d` directory. Do not write to `/tmp`, `.claude/`, or `.gitignore`.
- **Tools.** Prefer tools and configs the project already has (for example a `knip` script with its config file). Ask before installing anything.
- **Verify with the project's own gates.** Read the `package.json` scripts (or Makefile and CI workflow) and run the checks CI runs: typecheck, lint with warnings as errors, any custom lint (such as oxlint or ESLint plugins), and the project's test scripts. Run each as its own command; a non-zero exit fails verification. Never chain fallbacks with `||` or `|| true`, because the fallback can pass when the real check failed. If a check also fails on files this skill did not touch, report it and do not revert for it.

## Preflight

1. **Detect language(s)** by checking for: `package.json` (TS/JS), `pyproject.toml`/`requirements.txt` (Py), `go.mod` (Go), `Cargo.toml` (Rust). Skip languages not present.
2. **Git state**: record `git status --porcelain` and skip files that already have changes (see Working rules).
3. **Report dir**: `mkdir -p $SCRATCH/cleanup-reports`.
4. **Scan for dynamic-import patterns** that defeat static analysis. Save the list — findings in these areas drop to MEDIUM confidence.
   - JS/TS: `import(`, `require(`, `eval(`, `Function(`, `__webpack_require__`, dynamic route file conventions (`pages/`, `app/`)
   - Python: `__import__`, `importlib`, `getattr`, plugin entry-points in `setup.py`/`pyproject.toml`
   - Go: `reflect.`, plugin loader, build tags
   - Rust: `cfg(feature = ...)` gates, proc-macros, `extern crate`

## Detect

Run the right tool per language. Install on demand only after asking.

### TypeScript / JavaScript
```bash
# Knip is the standard. Use the project's script and config when they exist (for example
# `"knip": "knip --config knip.jsonc"`); knip without the config reports false positives.
bun run knip -- --reporter json > $SCRATCH/knip.json
# Production reachability, recorded separately (ENGINEERING-CODE-REMOVAL-003):
bun run knip -- --production --reporter json > $SCRATCH/knip-production.json
# Only when the project has no knip script: bunx knip --reporter json > $SCRATCH/knip.json
```
Parse `files`, `exports`, `types`, `dependencies`, `devDependencies`, `unlisted`, `binaries` arrays.

### Python
```bash
uvx vulture . --min-confidence 80 > $SCRATCH/vulture.txt
```
Vulture confidence ≥80 maps roughly to our HIGH; 60-79 = MEDIUM.

### Go
```bash
# If staticcheck is missing, ask before installing it.
staticcheck -checks=U1000 ./... > $SCRATCH/staticcheck.txt
```
U1000 = unused code.

### Rust
```bash
# If cargo-machete is missing, ask before installing it.
cargo machete --with-metadata > $SCRATCH/machete.txt    # unused deps
```
Use `RUSTFLAGS="-W dead_code"` and re-build for in-crate dead code if needed.

## Assess

Write `$SCRATCH/cleanup-reports/cleanup-unused-{YYYY-MM-DD}.md` with:

```markdown
# Unused Code Assessment — YYYY-MM-DD

## Scope
- Languages detected: [TS, Py, …]
- Tools run: [knip, vulture, …]
- Dynamic-import risk areas: [list paths]

## Summary
- Unused files: N (HIGH: x, MEDIUM: y)
- Unused exports: N (HIGH: x, MEDIUM: y)
- Unused dependencies: N (HIGH: x, MEDIUM: y)
- Total LOC removable (HIGH only): ~N

## Findings

| Conf | Type | Location | Tool said | Recommendation |
|------|------|----------|-----------|----------------|
| HIGH | export | src/utils/foo.ts:12 `parseDate` | knip: unused export | Delete export + function |
| MED  | file | src/legacy/old.ts | knip: unused file | Defer — referenced from dynamic import area |
| ...

## Evidence
- Knip version, config path, workspaces analyzed, exact commands
- Ordinary and production results, recorded separately
- Final rerun output after the deletions

## Critical Assessment

[2-4 paragraphs of human-readable analysis]
- What patterns emerged? (e.g., "8 of 12 unused exports are in `lib/legacy/` — consider deleting the whole directory")
- Why were items downgraded from HIGH to MEDIUM?
- Architectural observations.

## Out of scope
- [Items the tool flagged but skill won't touch — public API surfaces, framework conventions, etc.]
```

## Apply

**Auto-apply HIGH-confidence only.** Leave the deletions uncommitted.

### Confidence rubric

**HIGH (auto-apply):**
- Tool flagged the item AND it's not in a dynamic-import risk area
- Not on a public API surface (`index.ts`, `__init__.py`, `pub` items, package `main`/`exports`)
- Has zero references in the entire repo (verify with grep, not just the tool's word)
- For deps: not used in any script, config, or runtime require

**MEDIUM (report only, don't apply):**
- Tool flagged BUT one of: in dynamic-import area, on public API surface, has indirect references (re-exports), is a type-only export from a `.d.ts` consumed externally
- Vulture confidence 60-79
- Dependencies that appear in `peerDependencies` or are used by build tooling

**LOW (note in report, no action):**
- Heuristic guesses with no tool backing
- Things the user previously declined to delete (check git log for prior reverts)

### Execution

1. Delete files only after the user approves the exact list (ENGINEERING-CODE-REMOVAL-005). Verify first that no `.gitignore`'d sibling files reference them.
2. Remove exports: `Edit` to remove the export keyword + drop the symbol if internal usage is also zero.
3. Uninstall deps: `bun remove <pkg>` / `pip uninstall <pkg>` / `cargo remove <pkg>` — pick the manager from lockfile presence.
4. Leave the changes uncommitted and list the changed files in the report.

## Verify

Run the project's own gates as separate commands (see Working rules). Typical examples: `bun run typecheck`, `bun run lint:ci`, a custom lint script such as `bun run lint:slop:ci`, and the test scripts (`bun run test:checks` or the equivalent). For other languages: `go build ./...` and `go test ./...`; `cargo check` and `cargo test`; `mypy` and `pytest` only when the project configures them.

Also rerun knip with the project's config and confirm that the removed items are gone and no new items appeared.

If a gate fails because of these deletions, restore the deleted files and edits (only files this skill changed), downgrade those items to MEDIUM, and add a "## Verify Failure" section with the error output.

## Output

End-of-turn message (≤4 lines):
- "Removed N unused items (X files, Y exports, Z deps). M deferred for review."
- Path to the report.
- Verify status (✓ all green, ✗ restored).

## NEVER

- Delete anything in `node_modules/`, `.next/`, `dist/`, `build/`, or other generated dirs.
- Delete migration files (`drizzle/*.sql`, `alembic/`, `migrations/`) even if they look unused — they describe history.
- Delete test fixtures based on knip flags — they're often loaded by glob.
- Edit a file that already had uncommitted changes when the skill started.
- Trust knip blindly for files in framework convention directories (Next.js `app/`, `pages/`, Remix `routes/`, etc.) — those have routing-based dynamic loads.
- Run `npm install --force` or any flag that bypasses lockfile integrity if a dep removal causes resolution issues.
