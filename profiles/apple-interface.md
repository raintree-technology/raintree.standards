---
id: PROFILE-APPLE-INTERFACE
title: Apple interface profile
description: Routes Apple-platform interfaces to universal quality requirements and a current Apple HIG audit.
type: profile
status: draft
governance_status: draft
owners: [apple-platforms, design, engineering, accessibility]
last_reviewed: 2026-09-01
review_by: 2026-12-01
stale_after: 2026-12-01
applies_to: [apple-interface, ios, ipados, macos, watchos, tvos, visionos]
tags: [profile, apple, hig]
depends_on: [DESIGN-INTERACTION, APPLE-PLATFORM-INTERACTION, FND-ACCESSIBILITY, CONTENT-INTERFACE, PLAYBOOK-APPLE-HIG, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-09-01T21:33:16-07:00" }
---

# Apple interface profile

Use for interfaces shipped on iOS, iPadOS, macOS, watchOS, tvOS, or visionOS.

## Required standards

The front-matter `depends_on` list is the authoritative machine-readable route. This section explains why each dependency applies and must match that list.

- `DESIGN-INTERACTION` — universal task, component, state, adaptation, and recovery behavior
- `APPLE-PLATFORM-INTERACTION` — Apple-specific platform scope, adaptation, input, system integration, and final-build evidence
- `FND-ACCESSIBILITY` — cross-platform accessibility target and evidence
- `CONTENT-INTERFACE` — clear and localizable interface language
- `PLAYBOOK-APPLE-HIG` — current Apple-platform guidance and audit procedure
- `AGENT-VERIFICATION` — final build inspection and reproducible handoff

## Conditional standards

- New product behavior → `PRODUCT-DELIVERY`
- Personal or protected Apple-framework data → `PRIVACY-DATA`
- Authentication, authorization, secrets, files, networking, or payments → `SECURITY-APPLICATION`
- Public web content inside or linked from the app → `PROFILE-PUBLIC-WEB-PAGE`
- Analytics or experimentation → `ANALYTICS-MEASUREMENT` or `PROFILE-GROWTH-EXPERIMENT`
- Model-generated or agentic behavior → `PROFILE-AGENTIC-SYSTEM`
- App Store metadata, submission, review, or discovery work → `DISCOVERY-APP-STORES` through `PROFILE-SPECIALIST-MARKETING`

## Completion evidence

- `APPLE-PLATFORM-INTERACTION-001` — The supported operating-system, device, display, window, input, accessibility, locale, and technology matrix is approved.
- `APPLE-PLATFORM-INTERACTION-002`, `APPLE-PLATFORM-INTERACTION-005`, and `APPLE-PLATFORM-INTERACTION-006` — Task adaptation, platform inputs, focus, navigation, windows, and multitasking are inspected on representative Apple environments.
- `APPLE-PLATFORM-INTERACTION-003` and `APPLE-PLATFORM-INTERACTION-004` — Native semantics, adaptive system resources, accessibility settings, appearance, language, and layout changes are verified.
- `APPLE-PLATFORM-INTERACTION-007` and `APPLE-PLATFORM-INTERACTION-008` — System-experience lifecycle states, current Apple sources, deployment targets, availability, and fallbacks are recorded.
- `APPLE-PLATFORM-INTERACTION-009` and `APPLE-PLATFORM-INTERACTION-010` — Final-build and shared-framework evidence identifies representative devices, inputs, assistive technologies, limitations, and platform overrides.
- `DESIGN-INTERACTION-001`, `DESIGN-INTERACTION-003`, and `DESIGN-INTERACTION-005` — Complete tasks, controls, and adaptive layouts satisfy the universal interaction contract.
- `PLAYBOOK-APPLE-HIG` — Current Apple HIG pages, optional tool versions, manual review, findings, suppressions, gaps, and final retest are recorded.
- `FND-ACCESSIBILITY-007` — Automated output is combined with manual and assistive-technology evidence.
- `AGENT-VERIFICATION-002` and `AGENT-VERIFICATION-005` — The final build and handoff identify exact environments, checks, limitations, and owners.
