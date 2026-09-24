---
name: cleanup-types
description: "Find duplicated or fragmented type/interface definitions across files and consolidate to a shared types module. TypeScript-first; also handles Python dataclasses/TypedDicts and Go structs. Use when the user asks to consolidate types, find duplicate interfaces, or organize type definitions."
argument-hint: "[scope (optional path or glob)]"
user-invocable: true
---

Find type definitions that should be shared but are duplicated across files. Consolidate into a single source of truth. Conservative by default — type consolidation looks safe but can hide intentional divergence.

## Working rules

These apply to every step below and override anything later in this file.

- **No commits.** Leave changes uncommitted and list the changed files in the report. Commit only when the user asks.
- **Other work in the tree.** Record `git status --porcelain` before starting. Do not edit a file that already had changes, and never stash, reset, or check out anyone else's work. To undo this skill's edit to a file, restore only that file; `git checkout -- <file>` is safe only for files that were clean at the start.
- **Scratch space.** Write tool output and the report under `$SCRATCH`: the session scratchpad directory when one is listed, otherwise a `mktemp -d` directory. Do not write to `/tmp`, `.claude/`, or `.gitignore`.
- **Tools.** Prefer tools and configs the project already has (for example a `knip` script with its config file). Ask before installing anything.
- **Verify with the project's own gates.** Read the `package.json` scripts (or Makefile and CI workflow) and run the checks CI runs: typecheck, lint with warnings as errors, any custom lint (such as oxlint or ESLint plugins), and the project's test scripts. Run each as its own command; a non-zero exit fails verification. Never chain fallbacks with `||` or `|| true`, because the fallback can pass when the real check failed. If a check also fails on files this skill did not touch, report it and do not revert for it.

## Preflight

1. **Language detect**: TS/JS (primary), Python (dataclass, TypedDict, Pydantic), Go (struct), Rust (struct/enum).
2. **Git state**: record `git status --porcelain` and skip files that already have changes (see Working rules).
3. **Report dir**: `mkdir -p $SCRATCH/cleanup-reports`.
4. **Identify type homes**: where does the project already keep shared types? Look for `types/`, `models/`, `schema/`, package boundaries.

## Detect

No off-the-shelf tool reliably finds semantically equivalent types across languages. Use AST scanning + grep + structural comparison.

### TypeScript
```bash
# Find every `interface Foo` and `type Foo =` declaration
# Group by name, then by structural shape
grep -rn --include="*.ts" --include="*.tsx" -E "^export (interface|type) [A-Z]" . > $SCRATCH/ts-types.txt
```

For each name that appears in 2+ files, compare the shapes. Use `tsc --listFiles --noEmit` output combined with the TypeScript compiler API if available, OR fall back to textual comparison after normalizing whitespace.

### Python
```bash
# Find dataclass / TypedDict / Pydantic models
grep -rn --include="*.py" -E "^(class \w+\(.*?(BaseModel|TypedDict)\)|@dataclass)" . > $SCRATCH/py-types.txt
```

### Go
```bash
grep -rn --include="*.go" -E "^type \w+ struct" . > $SCRATCH/go-types.txt
```

### Rust
```bash
grep -rn --include="*.rs" -E "^pub (struct|enum) \w+" . > $SCRATCH/rust-types.txt
```

**Cross-reference**: for each type name, check if multiple files define it. For each pair, compare field-by-field.

## Assess

Write `$SCRATCH/cleanup-reports/cleanup-types-{YYYY-MM-DD}.md`:

```markdown
# Type Consolidation Assessment — YYYY-MM-DD

## Summary
- Type names with 2+ definitions: N
- HIGH (structurally identical): X
- MEDIUM (overlapping fields, may diverge intentionally): Y
- LOW (same name, different meaning): Z

## Findings

### `User` interface — HIGH
- Definitions:
  - `apps/app/features/auth/types.ts:8` — `{ id: string; email: string; createdAt: Date }`
  - `apps/admin/features/users/types.ts:12` — `{ id: string; email: string; createdAt: Date }`
- Identical shape. Consolidate to `packages/db/src/schema/user.ts` (already has the runtime model).

### `Account` interface — MEDIUM
- `domains/account/types.ts` — has 8 fields including `permissions: string[]`
- `features/billing/types.ts` — has 5 of those 8 fields, no `permissions`.
- Likely the billing one is a deliberate slice. Recommend: keep both, but rename billing's to `BillingAccount` for clarity. Don't auto-apply.

### `Config` type — LOW (different concepts)
- `lib/api-config.ts` — API client config
- `lib/feature-config.ts` — feature flag config
- Same name, unrelated. Recommendation: rename one for clarity, but no consolidation.

## Critical Assessment
[2-3 paragraphs: are types fragmented because there's no shared package, or because the architecture intentionally separates concerns?]
```

## Apply

**Auto-consolidate HIGH only.** Type consolidation often crosses package boundaries and reshapes import graphs — be conservative.

### Confidence rubric

**HIGH (auto-apply):**
- Same type name in 2+ files.
- Field names, types, and modifiers (optional, readonly) all match exactly.
- Same semantic concept (verify by usage — both used for the same domain entity).
- Existing shared types module exists in the workspace.

**MEDIUM (report only):**
- Overlapping fields with intentional divergence (one has extras, one omits some).
- Same shape but different name — could be a renaming opportunity, but choosing the canonical name is judgment.
- Cross-package consolidation that requires creating a new shared package.

**LOW (note only):**
- Same name, different meaning (Config, Options, Result are common offenders).
- Generated types (from OpenAPI, GraphQL, Drizzle schema, etc.) — leave the codegen alone.

### Execution (HIGH only)

1. Choose canonical home: existing shared types module that both source files can import.
2. Move the type definition there (preserve JSDoc/comments).
3. Replace both originals with `import type { Foo } from '...'`.
4. Run typecheck — if any error appears (often due to nominal typing differences in TS, or generic param mismatches), revert that one and downgrade.
5. Leave the changes uncommitted and list the changed files in the report.

## Verify

The typecheck is the critical signal. Run the project's own gates as separate commands (see Working rules). Typical examples: `bun run typecheck`, `bun run lint:ci`, a custom lint script such as `bun run lint:slop:ci`, and the test scripts (`bun run test:checks` or the equivalent). For other languages: `go build ./...` and `go test ./...`; `cargo check` and `cargo test`; `mypy` and `pytest` only when the project configures them.

Consolidation that breaks a consumer shows up here, for example a consumer that relied on a field being optional in one definition and required in the other. Restore the affected files on any new error.

## Output

- "Consolidated N duplicate type definitions. M deferred for review."
- Report path.
- Verify status.

## NEVER

- Auto-consolidate generated types (Drizzle inferred types, OpenAPI codegen, Prisma types, GraphQL schema types) — regenerate is the right answer.
- Merge a `Foo` from a public-API package with a `Foo` from a private app package — that breaks the API contract.
- Create a new shared package automatically.
- Consolidate types that have nominal markers (branded types, opaque types) — those exist precisely to *not* be merged.
- Touch types in `*.d.ts` ambient declaration files unless the source is also a `.d.ts`.
- Auto-rename — renaming has cascading effects and needs human sign-off.
