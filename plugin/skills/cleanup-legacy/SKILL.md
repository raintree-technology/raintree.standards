---
name: cleanup-legacy
description: "Find and remove deprecated, legacy, and fallback code paths with zero callers. Verifies callers via repo grep + LSP before deletion. Removes unreachable fallback branches. Use when the user asks to remove deprecated code, clean up legacy paths, drop fallbacks, or simplify code branches."
argument-hint: "[scope (optional path or glob)]"
user-invocable: true
---

Find code marked deprecated/legacy/old/v1 and verify it's truly unused before deletion. Also find unreachable fallback branches (e.g., feature flag defaults that have flipped, version checks for unsupported runtimes).

## Governing standard

Removal follows Raintree Standard `ENGINEERING-CODE-REMOVAL` (`raintree.standards/engineering/code-removal.md`). Where this file and the standard differ, the standard wins. In particular, do not remove retained data, schema, credentials, feature flags, fallback paths, or operational signals merely because their current reader was deleted (ENGINEERING-CODE-REMOVAL-005).

## Working rules

These apply to every step below and override anything later in this file.

- **No commits.** Leave changes uncommitted and list the changed files in the report. Commit only when the user asks.
- **Other work in the tree.** Record `git status --porcelain` before starting. Do not edit a file that already had changes, and never stash, reset, or check out anyone else's work. To undo this skill's edit to a file, restore only that file; `git checkout -- <file>` is safe only for files that were clean at the start.
- **Scratch space.** Write tool output and the report under `$SCRATCH`: the session scratchpad directory when one is listed, otherwise a `mktemp -d` directory. Do not write to `/tmp`, `.claude/`, or `.gitignore`.
- **Tools.** Prefer tools and configs the project already has (for example a `knip` script with its config file). Ask before installing anything.
- **Verify with the project's own gates.** Read the `package.json` scripts (or Makefile and CI workflow) and run the checks CI runs: typecheck, lint with warnings as errors, any custom lint (such as oxlint or ESLint plugins), and the project's test scripts. Run each as its own command; a non-zero exit fails verification. Never chain fallbacks with `||` or `|| true`, because the fallback can pass when the real check failed. If a check also fails on files this skill did not touch, report it and do not revert for it.

## Preflight

1. **Language detect** — applies to all.
2. **Git state**: record `git status --porcelain` and skip files that already have changes (see Working rules).
3. **Report dir**: `mkdir -p $SCRATCH/cleanup-reports`.
4. **Read deprecation markers** the project uses. Common ones:
   - `@deprecated` JSDoc/TSDoc
   - `# deprecated` Python comments, `warnings.warn(DeprecationWarning)`
   - `// Deprecated:` Go convention
   - `#[deprecated]` Rust attribute
   - File/dir naming: `legacy/`, `old/`, `v1/`, `_old.ts`
5. **Read feature flag config** if present — flags that are 100% on with no opposite tests can have their `else` branches deleted.

## Detect

### Marker grep (multi-language)
```bash
grep -rn --include="*.ts" --include="*.tsx" --include="*.js" --include="*.py" --include="*.go" --include="*.rs" \
  -E "(@deprecated|# ?deprecated|// ?Deprecated|#\[deprecated|warnings\.warn.*Deprecation|TODO.*remove|FIXME.*legacy)" \
  --exclude-dir=node_modules --exclude-dir=dist . > $SCRATCH/deprecated.txt

# Files/dirs with legacy naming
find . -type d \( -name "legacy" -o -name "old" -o -name "v1" -o -name "_archive" \) -not -path "*/node_modules/*" > $SCRATCH/legacy-dirs.txt
find . -type f \( -name "*_old.*" -o -name "*-legacy.*" -o -name "*.deprecated.*" \) > $SCRATCH/legacy-files.txt
```

### Caller verification (TS/JS)
For each deprecated symbol, count references using ts-server / LSP if available, fall back to grep:
```bash
# For function `oldFn` exported from `lib/old.ts`:
grep -rn "oldFn" --include="*.ts" --include="*.tsx" . | grep -v "lib/old.ts" | wc -l
```

### Caller verification (Python)
```bash
grep -rn "from .*old_mod import\|import old_mod" --include="*.py" .
```

### Fallback branches
Look for patterns:
- `if (process.env.NEW_FEATURE === 'true') { /* new */ } else { /* old */ }` — if env always true in all configs, old branch is dead.
- `if version >= 2: /* new */ else: /* old */` — if min version bumped past threshold.
- Browser/runtime checks for unsupported environments (`if (typeof window === 'undefined')` in a browser-only package).

## Assess

Write `$SCRATCH/cleanup-reports/cleanup-legacy-{YYYY-MM-DD}.md`:

```markdown
# Legacy Code Assessment — YYYY-MM-DD

## Summary
- Deprecated symbols found: N
  - HIGH (zero callers): X — safe to delete
  - MEDIUM (1-5 callers): Y — needs migration
  - LOW (heavy use): Z — deprecated in name but actively used
- Legacy directories: M
- Dead fallback branches: K

## Findings

### HIGH — `packages/utils/src/format-old.ts`
- Marked `@deprecated` since commit abc123 (2024-08-15).
- Exports: `formatV1`, `parseV1`. Repo grep shows zero usages outside the file.
- Action: delete file.

### HIGH — `apps/app/lib/feature-flags.ts:45-60`
- Branch: `if (NEW_DASHBOARD_ENABLED) { ... } else { renderOldDashboard() }`.
- Flag is `true` in all envs (`.env`, `.env.staging`, `.env.production`) and has been for 6+ months per git log.
- Action: remove the else branch + the flag check + the `renderOldDashboard` function (cascade).

### MEDIUM — `domains/billing/legacy.ts`
- 8 callers across 3 packages.
- Marked deprecated 3 months ago. Migration path documented in inline comment to use `domains/billing/v2`.
- Recommendation: do NOT delete. Provide a migration list to the human; this needs sequencing.

### LOW — `lib/utils/oldHelper.ts`
- Marked `@deprecated` but has 47 active callers.
- Either the deprecation is aspirational with no migration plan, or it was incorrectly marked. Flag for human review of the deprecation.

## Critical Assessment
[2-3 paragraphs: what's the pattern of deprecation in this codebase? Are deprecations followed by deletion? Are there feature flags that should have been cleaned up months ago? Are "legacy" directories accumulating but not draining?]
```

## Apply

**Auto-delete HIGH only.**

### Confidence rubric

**HIGH (auto-delete):**
- Marked deprecated AND zero references in the repo (verified by grep across all relevant extensions, NOT just the file's own).
- Fallback branch where the condition is provably always-true or always-false in all environments AND has been so for 90+ days (per git blame on the env file).
- Files in `legacy/` or `_archive/` directories with zero references in non-legacy code.

**MEDIUM (report only):**
- Deprecated with 1-N callers — needs migration plan.
- Fallback branch where condition varies by env or is recent.
- Symbols deprecated <30 days ago — give consumers time.

**LOW (note only):**
- Symbols marked deprecated but heavily used — the deprecation itself is suspect.
- Fallback branches handling user-input/runtime conditions (not feature flags) — these aren't dead code, they're real branches.

### Execution (HIGH only)

1. Delete file or remove block.
2. Cascade: if the deleted code was the only consumer of an internal helper, that helper is now also dead — re-run the caller check on it. Iterate until stable.
3. Report the now-unused feature flag declaration (env var, config entry, flag service definition) for the user to remove. Do not delete it yourself: its lifecycle may involve deploy config and other environments.
4. Leave the changes uncommitted and list the changed files in the report.

## Verify

Run the project's own gates as separate commands (see Working rules). Typical examples: `bun run typecheck`, `bun run lint:ci`, a custom lint script such as `bun run lint:slop:ci`, and the test scripts (`bun run test:checks` or the equivalent). For other languages: `go build ./...` and `go test ./...`; `cargo check` and `cargo test`; `mypy` and `pytest` only when the project configures them.

Rerun the project's knip script with its config. Newly orphaned exports may surface; report them for the next `cleanup-unused` pass.

If a gate fails, restore the files this skill changed and downgrade those items. The cascade step is the most likely cause: a "dead" helper may have a caller that the first grep missed.

## Output

- "Removed N deprecated items, M dead branches. K items deferred for migration planning."
- Report path.
- Verify status.

## NEVER

- Delete a `@deprecated` symbol while it has any callers, even if the migration looks "obvious."
- Remove a feature flag branch without checking ALL config environments (`.env*`, `config/*.json`, flag service settings).
- Delete files in `legacy/` directories that other production code still imports — verify first.
- Remove version-check branches in libraries that support multiple runtime versions (e.g., a polyfill).
- Delete migration files, even if they're "old."
- Remove a fallback branch protecting against runtime conditions (network failure, missing env, etc.) — those aren't dead code.
- Auto-remove a feature flag definition while CI/CD or infrastructure references it (check Terraform, GitHub Actions, deployment scripts).
