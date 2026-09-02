---
id: PLAYBOOK-APPLE-HIG
title: Apple HIG interface audit
description: Versioned procedure for auditing Apple-platform interfaces against current Apple guidance with optional HIG Doctor evidence.
type: playbook
status: draft
governance_status: draft
owners: [design, apple-platforms, accessibility, engineering]
last_reviewed: 2026-09-01
review_by: 2026-12-01
stale_after: 2026-12-01
applies_to: [apple-interface, apple-platform]
tags: [playbook, apple, hig, audit]
depends_on: [APPLE-PLATFORM-INTERACTION, DESIGN-INTERACTION, FND-ACCESSIBILITY, CONTENT-INTERFACE]
generated: { by: codex/gpt-5, at: "2026-09-01T21:33:16-07:00" }
sources:
  - id: apple-hig
    resource: https://developer.apple.com/design/human-interface-guidelines
    title: Human Interface Guidelines
    author: organization:apple
  - id: apple-accessibility
    resource: https://developer.apple.com/design/human-interface-guidelines/accessibility
    title: Accessibility
    author: organization:apple
  - id: apple-layout
    resource: https://developer.apple.com/design/human-interface-guidelines/layout
    title: Layout
    author: organization:apple
  - id: hig-doctor
    resource: https://github.com/raintree-technology/hig-doctor
    title: HIG Doctor
    author: organization:raintree-technology
---

# Apple HIG interface audit

Use this playbook to collect the evidence required by `APPLE-PLATFORM-INTERACTION` after applying the universal interaction, accessibility, content, trust, and product standards. Apple documentation is canonical for Apple HIG guidance. Automated HIG Doctor findings are supporting evidence, not proof of conformance or design quality.

## Version record

At the August 13, 2026 review, the HIG Doctor repository documented JSON schema version 2, tool version 2.0.0, and an Apple HIG content snapshot dated February 2, 2025. Record the actual tool, rules catalog, engine tier, configuration, baseline, and HIG snapshot used for each audit; recheck current releases rather than copying these values.

## Procedure

1. **Declare platform scope.** Create the environment matrix required by `APPLE-PLATFORM-INTERACTION-001`, including versions, devices, display and window modes, orientations, inputs, accessibility settings, locales, and Apple technologies.
2. **Review current canonical guidance.** For `APPLE-PLATFORM-INTERACTION-008`, read the current Apple HIG foundations, applicable components, patterns, inputs, platform conventions, and technology guidance. Record page titles, URLs, review date, deployment targets, availability assumptions, and fallbacks.
3. **Walk the complete task.** Inspect the task adaptation, hierarchy, navigation, controls, content, status, errors, permissions, destructive actions, interruption, restoration, windowing, and platform integration required by Rules 002, 006, and 007 using realistic data.
4. **Exercise adaptation and input.** For Rules 003 through 005, cover text scaling, VoiceOver, Voice Control where supported, keyboard or focus navigation, pointer, remote, controller, Crown, gaze, gesture, increased contrast, reduced motion, reduced transparency, dark appearance, localization, right-to-left layout, rotation, multitasking, and resizable windows as applicable.
5. **Run optional automated evidence.** Run HIG Doctor against the final source with a pinned tool and rules version. Preserve JSON or SARIF, engine tiers, configuration, exclusions, suppressions, baseline, and warnings.
6. **Review every material finding manually.** Confirm the cited current HIG page, inspect the actual rendered behavior, identify false positives and false negatives, and record the resolution or governed exception.
7. **Inspect what automation cannot prove.** Review hierarchy, task coherence, platform fit, content quality, state transitions, visual relationships, runtime accessibility, gestures, animation purpose, data accuracy, real-device behavior, and shared-framework output under Rule 010.
8. **Retest the final artifact.** Satisfy Rule 009 by verifying resolved findings and representative flows on supported devices or closest justified environments, then bind approval to the exact build.

## Tool boundaries

- HIG Doctor's Apple rules may cite Apple HIG directly; its web and cross-platform rules represent broader accessibility and UI-quality checks and must not be labeled Apple HIG conformance.
- Regex and structural or AST checks have different detection limits. Record the engine reported for each finding.
- A baseline hides known findings from a new-findings gate; it does not approve or remove them.
- Suppression requires the rule ID, reason, approver, scope, and review date.

## Completion evidence

- `APPLE-PLATFORM-INTERACTION-001` — Platform and environment matrix.
- `APPLE-PLATFORM-INTERACTION-002` through `APPLE-PLATFORM-INTERACTION-007` — Complete-flow, adaptation, input, focus, navigation, system-integration, and accessibility review results.
- `APPLE-PLATFORM-INTERACTION-008` — Current Apple HIG pages, deployment targets, availability assumptions, and fallbacks with dates.
- Optional HIG Doctor versioned output and configuration.
- Finding disposition, false-positive and false-negative review, exceptions, and retest evidence.
- `APPLE-PLATFORM-INTERACTION-009` and `APPLE-PLATFORM-INTERACTION-010` — Final device or justified simulator inspection and shared-framework evidence tied to the released build.

## Sources

- Apple, [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines). Reviewed September 1, 2026.
- Apple, [Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility). Reviewed September 1, 2026.
- Apple, [Layout](https://developer.apple.com/design/human-interface-guidelines/layout). Reviewed September 1, 2026.
- Raintree Technology, [HIG Doctor](https://github.com/raintree-technology/hig-doctor), used as versioned audit tooling and MIT-licensed structure rather than canonical Apple guidance. Reviewed August 13, 2026.
