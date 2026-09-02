---
id: APPLE-PLATFORM-INTERACTION
title: Apple platform interaction
description: Requirements for adapting navigation, input, presentation, system integration, and verification across Apple platforms.
type: standard
status: draft
governance_status: draft
release_target: post-v1
owners: [apple-platforms, design, engineering, accessibility]
last_reviewed: 2026-09-01
review_by: 2026-12-01
stale_after: 2026-12-01
applies_to: [apple-interface, ios, ipados, macos, tvos, watchos, visionos]
tags: [apple, hig, platform-design, interaction, accessibility]
depends_on: [DESIGN-INTERACTION, FND-ACCESSIBILITY, CONTENT-INTERFACE, FND-TRUST]
generated: { by: codex/gpt-5, at: "2026-09-01T21:33:16-07:00" }
sources:
  - id: apple-hig
    resource: https://developer.apple.com/design/human-interface-guidelines
    title: Human Interface Guidelines
    author: organization:apple
  - id: apple-hig-design-principles
    resource: https://developer.apple.com/design/human-interface-guidelines/design-principles
    title: Design principles
    author: organization:apple
  - id: apple-hig-ios
    resource: https://developer.apple.com/design/human-interface-guidelines/designing-for-ios
    title: Designing for iOS
    author: organization:apple
  - id: apple-hig-ipados
    resource: https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados
    title: Designing for iPadOS
    author: organization:apple
  - id: apple-hig-macos
    resource: https://developer.apple.com/design/human-interface-guidelines/designing-for-macos
    title: Designing for macOS
    author: organization:apple
  - id: apple-hig-tvos
    resource: https://developer.apple.com/design/human-interface-guidelines/designing-for-tvos
    title: Designing for tvOS
    author: organization:apple
  - id: apple-hig-watchos
    resource: https://developer.apple.com/design/human-interface-guidelines/designing-for-watchos
    title: Designing for watchOS
    author: organization:apple
  - id: apple-hig-visionos
    resource: https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos
    title: Designing for visionOS
    author: organization:apple
  - id: apple-hig-accessibility
    resource: https://developer.apple.com/design/human-interface-guidelines/accessibility
    title: Accessibility
    author: organization:apple
  - id: apple-hig-layout
    resource: https://developer.apple.com/design/human-interface-guidelines/layout
    title: Layout
    author: organization:apple
  - id: apple-hig-color
    resource: https://developer.apple.com/design/human-interface-guidelines/color
    title: Color
    author: organization:apple
  - id: apple-hig-right-to-left
    resource: https://developer.apple.com/design/human-interface-guidelines/right-to-left
    title: Right to left
    author: organization:apple
---

# Apple platform interaction

Protect the user's task while adapting the interface to each supported Apple platform. Apply this standard after the universal interaction, accessibility, content, and trust standards. Apple's current Human Interface Guidelines are the canonical platform source. Tools and checklists can provide evidence, but they cannot establish conformance by themselves.

## Rules

### APPLE-PLATFORM-INTERACTION-001 — Define the supported Apple environment

**Level:** required
**Applies when:** A product or feature ships on an Apple platform.

Record the supported operating-system versions, device classes, display and window modes, orientations, input methods, accessibility settings, locales, and Apple technologies before making platform-specific design or release decisions.

**Why:** An unspecified environment hides incompatible assumptions and makes a platform-quality claim impossible to verify.

**Verify:**

- Inspect an approved platform and environment matrix tied to the feature or release.
- Confirm that test environments and exclusions match the matrix.

**Exceptions:** None.

### APPLE-PLATFORM-INTERACTION-002 — Adapt the task instead of copying the interface

**Level:** required
**Applies when:** The same task appears on more than one Apple platform, device class, or window size.

Preserve the task's intent, data, state, and terminology while selecting platform-appropriate hierarchy, navigation, density, presentation, and workflow. Do not treat scaling or visually copying one platform as adaptation.

**Why:** Apple platforms share an ecosystem but differ in viewing distance, input, focus, windowing, posture, and expected interaction.

**Verify:**

- Compare complete task flows across every supported platform class.
- Record each intentional shared behavior and each platform-specific adaptation.

**Exceptions:** A shared presentation is allowed when current Apple guidance, the supported inputs, and representative testing show that it behaves appropriately on every target.

### APPLE-PLATFORM-INTERACTION-003 — Prefer native semantics and adaptive system resources

**Level:** required
**Applies when:** Selecting or implementing controls, text, color, icons, materials, or platform behavior.

Use native controls and system behaviors when they match the task. Use semantic colors, scalable text styles, and platform-appropriate system symbols when available. A custom implementation must preserve the native control's meaning, states, input behavior, accessibility contract, appearance adaptation, and feedback.

**Why:** System resources inherit platform behavior and user settings that visual imitation often misses.

**Verify:**

