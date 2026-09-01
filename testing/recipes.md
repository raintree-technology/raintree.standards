---
type: Reference
title: Testing recipes
description: Situation-based minimum evidence, failure cases, execution stages, records, and rule routes for common software changes.
tags: [testing, recipes, software-change]
generated: { by: codex/gpt-5, at: "2026-08-30T21:25:13Z" }
---

# Testing recipes

Choose the closest situation, then adapt it to the actual risk. These are defaults, not new requirements. Use the [field guide](field-guide.md), copy records from [testing records](../templates/testing-records.md), and follow the cited rules in [ENGINEERING-TESTING](../engineering/testing.md).

## Bug fix

**Minimum evidence:** reproduce the defect; add a failing check at the narrowest faithful boundary; cover the relevant success, boundary, and failure state; run affected broader checks; demonstrate the check rejects the old behavior.

**Avoid:** preserving an accidental implementation detail or adding a browser journey for isolated logic.

**Records:** behavior-to-evidence row; residual limitation when reproduction is incomplete.

**Rules:** `ENGINEERING-TESTING-001`, `ENGINEERING-TESTING-003`, `ENGINEERING-TESTING-005`, `ENGINEERING-TESTING-012`, `ENGINEERING-TESTING-015`.

## API or service change

**Minimum evidence:** unit coverage for owned rules; complete contract coverage for request, response, error, compatibility, and bounds; integration evidence for real storage or cooperating services; representative authorization and failure paths; exact-artifact release check where configuration matters.

**Failure cases:** invalid and missing input, unauthorized access, duplicate request, timeout, partial completion, retry, rate limit, and reconciliation as applicable.

**Records:** behavior map, test-size declaration, compatibility matrix.

**Rules:** `ENGINEERING-TESTING-001`, `ENGINEERING-TESTING-005`, `ENGINEERING-TESTING-008`, `ENGINEERING-TESTING-009`, `ENGINEERING-TESTING-014`, `ENGINEERING-TESTING-016`, `ENGINEERING-TESTING-022`; also `API-CONTRACTS`, `SECURITY-APPLICATION`, and `OPERATIONS-RELIABILITY` when active.

## UI behavior

**Minimum evidence:** isolated logic and component behavior; representative browser evidence for focus, keyboard, layout, storage, navigation, and runtime behavior that cannot be proved faithfully below the browser; one material journey only when boundaries require it.

**Avoid:** using snapshots as the only evidence of meaning, accessibility, or interaction; exhaustive viewport-route multiplication.

**Records:** behavior map and browser boundary declaration.

**Rules:** `ENGINEERING-TESTING-003`, `ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-013`, `ENGINEERING-TESTING-016`; also `DESIGN-INTERACTION`, `FND-ACCESSIBILITY`, and `WEB-QUALITY`.

## Public website release

**Minimum evidence:** contract checks for route maps, metadata, redirects, sitemap, robots, analytics serialization, and headers at their owners; representative browser checks for runtime interaction; production build; bounded smoke of artifact startup, primary route, representative dynamic route, missing route, essential dependency, and artifact identity; deployed DNS, TLS, routing, and response-policy verification.

**Avoid:** calling every-route content and viewport coverage smoke.

**Records:** suite inventory, smoke contract, execution-stage map.

**Rules:** `ENGINEERING-TESTING-006`, `ENGINEERING-TESTING-007`, `ENGINEERING-TESTING-008`, `ENGINEERING-TESTING-014`, `ENGINEERING-TESTING-015`, `ENGINEERING-TESTING-016`.

## Provider integration

**Minimum evidence:** owned adapter logic; provider contract fixtures validated against the real boundary; sandbox or faithful integration paths; timeout, rate-limit, malformed response, duplicate delivery, delayed consistency, and reconciliation behavior; bounded released synthetic when availability matters.

**Avoid:** blind retry or fixtures copied indefinitely without drift validation.

**Records:** contract owner, test-data record, quarantine record when necessary.

**Rules:** `ENGINEERING-TESTING-004`, `ENGINEERING-TESTING-005`, `ENGINEERING-TESTING-008`, `ENGINEERING-TESTING-009`, `ENGINEERING-TESTING-010`, `ENGINEERING-TESTING-013`, `ENGINEERING-TESTING-014`.

## Database migration

