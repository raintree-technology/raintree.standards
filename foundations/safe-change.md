---
id: FND-CHANGE
title: Safe and reversible change
description: Scales rollout, observability, and recovery controls to the risk of a change.
type: foundation
status: stable
governance_status: active
owners: [engineering]
last_reviewed: 2026-08-13
review_by: 2027-02-13
stale_after: 2027-02-13
applies_to: [database-change, product-feature, deployment, growth-experiment]
tags: [reversibility, rollout, reliability]
generated: { by: codex/gpt-5, at: "2026-08-13T19:35:12Z" }
sources:
  - id: google-sre-canary
    resource: https://sre.google/workbook/canarying-releases/
    title: Canarying Releases
    author: organization:google
  - id: nist-sp-800-53
    resource: https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final
    title: Security and Privacy Controls for Information Systems and Organizations
    author: organization:nist
  - id: anthropic-effective-agents
    resource: https://www.anthropic.com/engineering/building-effective-agents
    title: Building effective agents
    author: organization:anthropic
  - id: slack-deploy-safety
    resource: https://slack.engineering/deploy-safety/
    title: Deploy Safety - Reducing customer impact from change
    author: organization:slack
---

# Safe and reversible change

The risk of a change must determine its release boundaries, observability, stop conditions, and recovery plan. This foundation applies to code, configuration, data, infrastructure, product behavior, and operational procedures.

## Rules

### FND-CHANGE-001 — Identify the failure boundary

**Level:** required  
**Applies when:** A change can affect production users, data, security, revenue, availability, or external integrations.

Document what can fail, the maximum plausible impact, affected dependencies and populations, and how operators will detect the failure.

**Why:** A rollout cannot be sized or monitored responsibly when its plausible impact is unknown.

**Verify:**

- Review a failure analysis that names the affected system, users or data, duration, and downstream effects.
- Confirm each material failure mode has a detection signal and owner.

**Exceptions:** Trivial, local, and fully reversible changes can use a short risk note rather than a formal analysis.

### FND-CHANGE-002 — Define recovery before release

**Level:** required  
**Applies when:** A change is not trivially reversible or can create durable side effects.

Define rollback, roll-forward, restoration, compensation, or containment steps before release. Include the trigger, authority, dependencies, expected duration, and any data or external effects that reversal cannot undo.

**Why:** Recovery plans written during an incident are slower and often assume that state can be restored by reverting code alone.

**Verify:**

- Walk through the recovery procedure against the planned release sequence.
- Confirm required artifacts, access, backups, and owners will be available during the change window.

**Exceptions:** None when irreversible user, financial, security, or data impact is plausible.

### FND-CHANGE-003 — Limit blast radius

**Level:** recommended  
**Applies when:** Partial rollout, feature flags, canaries, dry runs, shadow traffic, or bounded batches are feasible.

Expose the smallest representative population that can produce useful evidence, observe it for a defined period, and expand only after its acceptance criteria pass.

**Why:** A bounded release reveals production-only failures while limiting the number of users, records, or systems affected.

**Verify:**

- Record the initial scope, expansion stages, observation periods, and promotion criteria.
- Confirm the control mechanism can stop further exposure.

**Exceptions:** A global atomic change can proceed when partial exposure is technically impossible and compensating controls are documented.

### FND-CHANGE-004 — Preserve observability through the transition

**Level:** required  
**Applies when:** A change modifies critical behavior, dependencies, data shape, or a key metric.

Ensure operators can distinguish old and new behavior, expected transition effects, and actual failures throughout rollout and recovery.

**Why:** Aggregate metrics can hide a failing release or mistake expected migration work for an incident.

**Verify:**

- Demonstrate version, cohort, tenant, batch, or migration-stage segmentation where needed.
- Confirm dashboards, logs, traces, and alerts remain available during the likely failure mode.

**Exceptions:** None for changes whose failure cannot otherwise be detected before material harm.

### FND-CHANGE-005 — Set stop and promotion conditions

**Level:** required  
**Applies when:** A change is released in stages or requires an operator decision.

