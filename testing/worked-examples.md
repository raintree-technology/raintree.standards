---
type: Reference
title: Testing worked examples and pilot findings
description: Applied examples showing how the testing reference changes suite naming, evidence placement, release stages, and residual-risk reporting in real repositories.
tags: [testing, examples, pilot, smoke-tests]
generated: { by: codex/gpt-5, at: "2026-08-30T21:25:13Z" }
---

# Testing worked examples and pilot findings

These are read-only strategy pilots. They demonstrate reference use without changing the pilot repositories or claiming their full conformance. Observations reflect repository state inspected August 30, 2026.

## Pilot method

The pilot asked twelve recurring questions: test type, system boundary, real dependencies, smoke scope, failure coverage, resource size, execution stage, selective execution, temporal behavior, compatibility, production verification, and test lifecycle. For each repository, the pilot inspected test files, package commands, and relevant repository instructions, then used the [field guide](field-guide.md), [recipes](recipes.md), and [testing records](../templates/testing-records.md) to produce a bounded strategy.

The pre-reference structural baseline required searching the 25-rule standard and test-strategy playbook directly. The optimized route answers common classification questions from one field-guide table and routes situation-specific work through one recipe. This is a navigation result, not a measured human comprehension time; representative-reader testing remains required before stabilization.

## Example 1 — Public website with oversized smoke suites

**Repository:** `/Users/mb1/Code/websites`

**Observed shape:** The Raintree site has a 1,200-plus-line browser command named `agent-browser-smoke.ts`. It checks browser behavior, sitemap and media responses, layout and runtime paths, content and metadata-related behavior, and application startup. The Zachary site routes both runtime SEO audit and E2E through `scripts/smoke-test.ts`, which performs broad route, metadata, redirect, and response checks. Narrow unit and contract-style tests already exist for metadata, analytics, sitemap, redirects, robots, content, and other static behavior.

**Pilot execution:** `bun run test` failed in 0.33 seconds. The Raintree workspace reported 37 passing and three failing tests: stale sitemap date cardinality, duplicate social-card imagery, and a canonical-path expectation missing `/terms`. The Zachary workspace passed 26 tests and agent-readiness passed seven. The services workspace returned “No tests found,” which makes the root orchestration fail without representing a product assertion. This supports separate suite identities and results rather than one undifferentiated root status.

**Reference diagnosis:** These commands contain useful evidence, but their names collapse smoke, browser regression, contract exposure, and release verification. `ENGINEERING-TESTING-006` does not justify deleting browser verification; it requires keeping the operability decision small and routing other claims truthfully.

**Recommended allocation:**

| Evidence | Owner | Suggested stage |
|---|---|---|
| Metadata, route, redirect, sitemap, robots, analytics, and content invariants | Existing unit or contract suites | Presubmit |
| Representative keyboard, focus, layout, navigation, storage, and runtime behavior | Browser regression suite | Presubmit or post-submit according to duration |
| Production build starts; readiness; homepage; one inner or dynamic path; missing route; essential response wiring; artifact identity | New bounded `test:smoke` | Build and deployment |
| DNS, TLS, deployed headers, provider configuration, and public artifact identity | Release or deployed verification | Deployment gate |
| Bounded public operation after release | Synthetic | Post-deployment |

**Rename before deletion:** Preserve the current broad browser evidence under an honest regression or release-verification command while extracting a small smoke command. Remove duplicate assertions only after tracing them to authoritative lower-layer ownership.

**Pilot finding:** The quick comparison table resolves the original “smoke tests are pointless” concern: smoke is useful as a small continuation gate; the problem is misclassification and excessive scope.

## Example 2 — Service and static-data API

**Repository:** `/Users/mb1/Code/raintree/buildergraph`

**Observed shape:** The root check runs TypeScript validation, Vitest, static-data validation, and a web check. The test suite protects stable lowercase shards, grouping, and duplicate public identities. Separate commands build, validate, and release-check generated static intelligence. Repository instructions restrict public data, outbound GitHub enrichment, secrets, pagination, and rate limiting.

**Pilot execution:** `npm run check` passed in 7.25 seconds. Three Vitest checks passed, 13 generated static-data files were verified, TypeScript passed, and the production web build completed. The result is useful but combines transformation tests, artifact validation, type evidence, and production-build qualification under one command, confirming the need to report constituent claims separately.

**Reference diagnosis:** The current tests are narrow and valuable, but the suite inventory should distinguish transformation rules, generated-artifact contracts, public API exposure, enrichment-worker integration, and release qualification. A single root `check` command is an orchestration entry point, not a test layer.

**Recommended allocation:**

| Claim | Evidence |
|---|---|
| Shard naming, grouping, identity uniqueness, and deterministic transformation | Unit/property checks around the builder |
| Generated `/api/v1` shape, bounds, and public-field policy | Contract check against built artifacts |
| Web application reads supported artifacts and handles missing/stale data | Component or integration checks |
| GitHub enrichment budget, conditional requests, cache-table-only writes, timeouts, duplicate work, and stale fallback | Isolated contract plus bounded integration checks |
| Exact generated production corpus satisfies release constraints | Existing `release:check`, classified as release qualification |
| Deployed routes expose the expected artifact with rate limiting | Bounded deployment smoke or synthetic |

