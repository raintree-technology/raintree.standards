---
type: Reference
title: Testing field guide
description: Rapid decisions for selecting test evidence, naming suites, placing gates, and interpreting smoke, synthetic, shadow, and canary results.
tags: [testing, field-guide, smoke-tests, continuous-integration]
generated: { by: codex/gpt-5, at: "2026-08-30T21:25:13Z" }
---

# Testing field guide

Use this guide to route a testing decision in less than five minutes. It summarizes [ENGINEERING-TESTING](../engineering/testing.md); cited rule IDs are authoritative.

## Thirty-second decision path

1. **Name the claim and failure consequence.** If neither is clear, stop and build the behavior-to-evidence map (`ENGINEERING-TESTING-001`).
2. **Choose the narrowest faithful boundary.** Controlled inputs and outputs suggest unit or component; a declared interface suggests contract; real cooperating boundaries suggest integration (`ENGINEERING-TESTING-002`, `ENGINEERING-TESTING-008`).
3. **Add only the fidelity the claim needs.** Browser behavior needs a browser. Deployment configuration needs the exact deployed artifact. Live rollout comparison needs a canary (`ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-014`, `ENGINEERING-TESTING-024`).
4. **Place the evidence where it can change a decision.** Fast changed-behavior checks belong early; exact-artifact and live evidence belong later. Deferred checks need an owner, deadline, and release enforcement point (`ENGINEERING-TESTING-014`).
5. **State what passing permits.** A smoke pass permits deeper verification or limited traffic; it does not establish full correctness (`ENGINEERING-TESTING-006`).

## Test-type cards

| Type | Primary use | Usually real | Do not use as proof of | Typical stage | Governing rules |
|---|---|---|---|---|---|
| Unit | Isolated rules, transformations, and state transitions | No external boundary | Assembly or deployment | Local, presubmit | `ENGINEERING-TESTING-002`, `ENGINEERING-TESTING-003`, `ENGINEERING-TESTING-004` |
| Component | One component's behavior in a controlled harness | Component runtime; dependencies commonly substituted | Cross-service compatibility | Local, presubmit | `ENGINEERING-TESTING-002`, `ENGINEERING-TESTING-003`, `ENGINEERING-TESTING-013` |
| Contract | Schema, protocol, compatibility, or public-interface promise | Contract implementation or generated artifact | Full journey or provider availability | Presubmit, provider CI, release | `ENGINEERING-TESTING-002`, `ENGINEERING-TESTING-008`, `ENGINEERING-TESTING-022` |
| Integration | Cooperation across named real boundaries | Two or more owned boundaries | Every business-rule permutation | Presubmit, post-submit | `ENGINEERING-TESTING-002`, `ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-016` |
| End-to-end | Representative material journey across required boundaries | Journey-critical boundaries | Exhaustive rules, routes, or viewports | Presubmit, release | `ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-009`, `ENGINEERING-TESTING-015` |
| Regression | Previously important or failed behavior | Whatever faithful boundary owns the defect | A particular test layer | Same stage as owning risk | `ENGINEERING-TESTING-001`, `ENGINEERING-TESTING-008`, `ENGINEERING-TESTING-025` |
| Acceptance | Requested outcomes and business rules | Boundary that can observe acceptance | Internal implementation completeness | Presubmit, release qualification | `ENGINEERING-TESTING-001`, `ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-015` |
| Smoke | Basic operability of the final artifact | Built or deployed artifact | Complete correctness or regression coverage | Build, deployment | `ENGINEERING-TESTING-006`, `ENGINEERING-TESTING-014` |
| Synthetic | Scripted bounded operation against a released environment | Released environment | Comparison of new versus stable populations | Post-deployment | `ENGINEERING-TESTING-002`, `ENGINEERING-TESTING-009`, `ENGINEERING-TESTING-014` |
| Shadow or dry run | High-fidelity comparison with intended effects isolated or suppressed | Representative traffic or data | Effects that were skipped | Release, production exercise | `ENGINEERING-TESTING-018`, `ENGINEERING-TESTING-023` |
| Canary | Limited live exposure compared with stable control | Live traffic or population | Harms the selected signals cannot observe | Deployment | `ENGINEERING-TESTING-014`, `ENGINEERING-TESTING-024` |
| Performance | Latency, throughput, responsiveness, or resource budgets | Boundary needed for the budget | Functional completeness | Post-submit, release | `ENGINEERING-TESTING-002`, `ENGINEERING-TESTING-016` |
| Resilience | Degradation, interruption, recovery, and reconciliation | Failure boundary under test | All production failure combinations | Post-submit, release, exercise | `ENGINEERING-TESTING-005`, `ENGINEERING-TESTING-023` |
| Security | Abuse, authority, confidentiality, integrity, and trust boundaries | Boundary required by the threat | General functional completeness | Presubmit, post-submit, release | `ENGINEERING-TESTING-001`, `ENGINEERING-TESTING-005`, `ENGINEERING-TESTING-009`, `ENGINEERING-TESTING-012` |
| Accessibility | Perception and operation through required input and assistive modes | Component, browser, assistive technology, and human review as applicable | Full accessibility from one automated scanner | Presubmit, release qualification | `ENGINEERING-TESTING-001`, `ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-015` |

Layer names are scope-relative. Always name the system under test, objective, real and simulated dependencies, environment, and gating stage (`ENGINEERING-TESTING-002`).

## Smoke, synthetic, shadow, and canary