Define measurable conditions to continue, pause, roll back, or escalate, plus the person or automated control authorized to act.

**Why:** Ambiguous criteria encourage teams to continue a rollout despite warning signals or to halt on harmless noise.

**Verify:**

- Compare the release record with the declared thresholds and decision owner.
- Confirm the signals update quickly enough for the size and pace of the rollout.

**Exceptions:** None for staged production releases.

### FND-CHANGE-006 — Rehearse high-risk operations

**Level:** required  
**Applies when:** Recovery is complex, time-sensitive, rarely performed, or depends on manual coordination.

Exercise the release and recovery path in the closest safe environment available. Record differences from production and resolve failures that would prevent recovery.

**Why:** A written command sequence does not prove that permissions, dependencies, timing, and restoration steps work together.

**Verify:**

- Inspect the rehearsal record, outputs, elapsed time, and deviations.
- Confirm unresolved deviations are accepted by the accountable owner before release.

**Exceptions:** If rehearsal could itself cause unacceptable risk, perform a tabletop walkthrough and record the limitation.

### FND-CHANGE-007 — Authorize and record production changes

**Level:** required  
**Applies when:** A change affects production behavior, data, access, infrastructure, security controls, or external integrations.

Record the requested outcome, affected components, implementation and recovery plan, accountable approver, operator, timing, and resulting state. Separate authorization from execution when organizational policy or risk requires it.

**Why:** Unrecorded or self-authorized high-impact changes weaken accountability, incident diagnosis, and the ability to distinguish intended state from unauthorized drift.

**Verify:**

- Trace the deployed change to an approved record and immutable artifact or configuration version.
- Confirm the acting identity, time, scope, and result are available to the appropriate audit process.

**Exceptions:** Emergency changes can use an expedited path when the authorized incident role, reason, actions, and retrospective approval are recorded.

### FND-CHANGE-008 — Validate and close the change

**Level:** required  
**Applies when:** A production change, migration, rollout, or recovery action finishes or stops.

Confirm the intended state, material user and system outcomes, monitoring health, and removal of temporary access or controls. Record whether the change completed, paused, rolled back, or left follow-up work.

**Why:** A deployment command can finish while the system remains partially migrated, degraded, or dependent on temporary controls.

**Verify:**

- Compare post-change behavior and configuration with the approved outcome and baseline.
- Confirm temporary privileges, bypasses, flags, and maintenance states were removed or assigned an owner and deadline.
- Record unexpected effects and the decision to accept, correct, or reverse them.

**Exceptions:** Long-running transitions can remain open when their current stage, monitoring, owner, and next decision point are explicit.

### FND-CHANGE-009 — Bound autonomous change

**Level:** required  
**Applies when:** An automated or model-driven system can choose, repeat, or sequence changes without synchronous human direction.

Set explicit limits for scope, targets, privileges, time, steps, retries, concurrency, cost, and durable side effects. Define no-progress, uncertainty, policy-conflict, and risk triggers that stop or escalate the run. Require authoritative post-action checks before further expansion and preserve an operator stop control that remains available during likely failures.

**Why:** Small per-step error rates can compound across long autonomous runs, and an agent can continue making plausible but harmful progress after its assumptions fail.

**Verify:**

- Exercise each limit, stop trigger, unavailable approver, contradictory state, repeated failure, loop, and operator interruption.
- Confirm the acting identity cannot expand its own authority or bypass a stop through another route.
- Reconcile final state and side effects before resuming an interrupted run.

**Exceptions:** A read-only bounded analysis can use lighter controls when resource use and data disclosure remain limited and observable.

### FND-CHANGE-010 — Govern every production change path

**Level:** required
**Applies when:** A system can change production through more than one deployer, pipeline, configuration service, flag system, migration tool, scheduler, control plane, or manual route.

Inventory every effective production change path and apply a common minimum contract for identity, review or authorization, artifact or input provenance, staged exposure where applicable, health evaluation, stop and recovery, audit evidence, and final-state verification. Measure control adoption, bypasses, change-attributed incidents, time and exposure before detection, and time to mitigation by path. Do not report one well-governed pipeline as deployment safety when other active routes can bypass it.