**Compatibility record:** If generated artifacts and readers can deploy separately, add old-reader/new-artifact and new-reader/old-artifact rows under `ENGINEERING-TESTING-022`.

**Pilot finding:** The reference prevents over-prescribing E2E. Most critical rules belong to deterministic transformation and artifact-contract evidence; only deployed exposure needs a broad boundary.

## Example 3 — Data reconciliation and generated documents

**Repository:** `/Users/mb1/Code/personal/jobs`

**Observed shape:** Python tests cover historical/new record compatibility, artifact hashes, dashboard reconciliation, persistent decisions, source deduplication, banned claims, output geometry, links, archives, and registered artifacts. Separate check commands reconcile journals, tracker state, and cleaned data. The repository produces generated documents and maintains historical state rather than a deployed service.

**Pilot execution:** `bun run validate` passed in 8.54 seconds. Lint, journal index, tracker reconciliation, data cleanliness, and 27 Python tests passed. The run verified 235 applications, 255 cleaned records, 89 contacts, 61 linked contacts, and generated-document behavior. These are distinct data-quality, reconciliation, contract, and exact-artifact claims even though one command orchestrates them.

**Reference diagnosis:** This is a data and artifact pipeline. “Unit versus E2E” is less useful than distinguishing source-contract, transformation, reconciliation, generated-artifact, and historical-compatibility claims. Production canaries and deployment smoke are generally inapplicable.

**Recommended allocation:**

| Claim | Evidence |
|---|---|
| Record schema, status rules, exact registries, and banned claims | Contract and unit checks |
| Historical records remain readable while new records require stronger fields | Compatibility matrix and regression checks |
| Reconciliation does not mutate authoritative sources unexpectedly | Integration-style check with isolated fixtures and final-state comparison |
| Generated resume has links, one-page bounds, and safe margins | Exact-artifact acceptance checks |
| Archive hashes and installed outputs remain aligned | Artifact-integrity and lifecycle checks |
| Journal and data check commands detect drift without writing | Dry-run classification with explicit skipped-write limitation |

**Temporal record:** Date-sensitive active/inactive status and archive behavior should use a controlled date boundary if current tests derive behavior from wall time.

**Pilot finding:** The architecture-aware rule avoids forcing browser, canary, or service-style evidence onto a local data workflow. Compatibility and final-state reconciliation matter more.

## Cross-pilot findings

1. **Command names are not evidence types.** `check`, `validate`, and `test:e2e` often orchestrate several claims. The reference must inventory constituent suites.
2. **Smoke remains useful only as a continuation decision.** Website pilots need it; the local data pipeline generally does not.
3. **Layer labels require a declared system boundary.** A whole service can be a component in one strategy and the system under test in another.
4. **Compatibility deserves first-class treatment.** Generated artifacts and historical records create version windows even without a network API.
5. **Exact-artifact checks are frequently misnamed E2E or smoke.** Release qualification is a clearer stage and claim.
6. **Templates must be optional by applicability.** Requiring canary, production-data, or selective-execution records in every repository would create paperwork without evidence value.
7. **The standard should remain the policy owner.** Recipes and examples must link to rules and may not introduce independent “must” statements.

## Usability baseline and retest

| Question | Before | Optimized route | Remaining validation |
|---|---|---|---|
| Is this smoke? | Read rule `ENGINEERING-TESTING-006` plus guidance and examples | Field-guide comparison table, then smoke recipe | Representative-reader timing |
| Where should an assertion live? | Search taxonomy, E2E, and contract rules | Thirty-second path and test-type cards | Ambiguous component boundaries |
| Which stage runs it? | Read `ENGINEERING-TESTING-014` and playbook | Execution-stage table | Project-specific deadlines |
| How do we quarantine it? | Read `ENGINEERING-TESTING-010`, `ENGINEERING-TESTING-017`, `ENGINEERING-TESTING-025` | Flaky-test recipe plus quarantine record | Owner workflow integration |
| How do we test migration rollback? | Read `ENGINEERING-TESTING-022` | Migration recipe plus compatibility matrix | Real migration pilot |
| What does canary pass mean? | Read `ENGINEERING-TESTING-024` | Canary card and decision record | Service-specific signals and thresholds |

The structural retest reduces the normal path to one reference page plus, when needed, one recipe or template. It does not establish human comprehension or adoption quality. Use the repository's comprehension-review template with independent representative readers before declaring the reference stable.

The pilots intentionally did not edit their repositories, remove tests, or change CI. They therefore provide current command duration and defect-signal evidence, not before-and-after performance or defect-yield claims. The website run did expose three stale contract expectations plus a workspace with no tests; the other two repositories passed their existing gates. A later implementation pilot should record renamed or moved tests, smoke duration, merge feedback time, flake rate, diagnostic time, and defects detected before and after adoption.