| Question | Smoke | Synthetic | Shadow or dry run | Canary |
|---|---|---|---|---|
| Decision | May deeper verification or limited traffic begin? | Does a bounded released-system operation still work? | Does candidate behavior match without unintended effects? | May live exposure expand? |
| Traffic | Synthetic or harmless probe | Scripted | Copied, replayed, or production-shaped | Limited live population |
| Comparison | Expected operability | Expected result or service objective | Candidate versus authoritative result | Candidate versus concurrent control plus absolute limits |
| Writes | Harmless and repeatable | Explicitly bounded | Suppressed or isolated unless approved | Real effects within approved blast radius |
| Main limitation | Shallow by design | Does not represent all organic behavior | Skipped effects remain unproved | Users can be affected and metrics can miss harm |

## Execution stages

| Stage | Decision | Suitable evidence | Required control |
|---|---|---|---|
| Local | Is the changed behavior ready to propose? | Narrow unit, component, contract, focused integration | Fast and directly runnable |
| Presubmit | May the change merge? | Changed-risk checks and protected invariants | No silent workspace skips; conservative selector fallback |
| Post-submit | Did broader evidence find a regression? | Larger integration, browser, performance, fuzz, compatibility | Owner, visibility, response deadline |
| Release qualification | Is the exact package/configuration promotable? | Build, migration, compatibility, artifact identity | Bind evidence to version and environment |
| Deployment gate | May rollout start or expand? | Smoke, shadow, canary, migration checks | Explicit continue, pause, rollback authority |
| Post-deployment | Does released behavior remain healthy? | Synthetic, monitoring, scheduled rare-path exercise | Bounded effects and alert ownership |

## Resource-size declaration

Do not infer cost from a layer name. Declare network, filesystem, database, external service, process, concurrency, clock, sleep, shared state, expected duration, order independence, and parallel safety (`ENGINEERING-TESTING-016`).

## Portfolio design

Do not begin with a universal pyramid or layer percentage. Choose the mix from feedback speed, maintainability, utilization, reliability, fidelity, architecture, dependency topology, change frequency, incident history, and failure consequence. Add fuzzing, property testing, mutation testing, fault injection, ephemeral environments, synthetics, or canaries only for a named defect model they address better than simpler evidence (`ENGINEERING-TESTING-019`).

## Frequent decisions

- **Static mapping or generated file:** contract test at its owner; one broader artifact exposure check only if assembly can fail (`ENGINEERING-TESTING-008`).
- **Browser focus, layout, storage, or runtime:** representative browser check, not a unit substitute (`ENGINEERING-TESTING-007`).
- **Migration:** version-state matrix including interruption and rollback (`ENGINEERING-TESTING-022`).
- **Scheduled or expiring behavior:** controlled clock across material boundaries (`ENGINEERING-TESTING-021`).
- **Intermittent failure:** preserve the original failure, use controlled diagnostic retries, and quarantine only as visible missing evidence (`ENGINEERING-TESTING-010`, `ENGINEERING-TESTING-017`).
- **Changed-test selection:** compare periodically with a broader run and measure misses, not only saved time (`ENGINEERING-TESTING-020`).
- **Production-derived fixture:** govern authority, minimization, sanitization, access, retention, and prohibited effects (`ENGINEERING-TESTING-018`).
- **Test removal:** identify the ended, replaced, or accepted-risk claim (`ENGINEERING-TESTING-025`).

## Anti-pattern lookup

| If you see this | Likely problem | Route |
|---|---|---|
| A 30-minute command named smoke | Regression or E2E work is hiding in an operability gate | `ENGINEERING-TESTING-006`; smoke-suite recipe |
| Every route at every viewport in smoke | Exhaustive matrices at an expensive layer | `ENGINEERING-TESTING-006`, `ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-008` |
| Retry until green | Failure suppression and unknown evidence | `ENGINEERING-TESTING-010` |
| A permanent skip or quarantine | Silent missing coverage | `ENGINEERING-TESTING-010`, `ENGINEERING-TESTING-017`, `ENGINEERING-TESTING-025` |
| Coverage percentage used as release proof | Execution mistaken for assertion quality | `ENGINEERING-TESTING-011`, `ENGINEERING-TESTING-012` |
| Mock assertions mirror call order | Implementation coupling | `ENGINEERING-TESTING-003`, `ENGINEERING-TESTING-013` |
| Selective CI reports only minutes saved | Omission risk is unmeasured | `ENGINEERING-TESTING-020` |
| Latest-only migration test | Version skew and rollback are untested | `ENGINEERING-TESTING-022` |
| Shadow run claims write-path correctness after suppressing writes | Evidence exceeds exercised behavior | `ENGINEERING-TESTING-023` |
| Canary and control are both unhealthy but rollout proceeds | Relative comparison ignored absolute limits | `ENGINEERING-TESTING-024` |
| Test deleted because it is flaky | Coverage removed without a lifecycle decision | `ENGINEERING-TESTING-025` |

## What a passing result does not prove

- A unit pass does not prove wiring.
- A contract pass does not prove provider availability or semantic compatibility beyond the contract.
- An integration pass does not prove the released configuration.
- A smoke pass does not prove full correctness.
- A synthetic pass does not prove representative organic load or state.
- A dry run does not prove suppressed effects.
- A canary pass does not prove absence of harms its signals cannot detect.
- A coverage number does not prove assertions are meaningful.

Record those limits in the handoff (`ENGINEERING-TESTING-015`).
