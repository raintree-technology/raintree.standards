---
id: PLAYBOOK-TEST-STRATEGY
title: Test strategy and suite design
description: Procedure for mapping software risk to test evidence, governing suite health and advanced exercises, and designing local through production verification.
type: playbook
status: draft
governance_status: draft
release_target: post-v1
owners: [engineering, quality, operations]
last_reviewed: 2026-08-30
review_by: 2027-02-28
stale_after: 2027-02-28
applies_to: [test-strategy, test-suite-design, smoke-test-design, ci-design]
tags: [playbook, engineering, testing, smoke-tests, continuous-integration]
depends_on: [ENGINEERING-TESTING, ENGINEERING-QUALITY, FND-EVIDENCE, FND-CHANGE, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-08-30T21:20:00Z" }
---

# Test strategy and suite design

Use this playbook when creating, restructuring, or auditing a software test strategy. The result is a behavior-to-evidence map, a suite inventory with truthful names, a bounded smoke contract, and an execution model spanning local development through released-system observation.

For rapid routing, begin with the [testing field guide](../testing/field-guide.md) and closest [situation recipe](../testing/recipes.md). Copy only applicable [testing records](../templates/testing-records.md). The machine-readable [testing routes](../testing/routes.yaml) connect types and situations to rules, stages, recipes, and templates.

## Procedure

1. **Declare the decision and boundary.** Name the repository, component, artifact, environments, supported users or callers, release decision, owners, and excluded scope.
2. **Inventory material behavior.** Start from acceptance criteria, contracts, user journeys, data flows, authority boundaries, failure design, incidents, and recurring regressions. Do not start from the existing test file list.
3. **Rank failure consequences.** Record user, data, security, privacy, financial, legal, accessibility, availability, and operational impact. Activate the applicable domain standards for material risks.
4. **Build the behavior-to-check map.** For each behavior, choose the narrowest layer that can observe it, representative success and failure cases, fixtures, environment, cadence, owner, and diagnostic artifact.
5. **Inventory current suites.** Record each command's primary claim, actual assertions, real and substituted boundaries, resource and duration class, cost, mutation behavior, stable identity, owner, health history, quarantine state, and execution stage. Rename suites whose labels overstate or misstate their evidence.
6. **Remove equivalent duplication.** Give each deterministic contract one authoritative lower-layer owner. Retain broader assertions only for a distinct assembly, deployment, or journey risk.
7. **Design the smoke contract.** State the operability decision, final artifact, representative paths, allowed side effects, data identity, environment, time and cost budget, diagnostics, and stop condition. Move exhaustive checks to their appropriate suites.
8. **Design selective end-to-end journeys.** Keep only journeys whose claims cross real boundaries. State substitutions and production differences. Route detailed permutations to unit, component, contract, security, accessibility, or integration coverage.
9. **Control nondeterminism and data.** Declare clocks, seeds, ordering, concurrency, network, provider behavior, identities, namespaces, cleanup, expiry, interruption, and reconciliation.
10. **Define flake handling.** Establish controlled diagnostic retries, classification, sufficient trials for intermittent behavior, temporary quarantine fields, expiry, and return conditions. Preserve the original failure and report contained coverage as missing rather than green.
11. **Govern production-derived data.** Record authority, sanitization, minimization, access, freshness, representativeness, retention, deletion, re-identification risk, ephemeral identities, and prohibited effects.
12. **Define execution stages.** Separate local, presubmit, post-submit, release-qualification, deployment-gate, and post-deployment evidence. For deferred checks, name the trigger, owner, deadline, escalation, and release enforcement point.
13. **Choose the portfolio.** Evaluate speed, maintainability, utilization, reliability, fidelity, architecture, dependency topology, and defect yield. Do not set universal layer percentages. Add fuzz, property, mutation, fault-injection, ephemeral-environment, synthetic, or canary techniques only for a named defect model.
14. **Design selective execution.** If checks may be omitted, define selector inputs, protected risks, uncertainty fallback, full-suite comparison, miss measurement, calibration or dependency-graph maintenance, and maximum deferral.
15. **Model time and compatibility.** Identify governed clocks, temporal boundaries, version skew, mixed readers and writers, delayed work, rollout, migration interruption, rollback, and reconciliation. Use controlled time and a reachable version-state matrix.
16. **Bound high-fidelity exercises.** For dry runs, shadows, replays, and fault injection, define hypothesis, isolation, skipped effects, steady state, comparison, guardrails, stop authority, and recovery. For canaries, define concurrent control, absolute and relative limits, evidence window, inconclusive outcome, staged promotion, and rollback.
17. **Govern the test lifecycle.** Preserve stable identity and history across changes; define addition, quarantine, replacement, and retirement decisions; detect unreachable or never-run checks; and resolve expired quarantines explicitly.
18. **Test the tests.** Inject representative defects into critical custom gates, validate fixtures against real contracts, and inspect failure output for actionable bounded evidence.
19. **Run and record the final strategy.** Execute the named layers against the final state, record results and duration, preserve failures and limitations, and assign owners for missing evidence.

## Behavior-to-check matrix

Use at least these fields:

| Behavior or claim | Failure consequence | Primary layer | Environment and boundaries | Success, boundary, and failure cases | Cadence | Owner | Result or limitation |
|---|---|---|---|---|---|---|---|
| Example: sitemap generation | Discovery loss | Contract | Local generated output | Missing, duplicate, contradictory directive | Every change | Web | Pending |

## Layer-selection guide

- Can controlled inputs and outputs prove the behavior without a real boundary? Use a unit or component check.
- Is the risk incompatibility with a schema, route, event, migration, or public interface? Use a contract check.
- Does the claim require two or more real owned boundaries? Use an integration check.
- Does it require browser layout, focus, keyboard, storage, network, or runtime behavior? Use a browser check under the applicable web and accessibility standards.
- Does it require the full user or system journey? Use a selective end-to-end check.
- Does it only decide whether a final artifact is alive and connected? Use a smoke check.
- Does it require a scripted representative operation against a released environment? Use a bounded synthetic check.
- Does it require comparing a new artifact on limited live traffic or population with a stable baseline? Use a canary.
- Does it require the released provider control plane, DNS, TLS, or production configuration before traffic? Use exact-artifact release or deployment verification.
- Does it require human judgment about meaning, presentation, usability, or harm? Use a repeatable manual review with recorded evidence.

## Smoke-test design record

Record:

- Artifact and exact version
- Environment
- Operability decision
- Representative startup, readiness, routing, installation, migration, dependency, or harmless critical paths
- Explicitly excluded exhaustive coverage
- Synthetic data and side-effect boundary
- Time and external-cost budget
- Safe repetition and cleanup behavior
- Failure diagnostic and retained evidence
- Invocation stage and owner
- Explicit continuation decision after pass or fail

Common appropriate cases include application startup, readiness, a primary route, one representative dynamic route, essential dependency wiring, package import or installation, a harmless CLI command, migration compatibility, worker consumption of a reversible synthetic job, and deployed DNS, TLS, routing, or artifact identity.

Common inappropriate cases include every route at every viewport, exact content for every page, every redirect, full accessibility review, broad authorization matrices, all analytics events, load characterization, long provider workflows, or destructive and billable production actions.

## Completion evidence

- Declared boundary, release decision, owners, and active standards
- Behavior and risk inventory
- Behavior-to-check matrix
- Suite inventory with truthful names and evidence limits
- Bounded smoke-test design record
- Selective end-to-end journey list
- Determinism, fixture, data, side-effect, and flake decisions
- Test-size contracts and suite identity, ownership, health, cost, and quarantine records
- Production-derived data authority and lifecycle when applicable
- Local, presubmit, post-submit, release, deployment, and post-deployment map, including deferred-check deadlines
- Evidence-based portfolio rationale without a universal layer ratio
- Selective-execution model, protected risks, fallback, reference-run cadence, and miss evidence
- Controlled-clock cases and reachable version, migration, rollout, and rollback matrix
- Dry-run, shadow, replay, fault-injection, and canary hypotheses, guardrails, comparison, stop, promotion, and recovery records when applicable
- Test additions, replacements, removals, expired quarantines, and unreachable-check audit
- Representative known-defect evidence for critical custom gates
- Final commands, results, durations, failures, limitations, and next owners
- Independent engineering review before the strategy is adopted as a shared release policy

## Example

A public website currently has one long browser command named `test:smoke`. Inventory shows that it checks static metadata, a redirect table, every sitemap URL at three widths, dialog focus, analytics events, headers, and application startup. The revised strategy assigns metadata and redirects to contract tests, analytics serialization to unit tests, representative focus and layout behavior to a browser regression suite, and startup plus a few critical routes to a bounded smoke command. CI runs all deterministic suites and the production build; deployment verification checks the exact preview before promotion.