**Minimum evidence:** old and new readers against reachable old, intermediate, and new states; forward migration, interruption, restart, rollback, and reconciliation; integrity and query-performance checks; exact migration artifact and production configuration; restore or recovery evidence when material.

**Avoid:** testing only a clean latest schema or treating schema validity as semantic compatibility.

**Records:** version compatibility matrix, behavior map, rollout/recovery link.

**Rules:** `ENGINEERING-TESTING-005`, `ENGINEERING-TESTING-008`, `ENGINEERING-TESTING-014`, `ENGINEERING-TESTING-022`; also `DATA-DATABASE`, `DATA-QUALITY`, and `FND-CHANGE`.

## Scheduled or time-dependent behavior

**Minimum evidence:** controlled clock before, at, and after expiry or schedule boundaries; supported zones and calendar transitions; delayed and duplicate work; restart; long horizon; reconciliation with the authoritative external clock.

**Avoid:** long sleeps, host-clock mutation, or assuming simulated time controls provider time.

**Records:** clock-authority table and temporal boundary cases.

**Rules:** `ENGINEERING-TESTING-004`, `ENGINEERING-TESTING-005`, `ENGINEERING-TESTING-021`.

## Flaky-test investigation

**Minimum evidence:** preserve the first failure; vary one controlled diagnostic dimension at a time; classify product, test, or infrastructure defect; estimate observed failure rate when single reproduction is unreliable; identify missing coverage and risk.

**Quarantine only with:** stable identity, owner, issue, reason, risk, original result, observed rate, scope, start, expiry, return condition, and critical-coverage disposition.

**Rules:** `ENGINEERING-TESTING-010`, `ENGINEERING-TESTING-015`, `ENGINEERING-TESTING-017`, `ENGINEERING-TESTING-025`.

## Smoke-suite redesign

**Minimum evidence:** inventory every assertion and the decision it supports; retain only checks required to decide whether the artifact can enter deeper verification or limited traffic; move static contracts and exhaustive matrices to their owning layers; declare duration, cost, effects, diagnostics, and continuation decision.

**Candidate smoke:** startup or install, readiness, primary entry point, one representative dynamic path, essential wiring, expected artifact identity.

**Rules:** `ENGINEERING-TESTING-006`, `ENGINEERING-TESTING-008`, `ENGINEERING-TESTING-014`, `ENGINEERING-TESTING-016`.

## Canary deployment

**Minimum evidence:** concurrent stable control; attributable populations; representative duration and load; relative comparison plus absolute service, business, integrity, security, and harm limits; minimum evidence and inconclusive outcome; staged promotion, pause, rollback, and recovery authority.

**Avoid:** promotion when both populations degrade, overlapping changes contaminate attribution, or the chosen signals cannot observe the material harm.

**Records:** canary decision record.

**Rules:** `ENGINEERING-TESTING-014`, `ENGINEERING-TESTING-018`, `ENGINEERING-TESTING-024`; also `FND-CHANGE` and `OPERATIONS-RELIABILITY`.

## Shadow, dry-run, or fault-injection exercise

**Minimum evidence:** hypothesis, steady state, production-data authority, isolation, comparison, skipped effects, smallest blast radius, observation window, technical and business guardrails, stop conditions, responsible parties, and recovery.

**Avoid:** claiming suppressed writes were verified or replaying production data through live messaging, billing, publication, or destructive paths.

**Records:** high-fidelity exercise record and production-derived data record.

**Rules:** `ENGINEERING-TESTING-009`, `ENGINEERING-TESTING-018`, `ENGINEERING-TESTING-023`.

## Test retirement

**Minimum evidence:** stable test identity; protected claim and risk; selection/run history; reason for retirement; named replacement or evidence that the claim ended; residual-risk authority when coverage is intentionally removed.

**Avoid:** deletion merely because a check is slow, flaky, or inconvenient.

**Records:** test retirement record.

**Rules:** `ENGINEERING-TESTING-010`, `ENGINEERING-TESTING-017`, `ENGINEERING-TESTING-020`, `ENGINEERING-TESTING-025`.

## Completion check for every recipe

- The final artifact or system state was actually inspected.
- Commands, stages, versions, environments, results, and durations are recorded.
- Failures remain visible.
- Passing claims do not exceed the exercised boundary.
- Missing evidence and its owner are explicit.
