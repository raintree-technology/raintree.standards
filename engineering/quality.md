---
id: ENGINEERING-QUALITY
title: Engineering quality
description: Requirements for architecture, testing, dependencies, review, and release readiness.
type: standard
status: draft
governance_status: draft
owners: [engineering, security, operations]
last_reviewed: 2026-08-13
review_by: 2027-02-13
stale_after: 2027-02-13
applies_to: [software-change, service-change]
tags: [engineering, architecture, testing, dependencies, canonical-sources, generated-artifacts]
depends_on: [FND-EVIDENCE, FND-CHANGE, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-09-02T22:42:53-07:00" }
sources:
  - id: nist-ssdf-11
    resource: https://csrc.nist.gov/pubs/sp/800/218/final
    title: Secure Software Development Framework Version 1.1
    author: organization:nist
  - id: slsa-10
    resource: https://slsa.dev/spec/v1.0/
    title: Supply-chain Levels for Software Artifacts 1.0
    author: organization:open-source-security-foundation
  - id: cisa-secure-by-design
    resource: https://www.cisa.gov/securebydesign
    title: Secure by Design
    author: organization:cisa
  - id: github-deferred-compliance
    resource: https://github.blog/engineering/making-github-ci-workflow-3x-faster/
    title: Making GitHub CI workflow 3x faster
    author: organization:github
---

# Engineering quality

Software changes must have an explicit design boundary, evidence proportionate to risk, controlled dependencies, review, and a release decision based on the integrated result.

## Rules

### ENGINEERING-QUALITY-001 — Record consequential design decisions

**Level:** required
**Applies when:** A change introduces a durable boundary, dependency, data flow, failure mode, or operational commitment.

Record the problem, constraints, considered options, decision, consequences, ownership, and conditions that would trigger reconsideration.

**Why:** Architecture becomes accidental when future maintainers cannot distinguish a constraint from an incidental implementation.

**Verify:**

- Trace the implemented boundaries and dependencies to the decision record.
- Confirm rejected options and material tradeoffs are represented accurately.

**Exceptions:** Small local changes with no durable design consequence may rely on the change description.

### ENGINEERING-QUALITY-002 — Keep components and authority bounded

**Level:** required  
**Applies when:** Adding or changing a component, service, job, library, or automation.

Give each component a focused responsibility, explicit interface, minimum required authority, owned failure behavior, and observable resource boundary.

**Why:** Coupled responsibilities and broad authority increase blast radius and make failures hard to isolate.

**Verify:**

- Inspect imports, network paths, permissions, storage access, and failure propagation.
- Exercise an unavailable or malformed dependency and observe containment.

**Exceptions:** A deliberately combined component requires a recorded reason and evidence that separation would add more risk than it removes.

### ENGINEERING-QUALITY-003 — Test behavior at the cheapest effective layer

**Level:** required  
**Applies when:** A change creates or modifies behavior that can regress.

Map material behavior and risk to deterministic checks at the lowest layer that can prove the claim. Apply `ENGINEERING-TESTING` for test-layer names, smoke-test scope, deterministic execution, failure coverage, fixtures, flake handling, and local through production evidence when that post-v1 draft is adopted by the project.

**Why:** One test layer either misses integrated behavior or makes all feedback slow and fragile.

**Verify:**

- Review the behavior-to-check map and run the selected checks against the final change.
- Confirm failure, boundary, compatibility, and recovery behavior are represented.

**Exceptions:** Unautomatable behavior requires a repeatable manual procedure, evidence, and owner.

### ENGINEERING-QUALITY-004 — Control dependency introduction and change

**Level:** required  
**Applies when:** Adding, replacing, upgrading, or materially reconfiguring a dependency.

Confirm necessity, maintenance state, source, license, integrity, transitive impact, runtime authority, failure behavior, and removal path before adoption.

**Why:** Dependencies add code, authority, update obligations, and supply-chain risk beyond the imported API.

**Verify:**

- Inspect the resolved dependency graph, provenance, license, advisories, and effective permissions.
- Exercise upgrade, unavailability, malformed output, and removal where material.

**Exceptions:** Emergency remediation may use abbreviated review when follow-up has an owner and deadline.

### ENGINEERING-QUALITY-005 — Require review independent of authorship

**Level:** required  
**Applies when:** A change can affect users, production data, security, privacy, money, availability, or a shared interface.

Have a qualified reviewer who did not author the change inspect its design, implementation, evidence, and residual risk before release.

**Why:** Authors share assumptions with their implementation and can miss systematic errors.

**Verify:**

- Record reviewer identity, artifact version, findings, resolutions, and approval scope.
- Confirm later changes did not invalidate the reviewed artifact.

**Exceptions:** A documented emergency process may permit retrospective review within a defined deadline.

### ENGINEERING-QUALITY-006 — Build from attributable inputs

**Level:** required  
**Applies when:** Producing a deployable artifact or distributed package.

Use versioned source, locked inputs, protected build steps, attributable artifacts, and integrity evidence sufficient to connect the release to the reviewed source and configuration.

**Why:** A reviewed source change does not prove the distributed artifact used the same inputs or process.

**Verify:**

- Trace the artifact to source revision, dependency resolution, build identity, and configuration.
- Confirm protected release credentials and artifact integrity checks work.

**Exceptions:** Local prototypes not distributed or deployed may omit formal provenance when clearly marked non-release.

### ENGINEERING-QUALITY-007 — Make failure observable without exposing sensitive data

**Level:** required  
**Applies when:** Software runs outside an author's direct interactive control.

Emit structured health, error, latency, saturation, and dependency signals tied to user and business outcomes, while excluding or protecting secrets and personal data.

**Why:** A failure that cannot be detected, scoped, or correlated cannot be operated safely.

**Verify:**

- Trigger representative failures and trace them through logs, metrics, traces, alerts, and operator guidance.
- Inspect telemetry for excessive sensitive data and unbounded cardinality.

**Exceptions:** Highly constrained offline tools may use an explicit result artifact instead of continuous telemetry.

### ENGINEERING-QUALITY-008 — Release only the reviewed final state

**Level:** required  
**Applies when:** Approving a build, deployment, package, or handoff.

Run risk-matched checks on the final integrated artifact, inspect intended behavior, record unresolved limitations, and bind approval to the exact version released.

**Why:** Earlier passing evidence can become stale after integration, configuration, or packaging changes.

**Verify:**

- Match check output, reviewer approval, artifact identity, configuration, and deployment record.
- Confirm rollback, monitoring, and ownership remain valid for that version.

**Exceptions:** None for a production release; an emergency release follows the governed emergency process.

### ENGINEERING-QUALITY-009 — Measure engineering friction with quality outcomes

**Level:** required
**Applies when:** Changing build, test, review, deployment, development-environment, documentation, or compliance workflows used repeatedly by engineers.

Define the user task, population, baseline, wait and active time, failure and retry burden, machine cost, interruption, support load, and quality or risk outcome before optimization. Remove or defer a blocking step only when evidence shows it does not need to block that decision and an owned later gate detects, routes, and closes failures within a defined time. Measure missed defects, escaped incidents, mainline health, and adoption with speed and satisfaction.

**Why:** Faster local feedback can transfer risk or work to another team, while indiscriminate blocking checks can waste substantial human and compute capacity without improving the release decision.

**Verify:**

- Observe representative engineers completing the workflow and compare telemetry with reported friction.
- Trace each required step to a protected claim, defect class, or policy obligation and remove duplicate or obsolete gates.
- For deferred checks, inject a failure and verify detection, ownership, notification, correction deadline, escalation, and prevention of an affected release where required.
- Compare lead time, failure rate, escaped defects, support load, compute cost, and user experience before and after the change.

**Exceptions:** A new high-consequence control can launch before a complete baseline when its obligation and owner are explicit; measure burden and effectiveness after adoption and refine without weakening the protected outcome.

### ENGINEERING-QUALITY-010 — Keep derived representations subordinate to one canonical owner

**Level:** required
**Applies when:** The same material behavior, fact, route inventory, schema, configuration, or artifact appears in more than one component, repository, package, generated output, or delivery surface.

Assign one canonical owner and record every maintained consumer. Make each other representation consume the canonical interface directly or remain reproducibly generated from it. A change to the canonical source must update its derived representations in the same change or fail a deterministic drift check. Before moving or removing a canonical source, inspect registered consumers and unresolved references across the declared repository boundary.

**Why:** A copied implementation or hand-maintained projection can continue to pass local checks while consumers, documentation, generated artifacts, and other repositories retain conflicting behavior or stale paths.

**Verify:**

- Trace each maintained representation to its canonical owner, transformation, consumer, and update path.
- Change a representative canonical input and confirm that generation updates every registered projection or that the drift check rejects the stale state.
- Exercise the representation through each supported runtime, package boundary, and final artifact that resolves it differently.
- Search the declared repository boundary for old identifiers and paths after a move or removal.

**Exceptions:** Independent implementations required for isolation, compatibility, or platform behavior may remain separate when their ownership and contract are explicit and contract checks detect divergence.

## Operational coverage

Use this standard as the engineering release backbone, then add the domain standard for the affected surface.

| Change class | Required quality route | Completion evidence |
|---|---|---|
| Internal refactor | Preserved contract, characterization where behavior is unclear, focused tests, dependency and dead-path review | Before/after behavior, changed boundaries, canonical and derived representation inventory, test selection rationale, and final diff inspection |
| Public contract or compatibility change | Version and consumer inventory, compatibility window, migration path, deprecation, and rollback | Contract tests across supported versions, consumer evidence, release notes, telemetry, and retirement criteria |
| Build or dependency change | Pinned inputs, provenance, reproducible artifact, license and vulnerability review, upgrade and rollback path | Lockfile or manifest diff, clean build, artifact identity, source and integrity data, and environment comparison |
| Performance or reliability change | Workload model, baseline, budget, saturation and failure scenarios, observability, and capacity assumptions | Repeatable benchmark, variance, resource profile, production-shaped trial, and regression threshold |
| Security, privacy, or high-impact change | Threat and data-flow review, independent reviewer, abuse and failure cases, authorization, and recovery | Reviewer identity and scope, findings, mitigations, residual risk, and approval or explicit block |
| Removal or simplification | Reachability and runtime evidence, owner and consumer check, staged removal, and recovery route | Search and analyzer results, usage telemetry, canary outcome, final artifact inspection, and deleted-path inventory |

No route can rely on source appearance alone. Inspect the built, packaged, deployed, or otherwise final artifact that users and dependent systems receive.

## Guidance

Prefer the simplest design that meets measured needs. Add abstraction only when it removes current duplication, isolates a real boundary, or enables an explicit requirement. Treat generated code and AI-authored changes as authored work subject to the same review and evidence.

## Examples

### New serialization library

Non-compliant: Add a large package because its API is convenient and rely on the package lock alone.

Compliant: Compare the existing capability and candidate package, inspect the resolved graph and license, constrain its use behind the serialization boundary, test malformed data and upgrade behavior, and record the removal path.

### Shared audit rules

Non-compliant: Copy an audit engine into a website and compare only the number of rules in each copy.

Compliant: Keep the engine in its package, import it through the package interface, generate demo data from that implementation, and fail validation when a registered projection is stale.

## Sources

- National Institute of Standards and Technology, [Secure Software Development Framework Version 1.1](https://csrc.nist.gov/pubs/sp/800/218/final). Reviewed August 13, 2026.
- Open Source Security Foundation, [Supply-chain Levels for Software Artifacts 1.0](https://slsa.dev/spec/v1.0/). Reviewed August 13, 2026.
- Cybersecurity and Infrastructure Security Agency, [Secure by Design](https://www.cisa.gov/securebydesign). Reviewed August 13, 2026.
- GitHub, [Making GitHub CI workflow 3x faster](https://github.blog/engineering/making-github-ci-workflow-3x-faster/). Reviewed September 1, 2026.
