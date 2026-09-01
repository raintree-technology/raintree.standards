---
type: Template
title: Agent interface evaluation
description: Evidence record for evaluating reusable agent design guidance against matched baselines, holdouts, regressions, mixed graders, and production feedback.
tags: [template, design, agents, evaluation, anti-slop]
generated: { by: codex/gpt-5, at: "2026-09-01T00:00:00-07:00" }
---

# Agent interface evaluation

Use this record with `PLAYBOOK-AGENT-DESIGN-GUIDANCE`. Bind every result to exact guidance, primitive, model, agent, scenario, and environment versions.

## Decision and scope

- Intended reader and decision:
- Agent-generated surface:
- Guidance artifact and version:
- Governed primitives and version:
- Agent harness, model, tools, and configuration:
- Applicable requests:
- Out-of-scope requests:
- Release claim:
- Target request population and sampling method:
- Owners and reviewers:

## Data and fixture governance

- Source and permission:
- Personal, confidential, proprietary, or regulated data:
- Minimization and sanitization:
- Licensing and attribution:
- Freshness and representativeness:
- Access, retention, deletion, and owner:

## Scenario inventory

| Scenario ID | Real task basis | Fixed prompt and inputs | Render settings | Expected decisions | Failure modes | Set |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  | capability / holdout / regression / routing-negative |

Fixture privacy, licensing, freshness, and sanitization:

Coverage matrix across surface, task, reader, structure, interaction, content, locale, accessibility state, viewport, and failure consequence:

Holdout isolation and contamination checks:

## Grader inventory

| Grader ID | Claim measured | Type | Artifact inspected | Rubric or assertion | Calibration evidence | Blocker condition |
| --- | --- | --- | --- | --- | --- | --- |
|  |  | code / outcome / model / human |  |  |  |  |

Model-grader human calibration set, agreement, false positives, false negatives, and drift review:

Human-review rubric, reviewer qualifications, blinding, randomization, disagreement, and conflict controls:

## Trial record

| Trial ID | Scenario | Candidate or baseline | Guidance version | Model seed or run identity | Routing result | Output and trace | Grader results | Human finding |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |  |  |

Preserve first valid attempts, unsuccessful trials, infrastructure failures, rerun reasons, and shared-state or isolation limits.

## Rendering environment

- Browser and version:
- Operating system and version:
- Viewport, device scale, and input mode:
- Fonts and loading state:
- Locale, timezone, text direction, and content seed:
- Theme, color scheme, contrast, transparency, and reduced motion:
- Clock, animation, network, external assets, and dynamic-data controls:
- Environment-specific baseline policy:
- Masked or normalized regions with reason:

## Matched comparison

- Variable intentionally changed:
- Variables held constant:
- Baseline selection:
- Blind review method:
- Trial count and rationale:
- Candidate wins, ties, and losses by scenario:
- Mechanical failures by category:
- Human blockers by category:
- Raw counts and denominators:
- Grader disagreement:
- Infrastructure failures and exclusions:
- Confidence limits and prohibited generalizations:

## Layer-to-claim map

| Release claim | Static or token check | Semantic or accessibility tree | Interaction | Browser measurement | Visual comparison | Accessibility tool | Assistive technology or user evaluation | Human design review | Unproved remainder |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |  |  |  |

## Baseline update

- Baseline ID and previous revision:
- Candidate revision:
- Governing product decision and reason:
- Candidate, expected, and diff artifacts:
- Changed scenarios and claims:
- Human inspection result:
- Accessibility and interaction impact:
- Regression and holdout results:
- Independent approver:
- Rollback path:

## Failure classification

| Finding | Exact evidence | Class | Recurrence | Narrowest owner | Candidate correction | Decision |
| --- | --- | --- | --- | --- | --- | --- |
|  |  | routing / guidance / primitive / deterministic check / harness / model-specific / judgment / coverage gap |  |  |  | accept / reject / defer |

## Correction verification

- Changed artifact and version:
- Affected scenarios rerun:
- Holdouts rerun:
- Regressions rerun:
- New or changed deterministic checks:
- New failures or disagreements:
- Correction retained, revised, or reverted:

## Suite health

- Ambiguous or duplicate scenarios:
- Saturated capability cases:
- Flaky trials or graders:
- False-positive and false-negative review:
- Production failures missing from the suite:
- Unused or stale scenarios:
- Cost, latency, and execution budget:
- Material changes requiring requalification:

## Production feedback

| Complaint category | Comparable work scope | Before frequency and window | Control introduced | After frequency and window | Interpretation | Next owner |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |

## Release decision

- Decision: approve / block / approve with recorded exceptions
- Supported models, agents, surfaces, and environments:
- Blocking findings:
- Approved exceptions and owner:
- Untested or held-out scope:
- Residual uncertainty:
- Monitoring cadence and stop condition:
- Baseline update decision:
- Suite-health limitations:
- Independent human reviewer and date:
