---
id: ENGINEERING-TESTING
title: Software testing and verification
description: Defines risk-based test strategy, truthful test boundaries, smoke and canary decisions, suite health, safe high-fidelity exercises, compatibility, and staged release evidence.
type: standard
status: draft
governance_status: draft
release_target: post-v1
owners: [engineering, quality, operations]
last_reviewed: 2026-08-30
review_by: 2027-02-28
stale_after: 2027-02-28
applies_to: [software-change, test-strategy, test-suite, release-verification]
tags: [engineering, testing, verification, smoke-tests, continuous-integration]
depends_on: [ENGINEERING-QUALITY, FND-EVIDENCE, FND-CHANGE, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-08-30T21:20:00Z" }
sources:
  - id: google-sre-testing
    resource: https://sre.google/sre-book/testing-reliability/
    title: Testing for Reliability
    author: organization:google
  - id: nist-ssdf-11
    resource: https://csrc.nist.gov/pubs/sp/800/218/final
    title: Secure Software Development Framework Version 1.1
    author: organization:nist
  - id: google-smurf
    resource: https://testing.googleblog.com/2024/10/smurf-beyond-test-pyramid.html
    title: SMURF Beyond the Test Pyramid
    author: organization:google
  - id: google-test-sizes
    resource: https://testing.googleblog.com/2010/12/test-sizes.html
    title: Test Sizes
    author: organization:google
  - id: github-flaky-builds
    resource: https://github.blog/engineering/engineering-principles/reducing-flaky-builds-by-18x/
    title: Reducing flaky builds by 18x
    author: organization:github
  - id: uber-e2e-left
    resource: https://www.uber.com/us/en/blog/shifting-e2e-testing-left/
    title: Shifting E2E Testing Left
    author: organization:uber
  - id: meta-autonomous-testing
    resource: https://engineering.fb.com/2021/10/20/developer-tools/autonomous-testing/
    title: Autonomous testing of services at scale
    author: organization:meta
  - id: netflix-kayenta
    resource: https://netflixtechblog.com/automated-canary-analysis-at-netflix-with-kayenta-3260bc7acc69
    title: Automated Canary Analysis at Netflix with Kayenta
    author: organization:netflix
  - id: meta-predictive-test-selection
    resource: https://engineering.fb.com/2018/11/21/developer-tools/predictive-test-selection/
    title: Predictive test selection to ensure reliable code changes
    author: organization:meta
  - id: spotify-build-systems
    resource: https://engineering.atspotify.com/2023/10/switching-build-systems-seamlessly
    title: Switching Build Systems, Seamlessly
    author: organization:spotify
  - id: stripe-test-clocks
    resource: https://stripe.dev/blog/test-clocks-how-we-made-it-easier-to-test-stripe-billing-integrations
    title: Test clocks
    author: organization:stripe
  - id: google-canarying-releases
    resource: https://sre.google/workbook/canarying-releases/
    title: Canarying Releases
    author: organization:google
  - id: google-data-processing
    resource: https://sre.google/workbook/data-processing/
    title: Data Processing Pipelines
    author: organization:google
  - id: aws-chaos-engineering
    resource: https://docs.aws.amazon.com/wellarchitected/2022-03-31/framework/rel_testing_resiliency_failure_injection_resiliency.html
    title: Test resiliency using chaos engineering
    author: organization:aws
  - id: gitlab-test-quarantine
    resource: https://handbook.gitlab.com/handbook/engineering/testing/quarantine-process/
    title: Test Quarantine Process
    author: organization:gitlab
---

# Software testing and verification

Software tests must provide evidence proportionate to risk at the least expensive layer that can prove the relevant behavior. A test suite must make its claims, boundaries, environment, failure meaning, and release role explicit rather than treating test count, coverage percentage, or one broad end-to-end run as proof of correctness.

This standard governs test strategy and test-suite design. Domain standards remain additive for accessibility, security, privacy, data, financial, legal, performance, reliability, and model-driven behavior.

## Rules

### ENGINEERING-TESTING-001 — Map material behavior and risk to evidence

**Level:** required  
**Applies when:** A software change creates or modifies behavior that can regress, or a team defines a reusable test strategy.

Record each material behavior or acceptance criterion, the consequence of failure, the selected verification layer, representative success and failure cases, required environment, execution cadence, and owner. Use the least expensive layer that can directly prove the claim, then add broader checks only for risk that exists across boundaries.

**Why:** A large test count can coexist with missing critical behavior, while indiscriminate end-to-end coverage makes feedback slow and fragile.

**Verify:**

- Trace material requirements and risks to named automated or repeatable manual checks.
- Confirm each selected layer can observe the behavior it claims to prove.
- Identify untested behavior, deferred evidence, and the owner of the residual risk.

**Exceptions:** A trivial local correction may record the mapping in its change description rather than a separate artifact.

### ENGINEERING-TESTING-002 — Name test layers by the claim they prove

**Level:** required  
**Applies when:** Naming, documenting, organizing, or reporting a test suite or release gate.

Use the following primary meanings consistently:

| Layer | Primary claim |
|---|---|
| Unit | Isolated deterministic logic produces the expected result. |
| Component | One component's rendered or behavioral contract works within a controlled harness. |
| Contract | A declared interface, schema, protocol, or compatibility boundary remains satisfied. |
| Integration | Two or more real owned boundaries work together. |
| Smoke | A built or deployed artifact is fundamentally operable and ready for deeper verification or limited traffic. |
| End-to-end | A material user or system journey works across its required boundaries. |
| Regression | A previously important or failed behavior remains correct. |
| Acceptance | The requested outcome and business rules are satisfied. |
| Synthetic | A scripted bounded operation continues to work against a released environment. |
| Canary | A limited live traffic segment or population receives a new artifact and is compared with a stable baseline before wider rollout. |
| Performance | Measured latency, responsiveness, throughput, or resource budgets are met. |
| Resilience | Defined degradation, interruption, recovery, and reconciliation behavior works. |
| Security | Abuse, authorization, confidentiality, integrity, and trust-boundary controls work. |
| Accessibility | People can perceive and operate the behavior through the required input and assistive modes. |

A check may support more than one claim, but its name, documentation, and reported result must identify its primary claim and environment. Because labels such as unit, component, integration, and system are scope-relative, also name the system under test, objective or risk, real and simulated dependencies, execution environment, and gating stage. Do not call an exhaustive regression or acceptance suite a smoke test merely because it starts an application.

**Why:** Ambiguous labels hide cost and evidence limits, causing teams to run the wrong checks or infer more confidence than a result supports.

**Verify:**

- Compare suite names and documentation with their actual assertions, dependencies, environment, and duration.
- Confirm a reader can identify the system boundary and real dependencies without relying on the layer label alone.
- Confirm handoffs state what a passing suite proves and what it does not prove.

**Exceptions:** Established external tool terminology may be retained when repository documentation maps it to this taxonomy.

### ENGINEERING-TESTING-003 — Test observable behavior instead of incidental implementation

**Level:** required  
**Applies when:** Designing or changing an automated test.

Assert public inputs, outputs, state transitions, side effects, contracts, and user-observable behavior. Avoid assertions that fail only because internal structure, call order, private names, or implementation details changed without altering the governed behavior.

**Why:** Implementation-coupled tests discourage safe refactoring and create maintenance cost without protecting users or interfaces.

**Verify:**

- Review whether a behavior-preserving refactor would invalidate the test.
- Confirm mocks, spies, snapshots, and private access are necessary to observe the governed boundary.

**Exceptions:** Internal assertions are allowed when the internal property is itself a safety, performance, security, or architectural requirement that cannot be proved reliably through a public boundary.

### ENGINEERING-TESTING-004 — Keep deterministic checks reproducible

**Level:** required  
**Applies when:** A check is expected to produce a deterministic pass or fail result.

Control or declare time, time zone, locale, randomness, seeds, identifiers, ordering, concurrency, environment variables, network access, external services, and mutable shared state. A deterministic check must produce the same result from the same declared inputs and environment.

**Why:** Uncontrolled inputs make failures difficult to reproduce and allow environment drift to masquerade as product defects.

**Verify:**

- Repeat the check from a clean state and in the supported continuous-integration environment.
- Inspect the check for undeclared clocks, random values, network calls, shared resources, and order dependence.

**Exceptions:** Tests of intentionally variable systems must define the distribution, trial count, acceptance rule, and diagnostic evidence instead of claiming single-run determinism.

### ENGINEERING-TESTING-005 — Cover material failure, boundary, and recovery behavior

**Level:** required  
**Applies when:** Failure, interruption, invalid input, or partial completion can produce material user, data, security, financial, or operational impact.

Exercise relevant invalid and missing input, boundary values, dependency timeout or unavailability, stale or conflicting state, duplicate or reordered delivery, partial completion, cancellation, retry, restart, rollback, and final-state reconciliation. Select cases from the actual failure model rather than adding permutations without a risk basis.

**Why:** Happy-path coverage does not show whether the system contains failure or returns to a trustworthy state.

**Verify:**

- Trace selected cases to the failure and recovery design.
- Inspect authoritative final state after interrupted, ambiguous, and recovered operations.

**Exceptions:** A failure class that cannot be exercised safely requires a repeatable simulation or review procedure, its limitation, and an owner.

### ENGINEERING-TESTING-006 — Keep smoke tests bounded to operability

**Level:** required  
**Applies when:** A repository, artifact, deployment, migration, package, CLI, service, worker, or application exposes a smoke-test command or release step.

Use smoke tests only to decide whether the final artifact is sufficiently alive, reachable, and connected to begin deeper verification or receive limited traffic. Select a small representative set of startup, readiness, routing, installation, migration compatibility, dependency-wiring, or harmless critical-path checks. Define a time and cost budget, make repeated execution safe, use synthetic or approved data, and emit a diagnostic that identifies the failed path and environment.

A passing smoke suite must support an explicit continuation decision, such as beginning deeper tests, promoting the artifact, or admitting limited traffic. It does not establish full correctness. Prefer checks of the exact artifact, readiness, primary entry point, one representative dynamic path, essential dependency wiring, and expected artifact identity when those claims apply.

Do not put exhaustive route matrices, viewport matrices, detailed content assertions, full accessibility review, broad authorization combinations, load characterization, or complete business workflows in a smoke suite. Route those claims to contract, browser, end-to-end, security, accessibility, performance, or acceptance suites.

**Why:** A smoke suite loses its release-triage value when it becomes slow, fragile, exhaustive, costly, or unsafe to repeat.

**Verify:**

- List every smoke assertion and the operability decision it supports.
- Measure duration and external cost against the repository's declared budget.
- Run the suite repeatedly and confirm it leaves no harmful or ambiguous state.
- Introduce a disposable startup, routing, or dependency-wiring defect and confirm the suite detects it.

**Exceptions:** A small system may combine smoke and end-to-end coverage when the combined suite remains within the declared smoke budget and each additional assertion is required to decide basic operability.

### ENGINEERING-TESTING-007 — Keep end-to-end coverage selective and representative

**Level:** required  
**Applies when:** Correctness depends on a material journey across real process, browser, service, storage, provider, or deployment boundaries.

Use end-to-end checks for representative journeys whose claim cannot be proven at a narrower layer. Keep exhaustive business rules, static mappings, edge-case permutations, and serialization details at their owning unit or contract boundary. State which real boundaries are present and which are substituted.

**Why:** End-to-end checks provide necessary integration evidence but are slower to diagnose and more vulnerable to unrelated environmental failure.

**Verify:**

- Trace each end-to-end journey to a cross-boundary risk or acceptance criterion.
- Confirm narrower suites own detailed permutations and provide faster diagnostics.
- Record substituted services, browser engines, data stores, and production differences.

**Exceptions:** A legacy system without separable boundaries may begin with characterization coverage while an owner and plan reduce unnecessary end-to-end dependence.

### ENGINEERING-TESTING-008 — Test contracts at the boundary that owns them

**Level:** required  
**Applies when:** Behavior is governed by a schema, route map, protocol, event shape, migration, public interface, policy file, or compatibility promise.

Place the complete deterministic contract at the narrowest boundary able to violate it. Use broader integration checks only to prove that the assembled or deployed system exposes that contract. Keep one authoritative owner when checks at different layers would otherwise duplicate the same defect.

**Why:** Re-proving static contracts through a browser or deployed system increases cost and obscures the component responsible for failure.

**Verify:**

- Identify the source of truth and authoritative test for each material contract.
- Compare broader checks with lower-layer coverage and remove equivalent duplicate assertions.
- Retain a broader assertion only when it detects a distinct integration or release risk.

**Exceptions:** A contract generated only in the final artifact may be tested at build or integration time when no narrower faithful representation exists.

### ENGINEERING-TESTING-009 — Isolate test data, identities, and side effects

**Level:** required  
**Applies when:** A check creates, changes, sends, bills, publishes, schedules, stores, or deletes state outside its process.

Use synthetic or explicitly approved data, unique test identities, bounded authority, environment separation, idempotent setup, and cleanup or expiry. Prevent accidental customer messaging, billing, publication, destructive production changes, and collision with concurrent runs. Reconcile final state when an outcome is ambiguous.

**Why:** A passing test is harmful when it corrupts shared state, contacts real people, creates cost, or leaves future runs unreliable.

**Verify:**

- Inspect credentials, destinations, test identities, namespaces, cleanup, retention, and concurrent-run behavior.
- Interrupt the check and confirm abandoned state is bounded, discoverable, and recoverable.

**Exceptions:** A production canary may create durable state only when the operation is approved, clearly labeled, minimized, monitored, and removed or retained under an explicit lifecycle policy.

### ENGINEERING-TESTING-010 — Treat flaky tests as defects

**Level:** required  
**Applies when:** A deterministic check produces inconsistent results from equivalent inputs and environment.

Investigate product race conditions, environmental instability, shared state, timing assumptions, and test defects. A targeted diagnostic retry may vary one controlled dimension, such as process, time, seed, or host, when it preserves the original failure and helps classify the cause. Measure intermittent behavior over enough trials to estimate its practical failure rate when a single reproduction is unreliable.

Do not make a gate pass through unlimited retries, silent result suppression, or permanent quarantine. A temporary quarantine must preserve the original failure and missing-coverage status and record stable test identity, evidence, owner, issue, risk, observed rate, scope, expiry, and return condition. Exclude a known tracked flake from a blocking decision only when the containment policy is explicit and critical or regulated coverage remains protected.

**Why:** Hidden flakiness reduces trust in the entire gate and can conceal real concurrency or reliability defects.

**Verify:**

- Reproduce the failure across controlled repeated runs and retain the failing seed or input where applicable.
- Inspect retry and quarantine configuration for controlled dimensions, limits, original-failure reporting, ownership, and expiry.
- Confirm test history distinguishes product, infrastructure, and test defects without rewriting a failure as a pass.
- Confirm quarantined coverage is represented as missing evidence rather than a pass.

**Exceptions:** A bounded retry is allowed when eventual consistency or a transient dependency is part of the declared product contract and the test verifies the associated time bound and final state.

### ENGINEERING-TESTING-011 — Use coverage metrics as diagnostics, not proof

**Level:** required  
**Applies when:** Statement, branch, function, mutation, path, requirement, or other coverage metrics inform a quality or release decision.

Treat coverage metrics as evidence about exercised scope, not as proof of correct assertions or sufficient behavior. Pair thresholds or trends with the behavior-to-risk map, review meaningful uncovered paths, and do not add low-value assertions solely to reach a number. Select advanced techniques under `ENGINEERING-TESTING-019`; their scores remain coverage diagnostics rather than sufficient release evidence.

**Why:** A high percentage can omit critical behavior, contain ineffective assertions, or execute code without validating its result.

**Verify:**

- Sample covered paths and confirm assertions would detect a relevant defect.
- Review uncovered material behavior and record its disposition.
- Confirm the release decision does not rely on a percentage alone.

**Exceptions:** A generated or mechanically exhaustive module may use a coverage threshold as its primary structural signal when semantic behavior is proved separately.

### ENGINEERING-TESTING-012 — Demonstrate that critical gates can reject defects

**Level:** required  
**Applies when:** A test or gate protects a high-risk control, release invariant, or recurring regression class.

Use a disposable known-bad fixture, mutation, fault injection, negative contract case, or equivalent method to demonstrate that the configured gate fails when the protected behavior is absent or wrong. Keep the demonstration safe and separate from production state.

**Why:** Tests can execute and pass while assertions are unreachable, inverted, too broad, or disconnected from the released configuration.

**Verify:**

- Record the injected defect and the exact gate that rejected it.
- Confirm removal of the defect restores the result without weakening the assertion.

**Exceptions:** A well-established test runner's own mechanics need not be reproved for every ordinary low-risk assertion; exercise representative repository gates and critical custom harnesses.

### ENGINEERING-TESTING-013 — Keep fixtures, doubles, snapshots, and generated evidence reviewable

**Level:** required  
**Applies when:** A test uses fixtures, mocks, fakes, stubs, snapshots, golden files, recorded traffic, generated outputs, or seeded datasets.

State the boundary and behavior each artifact represents, keep it minimal enough to review, validate it against the real contract where drift is possible, and exclude secrets and unapproved personal data. Do not accept large snapshot changes without understanding the material semantic difference.

**Why:** Test artifacts can silently drift from production or turn review into approval of unreadable bulk output.

**Verify:**

- Trace representative fixtures and doubles to current contracts or source behavior.
- Review snapshot and golden-file changes semantically rather than accepting them solely because generation succeeded.
- Inspect recorded and generated material for sensitive data and stale assumptions.

**Exceptions:** Large reference artifacts may remain when completeness is itself required and generation, provenance, semantic diffing, and review are controlled.

### ENGINEERING-TESTING-014 — Separate local, continuous-integration, release, and production evidence

**Level:** required  
**Applies when:** A repository defines developer checks, continuous integration, release verification, deployment gates, or production monitoring.

Define which evidence belongs to each stage:

- Local checks provide fast feedback for changed behavior.
- Presubmit checks provide timely change-scoped evidence and block merging when their protected risk warrants it.
- Post-submit checks run broader or more costly repository evidence and surface regressions promptly.
- Release qualification inspects the exact package, migrations, configuration, and environment boundaries before promotion.
- Deployment gates use smoke, synthetic, or canary evidence to decide whether rollout may begin or expand.
- Post-deployment checks and monitoring observe bounded released-system behavior and recovery obligations.

A costly deterministic check need not block every change when the staged policy preserves visibility and gives a named owner a deadline to resolve failure before the affected release can proceed. Record trigger rules, maximum delay, escalation, and the enforcement point. Never move evidence off the merge-critical path merely to improve a duration metric while allowing a known failure to ship.

Do not claim that a local server proves deployed DNS, TLS, routing, headers, credentials, provider configuration, or production data paths. Keep named layers directly runnable and report their results separately where one failure would otherwise hide later evidence.

**Why:** Evidence from one environment does not automatically apply after packaging, configuration, deployment, or provider integration.

**Verify:**

- Map each release claim to the stage and artifact that can prove it.
- Confirm proposed changes trigger the required presubmit evidence and that deferred evidence cannot silently skip a workspace, lose ownership, or pass the affected release deadline.
- Bind release and production evidence to the exact version and environment inspected.

**Exceptions:** A non-deployed library or local-only tool may omit release or production stages when its distribution and use boundary is explicit.

### ENGINEERING-TESTING-015 — Make failures actionable and evidence bounded

**Level:** required  
**Applies when:** An automated or manual check can fail.

Report the behavior, expected and observed result, relevant input or route, environment, and reproduction path. Retain a bounded trace, screenshot, diff, seed, log excerpt, or state reference when it materially helps diagnosis. Protect secrets and personal data, and avoid unbounded output that hides the first useful failure.

**Why:** A gate that only says "tests failed" delays recovery, while excessive diagnostics can obscure the cause or expose sensitive data.

**Verify:**

- Trigger a representative failure and follow its output to the responsible behavior and rerun command.
- Inspect retained evidence for size limits, access, sensitive data, and expiry.

**Exceptions:** Security-sensitive failures may deliberately disclose less to untrusted callers while authorized diagnostics preserve the necessary detail.

### ENGINEERING-TESTING-016 — Declare test size and resource contracts

**Level:** required  
**Applies when:** A repository groups checks into commands, schedules them in continuous integration, or permits parallel execution.

Declare each suite's allowed network, filesystem, database, external-service, process, concurrency, clock, sleep, and shared-state use, together with an expected duration class. Make order independence and parallel safety explicit. A layer name does not substitute for this resource contract: a unit-style assertion that reaches a real network is not a small isolated check.

**Why:** Resource boundaries predict speed, reproducibility, scheduling cost, and failure modes more reliably than a pyramid label alone.

**Verify:**

- Observe or instrument representative runs and compare actual resource use with the declared contract.
- Randomize order and run permitted checks concurrently to detect hidden coupling.
- Fail or visibly reclassify checks that exceed their declared boundary or duration class.

**Exceptions:** A discovery or characterization run may begin without a settled size when it records observed dependencies and produces a bounded classification plan.

### ENGINEERING-TESTING-017 — Give tests stable identity, ownership, and health records

**Level:** required  
**Applies when:** A check participates in a shared merge, release, deployment, or operational decision.

Give the check or smallest actionable group a stable identity and owner. Retain enough history to assess outcomes, duration, cost, reliability, impact, and current lifecycle state. Apply the quarantine fields and evidence limits in `ENGINEERING-TESTING-010` rather than maintaining a separate health definition.

**Why:** Teams cannot improve or safely contain a slow or unreliable gate when results cannot be attributed across runs.

**Verify:**

- Select representative failures and trace them to an owner, history, affected decision, and current disposition.
- Review slow, costly, unreliable, and quarantined checks on a declared cadence.

**Exceptions:** Local exploratory checks need not have durable telemetry when they do not contribute to a shared decision or reported quality claim.

### ENGINEERING-TESTING-018 — Govern production-derived test data

**Level:** required  
**Applies when:** Tests, fixtures, replays, models, or generators use data or requests derived from production activity.

Record authority, purpose, minimization, sanitization or transformation, access, environment, retention, deletion, freshness, representativeness, and re-identification risk. Use safe deterministic mutations and ephemeral identities so replay cannot contact people, bill accounts, publish content, alter customer state, or invoke unbounded authority. Validate that sanitization preserves only the properties needed for the governed claim.

**Why:** Production-derived data can improve fidelity while importing privacy, security, staleness, and harmful-side-effect risk.

**Verify:**

- Trace a representative sample from approved source through transformation, storage, access, use, expiry, and deletion.
- Attempt prohibited side effects and confirm environment, identity, and authority controls contain them.
- Review whether the sample still represents the behavior it is used to prove.

**Exceptions:** Aggregated metrics that cannot reasonably identify or affect a person may use a proportionate documented control set rather than record-level lineage.

### ENGINEERING-TESTING-019 — Choose the test mix from system risk and architecture

**Level:** required  
**Applies when:** Defining suite proportions, investing in a new layer, or setting an organization-wide testing policy.

Choose the mix using feedback speed, maintainability, utilization, reliability, fidelity, architecture, dependency topology, change frequency, incident history, and failure consequence. Do not require a universal pyramid, honeycomb, or fixed percentage split. Use property-based testing, fuzzing, mutation testing, fault injection, ephemeral integration environments, synthetics, or canaries only where each technique addresses a named defect model better than simpler evidence.

**Why:** The economical mix for a pure function, browser application, distributed service, data pipeline, and provider integration is materially different.

**Verify:**

- Trace investment in each layer or technique to named behaviors, defects, and decision value.
- Review suite cost, reliability, fidelity, and defect yield and rebalance when evidence no longer justifies the mix.

**Exceptions:** A temporary migration target may use a heuristic ratio when it is labeled non-normative, time-bounded, and followed by evidence-based review.

### ENGINEERING-TESTING-020 — Govern selective test execution conservatively

**Level:** required  
**Applies when:** A gate skips checks based on changed files, dependency graphs, history, prediction, ownership, risk classification, or another selection mechanism.

Define the selection inputs, dependency or prediction model, protected high-consequence checks, uncertainty fallback, and maximum interval before omitted checks run. Use a full or broader reference run periodically and after material selector, build-graph, architecture, or test-identity changes. Measure missed relevant failures, not only time saved. When the selector cannot establish scope or its evidence is stale, expand the selection or run the full applicable gate.

Probabilistic selection requires a declared detection-risk objective, calibration against held-out outcomes, monitoring for model drift, and a non-probabilistic path for rare high-consequence risks that aggregate recall can hide. Graph-based selection requires maintained module boundaries and dependency metadata.

**Why:** Selective execution can shorten feedback dramatically, but an incomplete graph or poorly calibrated model can make the gate confidently omit the only relevant check.

**Verify:**

- Replay representative changes and compare selected checks and failures with the broader reference suite.
- Introduce changes at dependency, generated-code, configuration, migration, and shared-fixture boundaries and confirm conservative selection.
- Review miss rate, saved cost, fallback frequency, stale inputs, and protected-risk coverage on a declared cadence.

**Exceptions:** A local advisory selector may accept greater omission risk when it is labeled non-gating and the required shared gate still runs.

### ENGINEERING-TESTING-021 — Make temporal behavior directly testable

**Level:** required  
**Applies when:** Correctness depends on elapsed time, schedules, expiry, retries, billing periods, retention, time zones, daylight-saving transitions, or long-lived state.

Provide a controlled clock or equivalent time-advance mechanism at the boundary that owns temporal behavior. Exercise before, at, and after material boundaries; supported time zones and calendar transitions; delayed, duplicate, and out-of-order work; long horizons; restart; and reconciliation with authoritative wall time. Do not rely on long sleeps or changing a shared host clock when a deterministic clock can prove the claim.

Keep simulated time distinct from event time, processing time, and external-provider time. State which clocks remain real and what the test therefore cannot prove.

**Why:** Time-dependent defects are difficult to reproduce when tests must wait in real time or silently assume one clock, zone, or ordering model.

**Verify:**

- Advance the controlled clock across each material boundary and inspect state, side effects, and final reconciliation.
- Repeat with supported zone and calendar transitions and after process restart.
- Confirm external calls and persisted timestamps cannot accidentally mix simulated and real authority.

**Exceptions:** A bounded real-time check may remain when the wall-clock scheduler or provider timing is itself the governed boundary; record its tolerance and nondeterminism.

### ENGINEERING-TESTING-022 — Verify compatibility across change and rollback windows

**Level:** required  
**Applies when:** A release changes a persisted schema, message, API, client, package, protocol, migration, or component that can coexist with another version.

Test every supported reader-writer and caller-provider combination across the actual rollout and rollback window. Include old code with new state, new code with old state, mixed versions, replayed or delayed messages, partial migration, restart, rollback, and final reconciliation where those states can occur. Bind compatibility fixtures to the declared support policy and retire them only when the compatibility promise ends.

Use contract tests for declared interface compatibility and broader integration or release checks for assembly, deployment order, migration tooling, and production configuration. A schema-valid payload is not sufficient evidence of semantic compatibility.

**Why:** A release can pass in a clean latest-version environment yet fail during rolling deployment, rollback, delayed delivery, or mixed-version access to durable state.

**Verify:**

- Build a version-state matrix from the rollout and recovery design and trace every reachable combination to evidence.
- Exercise interruption at each migration or rollout phase and inspect authoritative final state after continuation and rollback.
- Confirm compatibility tests are triggered by both consumer and provider or producer changes.

**Exceptions:** An atomic, non-rollbackable replacement may omit mixed-version cases only when atomicity is demonstrated and recovery does not restore an older reader or writer.

### ENGINEERING-TESTING-023 — Bound dry runs, shadow traffic, and fault injection

**Level:** required  
**Applies when:** Verification replays representative traffic or data, duplicates production work, suppresses writes, or deliberately disrupts a dependency or system.

State the hypothesis, steady-state measures, production-derived-data authority, comparison method, permitted effects, responsible parties, smallest useful blast radius, observation window, stop conditions, and recovery procedure. Rehearse in a safer environment when faithful enough, then increase fidelity and scope only after the preceding evidence passes.

Dry-run and shadow paths must isolate or suppress messaging, billing, publication, destructive writes, and other user-visible effects while preserving enough behavior to make comparison meaningful. Record every skipped mutation or external effect as an evidence limit. Fault injection must monitor technical, business, data-integrity, and user-proxy guardrails and stop automatically or through explicitly assigned authority when a threshold is crossed.

**Why:** High-fidelity exercises reveal integration and recovery failures, but an uncontrolled replay or experiment can duplicate effects, expose data, contaminate comparison, or harm users.

**Verify:**

- Demonstrate isolation by attempting each prohibited effect with representative production-shaped input.
- Trigger every stop condition and verify experiment termination, recovery, alert routing, and authoritative final state.
- Compare shadow or dry-run output with the live result and investigate unexplained divergence before promotion.

**Exceptions:** Live customer traffic may enter a bounded experiment only when the risk, authority, monitoring, stop conditions, and residual harms are explicitly approved under the applicable domain standards.

### ENGINEERING-TESTING-024 — Make canary promotion an explicit controlled decision

**Level:** required  
**Applies when:** A new artifact, configuration, model, migration, or dependency version is exposed to limited live traffic or population before wider release.

Compare a time-limited canary with a concurrent stable control using attributable population labels, representative load and duration, defined evaluation intervals, and both relative differences and absolute service, business, data-integrity, security, and user-harm limits. Define minimum evidence, inconclusive handling, promotion authority, expansion stages, pause, rollback, and recovery before exposure begins.

Avoid overlapping unrelated canaries when they would contaminate attribution. Do not promote merely because canary and control are equally degraded, or because aggregate availability cannot observe confidentiality, authorization, irreversible data, or low-frequency harm. Integrate the evaluation into the release workflow so a failed or inconclusive canary cannot be bypassed silently.

**Why:** Limited exposure reduces blast radius only when signals are attributable, sufficient for the decision, and tied to enforceable promotion and recovery controls.

**Verify:**

- Inject representative relative and absolute regressions and confirm the evaluator pauses or reverses rollout.
- Confirm canary and control populations, artifact identities, metrics, evaluation window, and rollout action are retained together.
- Test missing, delayed, contradictory, and jointly degraded signals and verify they do not become an automatic pass.

**Exceptions:** A low-traffic system may use synthetic load or longer observation when live sample size is insufficient, but must state the fidelity limit and must not claim statistically supported equivalence.

### ENGINEERING-TESTING-025 — Maintain tests through an explicit lifecycle

**Level:** required  
**Applies when:** A shared test is added, renamed, quarantined, materially changed, replaced, or removed.

Update its behavior-to-risk mapping, stable identity, owner, trigger, fixtures, expected cost, and retirement condition. Detect tests that are unreachable, never selected, assertion-free, permanently skipped, or passing only because setup exits early. Remove a test only when its protected claim ended, moved to named equivalent or stronger evidence, or the residual risk is explicitly accepted.

An expired quarantine must trigger review and enforcement, not silent permanent skipping or automatic deletion without a coverage decision. Preserve useful failure history across moves and renames where the test system permits it.

**Why:** Test suites accumulate dead checks and permanent exceptions unless evidence has the same ownership and end-of-life discipline as production behavior.

**Verify:**

- Trace additions and removals to changed claims and review the resulting coverage map.
- Audit selection and result history for unreachable, never-run, skipped, and early-exit checks.
- Review expired quarantines and confirm each returned, was replaced, or has recorded residual-risk authority.

**Exceptions:** Disposable exploratory tests may be removed without durable lifecycle records when they never supported a shared decision or completion claim.

## Guidance

Begin with acceptance criteria and failure consequences, not a preferred test framework, geometric model, or target percentage. Prefer the least costly evidence that faithfully proves each claim, then evaluate the portfolio across speed, maintainability, utilization, reliability, and fidelity. Manual inspection remains necessary where meaning, usability, visual quality, accessibility, or human judgment cannot be reduced to a reliable automated assertion.

Use the [testing field guide](../testing/field-guide.md) for rapid type and stage selection, [testing recipes](../testing/recipes.md) for common situations, and [testing records](../templates/testing-records.md) for applicable evidence. These references route to this standard and do not create independent requirements.

## Examples

The [worked examples and pilot findings](../testing/worked-examples.md) apply these rules to a public website with oversized smoke suites, a service and generated static API, and a local data and document pipeline. They are explanatory evidence, not conformance claims.

## Sources

- Google, [Testing for Reliability](https://sre.google/sre-book/testing-reliability/). Reviewed August 30, 2026.
- Google, [SMURF: Beyond the Test Pyramid](https://testing.googleblog.com/2024/10/smurf-beyond-test-pyramid.html). Reviewed August 30, 2026.
- Google, [Test Sizes](https://testing.googleblog.com/2010/12/test-sizes.html). Reviewed August 30, 2026.
- GitHub, [Reducing flaky builds by 18x](https://github.blog/engineering/engineering-principles/reducing-flaky-builds-by-18x/). Reviewed August 30, 2026.
- Uber, [Shifting E2E Testing Left](https://www.uber.com/us/en/blog/shifting-e2e-testing-left/). Reviewed August 30, 2026.
- Meta, [Autonomous testing of services at scale](https://engineering.fb.com/2021/10/20/developer-tools/autonomous-testing/). Reviewed August 30, 2026.
- Netflix, [Automated Canary Analysis at Netflix with Kayenta](https://netflixtechblog.com/automated-canary-analysis-at-netflix-with-kayenta-3260bc7acc69). Reviewed August 30, 2026.
- Meta, [Predictive test selection to ensure reliable code changes](https://engineering.fb.com/2018/11/21/developer-tools/predictive-test-selection/). Reviewed August 30, 2026.
- Spotify, [Switching Build Systems, Seamlessly](https://engineering.atspotify.com/2023/10/switching-build-systems-seamlessly). Reviewed August 30, 2026.
- Stripe, [Test clocks](https://stripe.dev/blog/test-clocks-how-we-made-it-easier-to-test-stripe-billing-integrations). Reviewed August 30, 2026.
- Google, [Canarying Releases](https://sre.google/workbook/canarying-releases/). Reviewed August 30, 2026.
- Google, [Data Processing Pipelines](https://sre.google/workbook/data-processing/). Reviewed August 30, 2026.
- Amazon Web Services, [Test resiliency using chaos engineering](https://docs.aws.amazon.com/wellarchitected/2022-03-31/framework/rel_testing_resiliency_failure_injection_resiliency.html). Reviewed August 30, 2026.
- GitLab, [Test Quarantine Process](https://handbook.gitlab.com/handbook/engineering/testing/quarantine-process/). Reviewed August 30, 2026.
- National Institute of Standards and Technology, [Secure Software Development Framework Version 1.1](https://csrc.nist.gov/pubs/sp/800/218/final). Reviewed August 30, 2026.