**Why:** Reliability programs fail at portfolio boundaries when unmeasured configuration, data, infrastructure, or legacy paths retain weaker controls than the primary code pipeline.

**Verify:**

- Reconcile the change-path inventory with production identities, audit logs, schedulers, deployment systems, administrative tools, and incident records.
- Exercise detection, pause, rollback or containment, and operator recovery for each material path.
- Sample production changes and confirm each used the declared path and retained the common contract evidence.
- Review exceptions, bypasses, and incident attribution until every material route is governed or explicitly blocked.

**Exceptions:** An emergency path may use fewer pre-change steps only when its authority, use, telemetry, containment, retrospective review, and closure are governed and regularly exercised.

## Operational coverage

Choose a change route before execution and bind its stop, recovery, and closure evidence to the exact revision and environment.

| Change route | Required preconditions | Failure exercise | Closure evidence |
|---|---|---|---|
| Application or configuration rollout | Compatibility window, bounded cohort, health signals, owner, and rollback or forward-fix decision | Bad configuration, dependency failure, partial rollout, and rollback signal failure | Final version distribution, health comparison, rollback readiness, and temporary-control removal |
| Data or schema migration | Invariants, mixed-version behavior, backup and restore evidence, reconciliation query, and write-path ownership | Interrupted backfill, duplicate work, old binary, lock contention, and rollback with new writes present | Row and semantic reconciliation, old-path retirement, backup disposition, and migration owner sign-off |
| Infrastructure or regional change | Capacity model, blast-radius boundary, dependency map, access, failover route, and vendor assumptions | Region or zone loss, capacity exhaustion, control-plane loss, and observability degradation | Capacity and error-budget state, failover restoration, drift check, and emergency-access review |
| Security or access change | Threat or exposure statement, effective-policy inspection, break-glass path, and revocation plan | Lockout, excessive privilege, stale credential, compromised operator, and audit-log loss | Effective authorization, revoked legacy paths, credential rotation, and reviewed access evidence |
| Autonomous or scheduled change | Explicit authority, input bounds, budget, dry run, idempotency, stop signal, and human escalation | Repeated trigger, stale input, partial external effect, unavailable approver, and runaway cost | Action ledger, final external state, budget result, disabled temporary authority, and exception disposition |

A successful command or deployment event is not closure. Closure requires the intended final state, user and system health, reconciled side effects, and removal of temporary authority.

## Guidance

Scale controls to both likelihood and impact. A rare failure that can delete durable data deserves stronger recovery evidence than a frequent but harmless visual defect.

Prefer controls that remain usable during the failure they address. A rollback dashboard hosted only on the failing service is not a recovery path. Feature flags reduce exposure only when their dependencies, default state, ownership, and cleanup are understood.

Keep rollout stages long enough to observe the relevant signal. A five-minute canary cannot evaluate a daily job. Conversely, do not delay a harmless rollback while waiting for a slow business metric when an immediate technical failure is already clear.

## Examples

### Bounded release

Non-compliant: “Deploy to production and monitor errors.”

Compliant: “Release to one internal tenant for 30 minutes. Continue to 5% only if error rate and p95 latency remain within the stated bounds. Pause automatically on data-integrity alerts. The on-call engineer can disable the flag without a deploy.”

### Recovery

Non-compliant: “Rollback: revert the commit.”

Compliant: “Disable new writes, redeploy the compatible application version, replay the captured events, compare row counts and checksums, then reopen writes. Reverting code does not undo records already transformed.”

## Sources

- Google, [Canarying Releases](https://sre.google/workbook/canarying-releases/), Site Reliability Engineering Workbook. Reviewed August 13, 2026.
- National Institute of Standards and Technology, [Security and Privacy Controls for Information Systems and Organizations](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final), SP 800-53 Revision 5. Reviewed August 13, 2026.
- Anthropic, [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents), December 19, 2024. Reviewed August 13, 2026.
- Slack, [Deploy Safety: Reducing customer impact from change](https://slack.engineering/deploy-safety/). Reviewed September 1, 2026.