- Inspect the rendered component and its accessibility semantics, states, and actions.
- Test light and dark appearance, increased contrast, text scaling, and supported input methods.
- Record why each material custom control could not use a native control.

**Exceptions:** A custom control is allowed when the task requires behavior that a native control cannot provide and the documented verification covers the full replacement contract.

### APPLE-PLATFORM-INTERACTION-004 — Preserve adaptation across user settings

**Level:** required
**Applies when:** The interface can change with appearance, language, accessibility, display, or motion settings.

Keep the complete task usable and understandable with supported text sizes, light and dark appearance, increased contrast, reduced motion, reduced transparency where applicable, assistive technologies, localization, right-to-left layout, safe areas, and platform display changes. Apply `FND-ACCESSIBILITY` for the full accessibility contract.

**Why:** A layout that works only under default settings excludes users and fails under ordinary system configuration changes.

**Verify:**

- Complete representative tasks under every applicable state in the environment matrix.
- Inspect truncation, overlap, clipping, reading order, mirrored layout, contrast, motion alternatives, and retained task state.

**Exceptions:** An unsupported setting requires a documented platform limitation, user impact, fallback, owner, and review date.

### APPLE-PLATFORM-INTERACTION-005 — Match the platform input and focus model

**Level:** required
**Applies when:** A user can act through touch, pointer, keyboard, remote, controller, Digital Crown, gaze, gesture, voice, or assistive technology.

Make each supported action reachable through the declared primary and accessibility inputs. Preserve visible focus, predictable traversal, appropriate target size, immediate feedback, and an alternative for any gesture-only action. Use the platform's interaction model rather than emulating another platform's input model.

**Why:** An action can be visually present but unusable when focus, targeting, or feedback does not match the actual input device.

**Verify:**

- Complete representative tasks with every declared input class.
- Inspect focus order, focus restoration, target acquisition, gesture alternatives, feedback, and interruption recovery.

**Exceptions:** Game-specific controls may use a specialized interaction model, but system actions, accessibility access, and required alternatives remain in scope.

### APPLE-PLATFORM-INTERACTION-006 — Govern navigation, windows, and multitasking by platform

**Level:** required
**Applies when:** The product has multiple destinations, presentations, windows, scenes, spaces, or resizable layouts.

Use platform-appropriate navigation, dismissal, restoration, windowing, and multitasking behavior. Preserve the user's location and material task state through resizing, interruption, backgrounding, window changes, and supported transitions between presentations.

**Why:** Phone, tablet, desktop, television, watch, and spatial interfaces expose different navigation and lifecycle expectations.

**Verify:**

- Exercise forward, back, close, cancel, restore, resize, interruption, and relaunch paths where applicable.
- Inspect platform-specific window, focus, scene, and multitasking states with realistic data.

**Exceptions:** None.

### APPLE-PLATFORM-INTERACTION-007 — Integrate system experiences at the point of value

**Level:** required
**Applies when:** The task uses permissions, notifications, widgets, Live Activities, complications, sharing, system media, immersive spaces, or another Apple system experience.

Introduce the system experience when its value is clear. Use supported entry, exit, lifecycle, privacy, and recovery behavior. Handle denial, restriction, revocation, interruption, expiration, and unavailable capability without trapping the user or losing material work.

**Why:** A system integration crosses product and operating-system boundaries where timing, authority, and lifecycle failures can surprise users.

**Verify:**

- Exercise first use, granted, denied, restricted, revoked, interrupted, expired, and unavailable states as applicable.
- Confirm that copy, controls, data use, and recovery match the current platform contract.

**Exceptions:** States that the declared platform cannot produce may be omitted with evidence.

### APPLE-PLATFORM-INTERACTION-008 — Pin current Apple guidance and implementation assumptions

**Level:** required
**Applies when:** Making a material design, implementation, audit, or release decision.

Record the Apple HIG pages and review date, deployment targets, relevant framework or API availability, implementation assumptions, and fallbacks used for the decision. Distinguish Apple guidance from product choices and tool heuristics. Recheck volatile guidance before a material release.

**Why:** Apple guidance and platform capabilities change, and an unversioned claim cannot be reproduced or reviewed honestly.

**Verify:**

- Inspect the decision or audit record for source titles, URLs, review dates, deployment targets, availability checks, and fallbacks.
- Confirm that automated findings are labeled as supporting evidence rather than Apple approval.

**Exceptions:** None.

### APPLE-PLATFORM-INTERACTION-009 — Verify the final build on representative Apple environments

**Level:** required
**Applies when:** Approving or releasing an Apple-platform interface.

Verify complete representative tasks in the final build on the supported environments. Use real devices when physical input, haptics, viewing distance, camera, sensors, performance, spatial comfort, or another device property affects the result. Combine automation with manual, assistive-technology, and independent human review.

**Why:** Source inspection, design files, previews, simulators, and automated audits cannot prove the behavior of the released interface.

**Verify:**

- Bind the evidence to the exact build, environment matrix, tasks, states, and reviewer.
- Record device and simulator coverage, failures, limitations, deferred environments, and owners.

**Exceptions:** A simulator-only decision requires a documented reason, the unverified physical properties, risk acceptance by the accountable owner, and a dated device-test follow-up.

### APPLE-PLATFORM-INTERACTION-010 — Preserve platform behavior through shared frameworks

**Level:** required
**Applies when:** Shared code, a cross-platform framework, Catalyst, a web wrapper, or a custom rendering layer produces an Apple interface.

Do not let the abstraction erase native semantics, input and focus behavior, navigation and windowing, user-setting adaptation, permissions, lifecycle behavior, or assistive-technology access. Add platform-specific implementations or overrides where the shared layer cannot satisfy the applicable contract.

**Why:** A shared implementation can look consistent while silently removing behavior that users and the operating system expect.

**Verify:**

- Inspect the native output, accessibility tree, lifecycle hooks, and platform overrides.
- Run the evidence required by Rules 003 through 009 against the final Apple build.

**Exceptions:** None.

## Operational coverage

Use the applicable row to expand the environment matrix. It is a minimum route, not a complete test plan.

| Platform | Minimum platform scenarios |
|---|---|
| iOS | Touch, compact layouts, supported orientation, safe areas, interruption, text scaling, assistive technology, and permission states |
| iPadOS | Resizing and multitasking, supported orientations, pointer and keyboard, touch, window or scene restoration, text scaling, and assistive technology |
| macOS | Window resizing and restoration, menus, toolbars, pointer, keyboard shortcuts, full-screen behavior, text scaling where supported, and assistive technology |
| tvOS | Viewing distance, focus traversal and restoration, remote and supported controller or voice input, media interruption, and assistive technology |
| watchOS | Brief task flow, touch, Digital Crown, haptics, always-on or complication behavior when used, text scaling, and assistive technology |
| visionOS | Windows, volumes, or spaces in scope; gaze and indirect gesture; field of view; immersion transitions; motion and spatial comfort; and assistive technology |

## Guidance

- Start from the user's task and the supported environment matrix. Do not start from a checklist of visual traits.
- Treat Apple's current platform pages, foundations, components, patterns, inputs, and technology guidance as one connected source set.
- Reuse product concepts and data across platforms, but allow the presentation and interaction to diverge when platform behavior requires it.
- Use the [Apple HIG interface audit](../playbooks/apple-hig-audit.md) to collect versioned evidence and inspect gaps that automation cannot prove.
- Escalate unresolved platform behavior to the Apple-platform owner and accessibility behavior to the accessibility owner. A tool result cannot approve its own interpretation.

## Examples

### Multi-platform navigation

**Non-compliant:** Copy an iPhone tab interface to macOS, tvOS, and visionOS, then resize it until it fits.

**Compliant:** Preserve destinations and task state, then select navigation, focus, windowing, and presentation behavior for each supported platform and verify the complete task with its actual inputs.

### Custom cross-platform control

**Non-compliant:** Render one custom control everywhere with hard-coded colors, fixed text, pointer-only hover feedback, and no native accessibility actions.

**Compliant:** Use native controls where they fit. Where a custom control is necessary, provide semantic states and actions, adaptive color and type, platform input behavior, visible focus, and per-platform verification.

### Automated HIG report

**Non-compliant:** Treat a clean static-analysis report as proof that the interface conforms to Apple's HIG.

**Compliant:** Preserve the tool version and output as supporting evidence, confirm the cited current Apple guidance, inspect the rendered final build, exercise real input and accessibility paths, and record human review.

## Sources

- Apple, [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines). Reviewed September 1, 2026.
- Apple, [Design principles](https://developer.apple.com/design/human-interface-guidelines/design-principles). Reviewed September 1, 2026.
- Apple, [Designing for iOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios). Reviewed September 1, 2026.
- Apple, [Designing for iPadOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados). Reviewed September 1, 2026.
- Apple, [Designing for macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos). Reviewed September 1, 2026.
- Apple, [Designing for tvOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-tvos). Reviewed September 1, 2026.
- Apple, [Designing for watchOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-watchos). Reviewed September 1, 2026.
- Apple, [Designing for visionOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos). Reviewed September 1, 2026.
- Apple, [Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility). Reviewed September 1, 2026.
- Apple, [Layout](https://developer.apple.com/design/human-interface-guidelines/layout). Reviewed September 1, 2026.
- Apple, [Color](https://developer.apple.com/design/human-interface-guidelines/color). Reviewed September 1, 2026.
- Apple, [Right to left](https://developer.apple.com/design/human-interface-guidelines/right-to-left). Reviewed September 1, 2026.
