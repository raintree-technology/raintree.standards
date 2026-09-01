---
type: Template
title: Interface quality review
description: Review record for product-specific interface quality, anti-slop findings, interaction craft, and implementation fidelity.
tags: [template, design, interface, anti-slop, review]
generated: { by: codex/gpt-5, at: "2026-09-01T00:00:00-07:00" }
---

# Interface quality review

Use this record to review a release candidate under `DESIGN-INTERACTION-012`. Complete it against the final rendered artifact. Do not approve from a design file when a running implementation exists.

## Scope

- Product and surface:
- Revision or build:
- Intended audience:
- Primary task:
- Supported platforms, viewports, themes, locales, and input methods:
- Approved design or prototype revision:
- Reviewer and role:
- Review date:
- Author of the final direction:

## Product rationale

- Verified user problem and evidence:
- Product character and intended feeling:
- Material visual and interaction choices with their product-specific reasons:
- Templates, references, competitors, or generated material used:
- Distinct directions considered and the axis each tested:
- Selection criteria and rejected directions:

## Rendered review

Record a finding for each failure. Use `none found` only after inspecting the relevant states.

| Rule | Evidence inspected | Finding | Required change or exception |
| --- | --- | --- | --- |
| `DESIGN-INTERACTION-009` | Product specificity and rationale |  |  |
| `DESIGN-INTERACTION-010` | Representative content and truthful proof |  |  |
| `DESIGN-INTERACTION-011` | Hierarchy and coherent visual system |  |  |
| `DESIGN-INTERACTION-013` | Motion purpose, frequency, continuity, and reduced motion |  |  |
| `DESIGN-INTERACTION-014` | Problem evidence and compared directions |  |  |
| `DESIGN-INTERACTION-015` | Interactive prototype and direct manipulation |  |  |
| `DESIGN-INTERACTION-016` | Typography, scaling, localization, and fallback |  |  |
| `DESIGN-INTERACTION-017` | Simplicity, capability, and disclosure |  |  |
| `DESIGN-INTERACTION-018` | Final implementation fidelity |  |  |
| `DESIGN-INTERACTION-019` | Agent-guidance routing, holdouts, regressions, and rendered trials |  |  |
| `DESIGN-INTERACTION-020` | Correction provenance, enforcement layer, and production trend |  |  |
| `DESIGN-INTERACTION-021` | Sampling, uncertainty, grader calibration, and baseline governance |  |  |
| `DESIGN-INTERACTION-022` | Layered rendered and accessibility verification |  |  |

## State and environment coverage

- First use, returning use, success, empty, loading, partial, error, offline, unavailable, and destructive states:
- Short, long, localized, right-to-left, user-generated, and dense content:
- Small and large viewports, orientation or window changes, text scaling, zoom, and reflow:
- Keyboard, pointer, touch, assistive technology, reduced motion, increased contrast, and reduced transparency as applicable:
- Rapid repetition, interruption, reversal, cancellation, and constrained performance:
- Light, dark, custom, and high-contrast themes as applicable:

## Anti-slop questions

- Which elements could be transferred unchanged to an unrelated product? Why do they belong here?
- Which elements compete for attention without supporting the primary task?
- Which decorations, borders, icons, labels, effects, or animations can be removed without losing hierarchy, identity, feedback, or comprehension?
- Which claims or demonstrations lack current evidence or show simulated behavior without a label?
- Which repeated values or variants are accidental near-duplicates?
- Which invisible details fail under repetition, interruption, content extremes, or alternate input?

## Findings and resolution

| Priority | Rule | Location or state | Evidence | Resolution | Owner |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Exceptions and limits

- Approved rule-level exceptions and decision owner:
- Deferred environments or states with reason and review date:
- External platform limitations:
- Residual uncertainty:

## Decision

- Decision: approve / block / approve with recorded exceptions
- Blocking findings:
- Follow-up owner and date:
- Reviewer signature or recorded identity:
