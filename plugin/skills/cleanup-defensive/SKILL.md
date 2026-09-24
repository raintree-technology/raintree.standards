---
name: cleanup-defensive
description: "Remove pointless try/catch blocks and defensive guards that hide errors or add no value. Preserves catches at true system boundaries (HTTP handlers, CLI entry, message consumers). Use when the user asks to remove try/catch, fix error hiding, clean up defensive code, or stop swallowing errors."
argument-hint: "[scope (optional path or glob)]"
user-invocable: true
---

Remove try/catch and defensive null-checks that don't serve a real role. The goal is errors that propagate cleanly to the boundary that knows how to handle them, not silent fallbacks that hide bugs.

**Core principle**: catch only when you can do something more useful than the default propagation — and "log and rethrow" is rarely more useful than just letting it throw.

## Working rules

These apply to every step below and override anything later in this file.

- **No commits.** Leave changes uncommitted and list the changed files in the report. Commit only when the user asks.
- **Other work in the tree.** Record `git status --porcelain` before starting. Do not edit a file that already had changes, and never stash, reset, or check out anyone else's work. To undo this skill's edit to a file, restore only that file; `git checkout -- <file>` is safe only for files that were clean at the start.
- **Scratch space.** Write tool output and the report under `$SCRATCH`: the session scratchpad directory when one is listed, otherwise a `mktemp -d` directory. Do not write to `/tmp`, `.claude/`, or `.gitignore`.
- **Tools.** Prefer tools and configs the project already has (for example a `knip` script with its config file). Ask before installing anything.
- **Verify with the project's own gates.** Read the `package.json` scripts (or Makefile and CI workflow) and run the checks CI runs: typecheck, lint with warnings as errors, any custom lint (such as oxlint or ESLint plugins), and the project's test scripts. Run each as its own command; a non-zero exit fails verification. Never chain fallbacks with `||` or `|| true`, because the fallback can pass when the real check failed. If a check also fails on files this skill did not touch, report it and do not revert for it.

## Preflight

1. **Language detect**: TS/JS, Python, Go (`if err != nil` patterns), Rust (`unwrap_or`/`map_err` chains that smell defensive).
2. **Git state**: record `git status --porcelain` and skip files that already have changes (see Working rules).
3. **Report dir**: `mkdir -p $SCRATCH/cleanup-reports`.
4. **Identify boundary files** — preserve catches in:
   - HTTP request handlers (`app/api/`, `routes/`, Hono/Express/FastAPI handlers)
   - CLI entry points (files with `if __name__ == "__main__"`, `bin/*`, `cmd/*`)
   - Message/queue consumers (worker entry points, cron handlers)
   - Test files (test runners need failures localized)
   - Calls to external services: network, database, queues, third-party APIs, and model or classifier calls. A catch there that returns `null`, an empty value, or a default is usually a deliberate fallback.
5. **Find documented fallbacks**: a catch is deliberate when a comment beside it explains the fallback, or when a test asserts the fallback value. Treat both as LOW (preserve).

## Detect

### TypeScript / JavaScript
```bash
# Find every try/catch
grep -rn --include="*.ts" --include="*.tsx" --include="*.js" -B1 -A5 "try {" \
  --exclude-dir=node_modules --exclude-dir=.next . > $SCRATCH/try-catches.txt

# The project linter can flag the obvious useless ones: Biome `lint/complexity/noUselessCatch`,
# or ESLint `no-useless-catch` with the project's own config. Do not install a linter for this.
bunx biome lint --only=complexity/noUselessCatch . > $SCRATCH/useless-catch.txt 2>&1
```

Categorize each catch block by content:
- **Rethrow only**: `catch (e) { throw e }` or `catch (e) { throw new Error(...) }` with no context added
- **Swallow + null/empty return**: `catch { return null }`, `catch { return [] }`, `catch { return {} }`
- **Swallow + log only**: `catch (e) { console.error(e) }` then continue silently
- **Log + rethrow**: `catch (e) { logger.error(e); throw e }` — usually pointless if a global handler logs
- **Substantive**: actually does cleanup, retries, returns a typed Result, transforms the error meaningfully

### Python
```bash
grep -rn --include="*.py" -B1 -A5 "try:" . > $SCRATCH/py-try.txt
# Bare except is always defensive
grep -rn --include="*.py" -E "except\s*:|except\s+Exception\s*:" . > $SCRATCH/py-bare-except.txt
```

### Go
```bash
# Find error-swallowing patterns: ignored errors, generic fallbacks
grep -rn --include="*.go" -E "_ = .*\.Err|_, _ =" . > $SCRATCH/go-ignored.txt
```

### Rust
```bash
grep -rn --include="*.rs" -E "\.unwrap_or\(|\.unwrap_or_default\(|\.ok\(\)" . > $SCRATCH/rust-defensive.txt
```

## Assess

Write `$SCRATCH/cleanup-reports/cleanup-defensive-{YYYY-MM-DD}.md`:

```markdown
# Defensive Code Assessment — YYYY-MM-DD

## Summary
- try/catch blocks scanned: N
- HIGH (remove): X — pure rethrow, swallow-and-return-null, useless wrappers
- MEDIUM (review): Y — log+rethrow, broad excepts with context
- LOW (preserve): Z — substantive handling, boundary code

## Findings

### HIGH — `lib/parse.ts:45`
```ts
try {
  return JSON.parse(s)
} catch (e) {
  return null
}
```
**Problem**: caller can't distinguish "valid JSON null" from "parse failed". Hides bugs.
**Fix**: remove try; let JSON.parse throw. If callers need optional, change return to `Result<T, ParseError>` or have caller wrap.

### HIGH — `services/user.ts:88`
```ts
try {
  return await fetchUser(id)
} catch (e) {
  throw e
}
```
**Problem**: literally a no-op wrapper.
**Fix**: remove try/catch entirely.

### MEDIUM — `services/payment.ts:120`
```ts
try {
  await charge(amount)
} catch (e) {
  logger.error('charge failed', { e, userId })
  throw e
}
```
**Problem**: log+rethrow. If global handler also logs, this is duplication.
**Recommendation**: check if there's a global error logger. If yes, remove. If the contextual data (`userId`) isn't otherwise captured, keep but add a note.

### LOW — `app/api/[...path]/route.ts:34` — preserve, this is the API boundary.

## Critical Assessment
[2-3 paragraphs on patterns: is this codebase prone to silent fallbacks? Are there layers wrapping errors unnecessarily?]
```

## Apply

**Auto-remove HIGH only.**

### Confidence rubric

**HIGH (auto-remove):**
- `try { x } catch { } ` (silent swallow, no return)
- `try { x } catch (e) { throw e }` (no-op)
- `try { x } catch (e) { throw new Error(e.message) }` (loses stack, adds nothing)
- `try { x } catch { return null/undefined/[]/{}/0 }` (silent fallback that hides errors), and the same with `.catch(() => null)`. Only when ALL of these hold: the file is not a boundary file, the guarded call does no I/O (no network, database, filesystem, queue, or model call), no comment explains the fallback, and no test asserts the fallback value
- Python `except: pass` blocks
- Go: `_ = someCall()` where the discarded value is `error`

**MEDIUM (report only):**
- Log + rethrow (might be intentional observability)
- Catch with retry logic
- Catch in middleware (might be intentional last-resort)
- `unwrap_or(default)` where default is a real value (might be intentional)
- A swallow-and-return-null around an I/O call with no comment or test. It may still be deliberate, so ask.

**LOW (preserve):**
- Inside boundary files (see preflight list)
- Inside `__init__.py` import-time error handlers (compatibility fallbacks)
- Catches that transform exception type meaningfully (e.g., `catch DBError { throw new ValidationError() }`)
- Cleanup catches with `finally` doing real work
- Fallbacks around external-service or model calls, and any catch whose comment or test documents the fallback

### Execution

For each HIGH:
1. Remove the try wrapper, keep the body's expression.
2. If the function signature implied "may return null on error" because of the catch, that signature is now lying — flag for human review (do NOT change signatures automatically).
3. Leave the changes uncommitted and list the changed files in the report.

## Verify

Run the project's own gates as separate commands (see Working rules). Typical examples: `bun run typecheck`, `bun run lint:ci`, a custom lint script such as `bun run lint:slop:ci`, and the test scripts (`bun run test:checks` or the equivalent). For other languages: `go build ./...` and `go test ./...`; `cargo check` and `cargo test`; `mypy` and `pytest` only when the project configures them.

Tests are critical here: removing a swallowed error often surfaces a real bug that was being hidden. If tests fail:
1. Read the failure carefully. Either it surfaces a real bug (flag it for the human, and do not fix it), or a catch the tests depend on was removed.
2. Default action: restore that file and downgrade the finding to MEDIUM. The human decides whether the surfaced failure is a bug to fix.

## Output

- "Removed N useless try/catch blocks. M deferred for review."
- Report path.
- Verify status. If tests surfaced previously-hidden errors: highlight clearly with "⚠️ Real errors surfaced — see report."

## NEVER

- Remove a catch in a request handler, route, message consumer, or CLI entrypoint.
- Remove a catch with `finally` that does cleanup (closing resources, releasing locks).
- Remove a catch that converts one error type to another semantically meaningful one.
- "Fix" Go's `if err != nil { return err }` patterns — that IS the proper Go way, not defensive code.
- Remove `unwrap()` from Rust without understanding the precondition; replacement should be `expect("reason")` minimum, or proper handling.
- Remove a Python `except` without checking if it's catching a specific expected exception.
- Modify error handling to "make tests pass" — the test failure may be the actual bug.
- Remove a fallback around a network, database, or model call on the grounds that it "hides errors" — degrading gracefully is its job.
