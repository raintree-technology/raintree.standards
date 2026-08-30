---
type: Template
title: Testing records
description: Copyable evidence and decision records for test strategy, suite health, release exercises, and lifecycle changes.
tags: [testing, templates, evidence]
generated: { by: codex/gpt-5, at: "2026-08-30T21:20:00Z" }
---

# Testing records

Copy only the records that match the change. Delete instructional text and unused optional fields. These templates support [ENGINEERING-TESTING](../engineering/testing.md); they do not replace its rules.

## Behavior-to-evidence map

| Behavior or claim | Failure consequence | Primary evidence and boundary | Success, boundary, failure, recovery cases | Environment and stage | Owner | Result or limitation |
|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |

Untested or deferred behavior:

- Claim:
- Residual risk:
- Owner:
- Deadline and enforcement point:

## Suite inventory

| Stable suite ID and command | Primary claim | System under test | Real and simulated dependencies | Resource and duration class | Stage | Owner | Health or limitation |
|---|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |  |

## Smoke-test contract

- Artifact and exact version:
- Environment:
- Operability decision:
- Passing permits:
- Startup, readiness, primary entry, representative dynamic path, essential wiring, or artifact-identity checks:
- Explicit exclusions:
- Data identity and allowed effects:
- Repetition and cleanup behavior:
- Time budget:
- External-cost budget:
- Failure diagnostic and retained evidence:
- Invocation stage:
- Owner:

## Test-size declaration

- Stable suite ID:
- System under test:
- Network: none | loopback | declared services
- Filesystem: none | temporary | declared paths
- Database: none | isolated | shared | external
- External services:
- Processes:
- Concurrency model:
- Clock: controlled | wall | mixed
- Sleeps or polling:
- Shared state:
- Expected duration class and measured baseline:
- Order independent: yes | no, with reason
- Parallel safe: yes | no, with isolation rule
- Enforcement or visible reclassification:

## Quarantine record

- Stable test ID:
- Original failing result and evidence:
- Classification status: product | test | infrastructure | unknown
- Owner and issue:
- Protected claim and consequence:
- Missing-coverage risk:
- Observed failure rate, trials, and conditions:
- Diagnostic retries and controlled dimensions:
- Scope of containment:
- Critical or regulated coverage disposition:
- Started:
- Expires:
- Return condition:
- Review cadence:
- Resolution: restored | replaced | claim ended | residual risk accepted

## Selective-execution policy

- Selector and version:
- Selection inputs:
- Dependency, history, ownership, risk, or prediction model:
- Protected checks that always run:
- Uncertainty and stale-input fallback:
- Maximum omission interval:
- Full or broader reference-run cadence:
- Change types forcing broader execution:
- Detection-risk objective or graph-integrity controls:
- Miss rate and saved cost:
- Drift and fallback monitoring:
- Owner and review cadence:

## Version compatibility matrix

| Reader or caller | Writer or provider | Persisted or message state | Reachable rollout phase | Forward evidence | Rollback evidence | Limitation |
|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |

- Supported compatibility window:
- Delayed or replayed work:
- Interruption points:
- Final reconciliation authority:
- Fixture retirement condition:

## Production-derived data record

- Source and authority:
- Purpose and governed claim:
- Fields or properties required:
- Minimization:
- Sanitization or transformation:
- Re-identification assessment:
- Environment and access:
- Freshness and representativeness:
- Ephemeral identities and bounded authority:
- Prohibited effects:
- Retention, expiry, and deletion:
- Sample lineage and validation evidence:
- Owner:

## High-fidelity exercise record

- Exercise: dry run | shadow | replay | fault injection
- Hypothesis:
- Steady-state measures:
- Candidate and comparison path:
- Data authority:
- Intended and prohibited effects:
- Suppressed or skipped behavior and evidence limits:
- Preproduction rehearsal:
- Blast radius and observation window:
- Technical, business, integrity, and user-proxy guardrails:
- Stop conditions and authority:
- Recovery and reconciliation:
- Responsible and informed parties:
- Result and unexplained divergence:

## Canary decision record

- Candidate artifact and configuration:
- Stable control artifact and configuration:
- Population assignment and attribution labels:
- Representativeness, load, duration, and evaluation interval:
- Relative comparison measures:
- Absolute service, business, integrity, security, and harm limits:
- Minimum evidence:
- Missing, delayed, contradictory, and inconclusive handling:
- Overlapping-change control:
- Promotion stages and authority:
- Pause, rollback, and recovery conditions:
- Retained evidence:
- Decision and residual limits:

## Test retirement record

- Stable test ID and owner:
- Protected behavior and risk:
- Current trigger and run history:
- Retirement reason:
- Claim ended, named replacement, or residual-risk decision:
- Replacement evidence strength:
- Fixture or environment cleanup:
- History preservation:
- Approved by and date when risk remains:

## Execution-stage map

| Stage | Decision | Required suites or records | Trigger | Failure owner | Deadline | Enforcement point |
|---|---|---|---|---|---|---|
| Local |  |  |  |  |  |  |
| Presubmit |  |  |  |  |  |  |
| Post-submit |  |  |  |  |  |  |
| Release qualification |  |  |  |  |  |  |
| Deployment gate |  |  |  |  |  |  |
| Post-deployment |  |  |  |  |  |  |
