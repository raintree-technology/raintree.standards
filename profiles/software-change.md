---
id: PROFILE-SOFTWARE-CHANGE
title: Software change profile
description: Routes ordinary fixes, maintenance, refactoring, implementation, and test-suite changes to engineering, testing, safe-change, evidence, and verification requirements.
type: profile
status: draft
governance_status: draft
release_target: post-v1
owners: [engineering, quality]
last_reviewed: 2026-08-30
review_by: 2027-02-28
stale_after: 2027-02-28
applies_to: [software-change, bug-fix, refactor, maintenance, test-suite-change]
tags: [profile, engineering, testing, software]
depends_on: [ENGINEERING-QUALITY, ENGINEERING-TESTING, FND-CHANGE, FND-EVIDENCE, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-09-02T22:42:53-07:00" }
---

# Software change profile

Use for ordinary software implementation, bug fixes, maintenance, refactoring, build or test configuration, and test-suite changes that do not have a more specific primary profile. Combine it with every domain profile affected by the behavior.

Use the [testing field guide](../testing/field-guide.md) and closest [testing recipe](../testing/recipes.md) to retrieve the relevant subset quickly; the rule IDs below and the standard remain authoritative.

## Required standards

The front-matter `depends_on` list is the authoritative machine-readable route. This section explains why each dependency applies and must match that list.

- `ENGINEERING-QUALITY` — bounded design, dependencies, review, provenance, observability, and final release state
- `ENGINEERING-TESTING` — risk-based test layers, smoke scope, deterministic checks, fixtures, failure coverage, and execution stages
- `FND-CHANGE` — blast radius, rollout, recovery, final state, and ownership
- `FND-EVIDENCE` — evidence strength, provenance, uncertainty, and supportable claims
- `AGENT-VERIFICATION` — actual-system inspection, proportionate checks, residual uncertainty, and reproducible handoff

## Conditional standards

- JavaScript or TypeScript implementation → `ENGINEERING-JS-QUALITY`
- Public or browser-delivered behavior → `PROFILE-PUBLIC-WEB-PAGE`
- User-visible feature, flow, or interface → `PROFILE-PRODUCT-FEATURE` and, when interactive, `PROFILE-UI-FEATURE`
- Public API, SDK, CLI contract, service, job, webhook, or integration → `PROFILE-SERVICE-API`
- Database, schema, migration, query, index, backfill, backup, or restore → `PROFILE-DATABASE-CHANGE`
- Redis use or change → `PROFILE-REDIS-CHANGE`
- Authentication, authorization, secrets, untrusted input, dependency exposure, or another security boundary → `SECURITY-APPLICATION`; activate `PROFILE-SECRETS-MANAGEMENT` when secret management changes
- Personal-data collection, use, inference, storage, disclosure, retention, deletion, or transfer → `PRIVACY-DATA`
- Model, retrieval, memory, tool use, delegation, or autonomous behavior → `PROFILE-AGENTIC-SYSTEM`
- Runtime objectives, monitoring, response, recovery, or incident paths → `OPERATIONS-RELIABILITY`; server-side TypeScript logging → `OPERATIONS-LOGGING`
- Code or dependency removal → `PROFILE-CODE-REMOVAL`
- Test strategy, smoke-suite design, or material suite restructuring → `PLAYBOOK-TEST-STRATEGY`
- Material provider dependency → its named provider playbook; when none exists, `INTEGRATIONS-VENDOR`, current official provider documentation, and a recorded library gap

## Completion evidence

- `ENGINEERING-QUALITY-001` through `ENGINEERING-QUALITY-004` — The change boundary, responsibilities, behavior-to-check mapping, and dependency decisions match the implemented system.
- `ENGINEERING-TESTING-001` through `ENGINEERING-TESTING-005` — Material behavior and risk map to truthful, deterministic layers with relevant success, boundary, failure, and recovery evidence.
- `ENGINEERING-TESTING-006` and `ENGINEERING-TESTING-007` when smoke or end-to-end suites are active — Their claims, budgets, real boundaries, exclusions, data, and diagnostics are explicit and proportionate.
- `ENGINEERING-TESTING-008` through `ENGINEERING-TESTING-013` — Contract ownership, isolated data, flake handling, coverage interpretation, known-defect evidence, and fixtures are reviewable.
- `ENGINEERING-TESTING-014` and `ENGINEERING-QUALITY-008` — Local through post-deployment evidence is correctly staged, deferred checks retain owners and release deadlines, and exact-artifact evidence binds to the release decision.
- `ENGINEERING-QUALITY-009` when engineering workflow or gate behavior changes — Human wait and work, compute cost, support burden, escaped risk, and any deferred-check ownership are measured together.
- `ENGINEERING-QUALITY-010` when material behavior, facts, configuration, or artifacts have multiple representations — The canonical owner, registered consumers, generation or direct-consumption path, drift check, supported runtime boundaries, and old-reference search are recorded.
- `ENGINEERING-TESTING-015` — Representative failures identify the governed behavior and provide bounded, safe reproduction evidence.
- `ENGINEERING-TESTING-016` through `ENGINEERING-TESTING-019` — Test resource contracts, stable ownership and health, production-derived data controls, and the architecture-aware test portfolio are recorded where applicable.
- `ENGINEERING-TESTING-020` through `ENGINEERING-TESTING-025` — Selective execution, temporal behavior, compatibility windows, high-fidelity exercises, canary promotion, and test lifecycle decisions are controlled where applicable.
- `FND-CHANGE-001`, `FND-CHANGE-005`, `FND-CHANGE-007`, and `FND-CHANGE-008` — Failure boundary, rollout authority, recovery, owners, and final state are recorded.
- `FND-CHANGE-010` when a production route is added or changed — The effective change-path inventory, common control contract, bypass evidence, and detection and mitigation measures include that route.
- `AGENT-VERIFICATION-002`, `AGENT-VERIFICATION-004`, and `AGENT-VERIFICATION-005` — The final artifact was inspected in its intended form and the handoff records results, limitations, exceptions, and next actions.
- When a conditional standard is active, include its rule-level completion evidence before declaring the change complete.
