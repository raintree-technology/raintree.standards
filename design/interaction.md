---
id: DESIGN-INTERACTION
title: Interface and interaction design
description: Requirements for product-specific visual quality, coherent flows, navigation, forms, states, responsive behavior, and governed design systems.
type: standard
status: draft
governance_status: draft
owners: [design, product, engineering, accessibility]
last_reviewed: 2026-09-01
review_by: 2027-03-01
stale_after: 2027-03-01
applies_to: [user-interface, product-feature, public-web-page, landing-page, marketing-site]
tags: [design, interaction, usability, visual-design, design-system, anti-slop]
depends_on: [FND-ACCESSIBILITY, FND-TRUST, PRODUCT-DELIVERY]
generated: { by: codex/gpt-5, at: "2026-09-01T00:00:00-07:00" }
sources:
  - id: wcag-22
    resource: https://www.w3.org/TR/WCAG22/
    title: Web Content Accessibility Guidelines 2.2
    author: organization:w3c
  - id: uswds-design-principles
    resource: https://designsystem.digital.gov/design-principles/
    title: USWDS Design Principles
    author: organization:us-government
  - id: apple-hig
    resource: https://developer.apple.com/design/human-interface-guidelines
    title: Human Interface Guidelines
    author: organization:apple
  - id: emil-design-engineering-skills
    resource: https://github.com/emilkowalski/skills
    title: Skills for Design Engineers
    author: human:emil-kowalski
  - id: emil-agents-with-taste
    resource: https://emilkowal.ski/ui/agents-with-taste
    title: Agents with Taste
    author: human:emil-kowalski
  - id: emil-purposeful-animation
    resource: https://emilkowal.ski/ui/you-dont-need-animations
    title: You Don't Need Animations
    author: human:emil-kowalski
  - id: linear-interface-refresh
    resource: https://linear.app/now/behind-the-latest-design-refresh
    title: A calmer interface for a product in motion
    author: organization:linear
  - id: linear-design-projects
    resource: https://linear.app/method/manage-design-projects
    title: Manage design projects
    author: organization:linear
  - id: apple-fluid-interfaces
    resource: https://developer.apple.com/videos/play/wwdc2018/803/
    title: Designing Fluid Interfaces
    author: organization:apple
  - id: apple-ui-typography
    resource: https://developer.apple.com/videos/play/wwdc2020/10175/
    title: The details of UI typography
    author: organization:apple
  - id: web-animation-performance
    resource: https://web.dev/articles/animations-guide
    title: How to create high-performance CSS animations
    author: organization:google
  - id: vercel-design-md-evaluation
    resource: https://vercel.com/blog/how-our-agents-build-on-brand-pages-with-design-md
    title: How our agents build on-brand pages with design.md
    author: organization:vercel
  - id: vercel-agent-product-design
    resource: https://vercel.com/blog/teaching-agents-product-design-at-vercel
    title: Teaching agents product design at Vercel
    author: organization:vercel
  - id: anthropic-agent-evals
    resource: https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents
    title: Demystifying evals for AI agents
    author: organization:anthropic
  - id: openai-model-guidance-evals
    resource: https://developers.openai.com/api/docs/guides/latest-model
    title: Model guidance
    author: organization:openai
  - id: playwright-visual-comparisons
    resource: https://playwright.dev/docs/test-snapshots
    title: Visual comparisons
    author: organization:microsoft
  - id: w3c-accessibility-evaluation
    resource: https://www.w3.org/WAI/test-evaluate/
    title: Evaluating Web Accessibility Overview
    author: organization:w3c
  - id: govuk-design-system-contribution
    resource: https://design-system.service.gov.uk/community/contribution-criteria/
    title: Contribution criteria
    author: organization:uk-government
  - id: design-tokens-format-2025
    resource: https://www.w3.org/community/reports/design-tokens/CG-FINAL-format-20251028/
    title: Design Tokens Format Module 2025.10
    author: organization:w3c-design-tokens-community-group
---

# Interface and interaction design

Interfaces must help people understand where they are, what they can do, what will happen, and how to recover across supported devices, inputs, content, and system states. Their visual and content choices must also be specific to the product, audience, and task rather than assembled from interchangeable conventions.

## Rules

### DESIGN-INTERACTION-001 — Design the complete task flow

**Level:** required  
**Applies when:** A user starts, progresses through, or exits a multi-step task.

Map entry points, prerequisites, decisions, state changes, exits, interruptions, resumption, success, and recovery before approving the interaction.

**Why:** Screen-by-screen design misses transitions where users lose context, work, or control.

**Verify:**

- Walk representative first-time, returning, interrupted, denied, failed, and completed journeys.
- Confirm the system state and next available action at every transition.

**Exceptions:** A single atomic action may use a state model instead of a journey map.

### DESIGN-INTERACTION-002 — Keep navigation and hierarchy predictable

**Level:** required  
**Applies when:** Users move among views, sections, modes, or nested content.

Use consistent destinations, labels, placement, hierarchy, back behavior, and location cues. Do not change navigation context merely because an element receives focus or input.

**Why:** Inconsistent navigation increases memory load and can strand users after a state change.

**Verify:**

- Exercise deep links, back and forward navigation, refresh or relaunch, and responsive variants.
- Confirm repeated destinations retain meaning and relative organization.

**Exceptions:** A changed context may use different navigation when the transition is explicit and reversible.

### DESIGN-INTERACTION-003 — Use familiar controls with complete states

**Level:** required  
**Applies when:** Selecting or creating an interactive component.

Prefer the platform or design-system component whose semantics and behavior match the task. Define default, hover where relevant, focus, active, selected, disabled, loading, success, error, and unavailable states.

**Why:** Custom or incomplete controls create inconsistent behavior and accessibility gaps.

**Verify:**

- Compare the rendered component with its governed contract across input modes and states.
- Confirm a custom component supplies the complete semantics and interaction behavior it replaces.

**Exceptions:** A new pattern requires documented need, usability and accessibility evidence, ownership, and addition to the design system when reused.

### DESIGN-INTERACTION-004 — Make forms efficient and recoverable

**Level:** required  
**Applies when:** Users enter, select, review, or submit information.

Ask only for needed information, use suitable input controls and autocomplete, preserve valid work, validate at a helpful time, explain requirements, and support correction before resubmission.

**Why:** Forms impose direct effort and errors can block essential tasks or destroy work.

**Verify:**

- Complete the form with valid, invalid, partial, pasted, autofilled, long, localized, and interrupted input.
- Confirm labels, instructions, errors, focus, review, and resubmission remain coherent.

**Exceptions:** Security-sensitive fields may restrict persistence or autocomplete when the threat and user impact are documented.

### DESIGN-INTERACTION-005 — Adapt without losing meaning or operation

**Level:** required  
**Applies when:** Layout can change with viewport, window, orientation, input, text size, locale, or content length.

Reflow and reprioritize while preserving essential content, controls, relationships, reading order, and task continuity. Do not hide required functionality only because space is constrained.

**Why:** A layout that merely shrinks can obscure actions, overlap content, and break alternate input modes.

**Verify:**

- Inspect declared breakpoints and extremes for text, zoom, locale, orientation, window size, and input mode.
- Confirm hidden or moved content remains discoverable and operable.

**Exceptions:** Platform-inapplicable features may be absent when the product scope states the difference.

### DESIGN-INTERACTION-006 — Represent system status and latency

**Level:** required  
**Applies when:** An action, load, synchronization, or background process is not immediate.

Show whether work is pending, progressing, delayed, completed, partially completed, failed, cancelled, or safe to leave. Prevent duplicate commitment while preserving a controlled retry or cancel path.

**Why:** Silent latency causes repeated actions, lost confidence, and abandonment.

**Verify:**

- Exercise fast, slow, offline, timeout, partial, cancelled, repeated, and recovered states.
- Confirm status is perceivable without trapping input or fabricating progress.

**Exceptions:** Imperceptibly short deterministic work need not display progress.

### DESIGN-INTERACTION-007 — Prevent and recover from consequential mistakes

**Level:** required  
**Applies when:** An action can cause financial, privacy, security, legal, destructive, or difficult-to-reverse effects.

Present the consequence before commitment and provide appropriate review, confirmation, authorization, reversal, or recovery without relying on a generic confirmation dialog alone.

**Why:** Familiar or visually prominent controls can make severe actions too easy to trigger accidentally.

**Verify:**

- Exercise accidental activation, wrong target, stale state, duplicate action, cancellation, and recovery.
- Confirm the safeguard describes the specific object and consequence.

**Exceptions:** Immediate emergency action may omit confirmation when delay creates greater harm and recovery is addressed.

### DESIGN-INTERACTION-008 — Govern reusable design decisions

**Level:** required  
**Applies when:** Components, tokens, patterns, or content conventions are reused across products.

Version their contract, accessibility behavior, supported variants, ownership, adoption guidance, change policy, and deprecation path. Keep implementation and design references synchronized.

**Why:** An unmanaged design system spreads defects and inconsistent behavior faster than local code.

**Verify:**

- Compare representative product instances with the released component contract.
- Run visual, behavioral, accessibility, and compatibility checks before promotion.

**Exceptions:** A one-off local pattern need not enter the shared system unless reuse or governance value is demonstrated.

### DESIGN-INTERACTION-009 — Ground the interface in product context

**Level:** required
**Applies when:** Creating or materially revising an interface, public page, prototype intended for approval, or reusable visual pattern.

Define the intended audience, primary tasks, product character, content needs, and relevant platform or brand constraints before selecting a visual direction. Connect material choices in hierarchy, layout, typography, color, imagery, shape, and motion to those inputs. Do not use a trend list, generated theme, competitor imitation, or generic template as the design rationale.

**Why:** A polished interface can still be interchangeable, misleading, or poorly suited to its product when its decisions have no product-specific basis.

**Verify:**

- Review the design brief and final artifact together; trace each material visual choice to a named user, task, content, product, or platform need.
- Compare the result with the product's existing surfaces and the referenced templates or inspirations; identify copied conventions and confirm each has a local reason.

**Exceptions:** An exploratory sketch may omit a complete rationale when it is labeled as exploratory, is not presented as approved design, and records the questions it is testing.

### DESIGN-INTERACTION-010 — Design with representative content and proof

**Level:** required
**Applies when:** Content, data, media, claims, or product behavior determines the layout or supports a decision.

Use representative content, data ranges, product states, and evidence while designing and reviewing the interface. Show the real product or a clearly labeled prototype when a page claims or demonstrates capability. Do not fabricate testimonials, activity, metrics, customers, product output, or functional states to make a composition appear complete.

**Why:** Placeholder content hides layout failures, and invented proof makes visual polish depend on claims the product cannot support.

**Verify:**

- Inspect short, long, empty, loading, error, unavailable, localized, and user-generated content where each state can occur.
- Trace testimonials, metrics, customer marks, screenshots, and demonstrations to current evidence and confirm simulated material is labeled at the point of use.

**Exceptions:** Early prototypes may use clearly labeled representative data when real data is unavailable or unsafe to use. The prototype must not be published as evidence of released behavior.

### DESIGN-INTERACTION-011 — Use a coherent visual system

**Level:** required
**Applies when:** An interface uses repeated visual decisions or introduces a new visual direction.

Define and apply a limited, coherent system for hierarchy, spacing, typography, color, shape, iconography, imagery, and motion. Give repeated elements the same meaning and give exceptions an explicit purpose. Keep the primary task visually dominant; make orientation and supporting controls available without letting them compete for attention. Remove decoration, borders, icons, labels, or effects that imply unsupported interactivity or have no role in hierarchy, identity, feedback, or comprehension.

**Why:** Unrelated effects and inconsistent conventions increase cognitive load and make an interface look assembled rather than designed.

**Verify:**

- Inventory repeated visual values and component variants; reconcile accidental near-duplicates and unexplained exceptions.
- Compare the visual weight of primary content, navigation, supporting controls, and decoration; confirm their prominence follows task priority.
- Review the rendered interface without its brand marks or marketing claims and confirm that hierarchy, relationships, affordances, and state remain understandable.

**Exceptions:** Deliberate contrast or one-off art direction may break the system when its purpose remains clear and it preserves accessibility and interaction semantics.

### DESIGN-INTERACTION-012 — Pass an anti-slop review

**Level:** required
**Applies when:** An interface or public page is proposed for approval, release, or inclusion in a shared design system.

Have a design owner or peer who did not author the final direction review the rendered artifact for product specificity, representative content, coherent visual rules, truthful proof, complete states, and unnecessary convention. Record the review with the [interface quality review](../templates/interface-quality-review.md), then resolve its findings or document a rule-level exception before approval.

The review must not reject a technique only because it is fashionable or common. Gradients, cards, rounded corners, familiar typefaces, bento layouts, animation, terminal imagery, and other recognizable techniques are acceptable when they have a product-specific purpose and satisfy the other rules.

**Why:** A checklist of forbidden styles replaces design judgment with another trend and can reject useful patterns without detecting an interchangeable result.

**Verify:**

- Inspect the final rendered artifact at representative viewport sizes with realistic content and all material states.
- Record the reviewer, revision, context brief, findings for rules `DESIGN-INTERACTION-009` through `DESIGN-INTERACTION-011`, resolutions, and approved exceptions.

**Exceptions:** A private exploratory artifact may defer independent review until it becomes a candidate for approval, release, or reuse.

### DESIGN-INTERACTION-013 — Make motion earn its time

**Level:** required
**Applies when:** An interface introduces or materially changes animation, transition, gesture response, scrolling effect, or continuous motion.

Give each motion behavior a purpose such as feedback, spatial continuity, state explanation, or prevention of a jarring change. Evaluate how often people encounter it and how they trigger it. Remove or shorten motion that delays frequent or keyboard-driven work. Make interaction motion interruptible where users can reverse or repeat the action, preserve prompt feedback under load, and provide a reduced-motion treatment that keeps necessary meaning.

**Why:** Motion without a task purpose can make an interface feel slower, less predictable, and less connected to the user's input even when it appears polished in an isolated demonstration.

**Verify:**

- Record the purpose, expected frequency, trigger, duration or spring behavior, interruption behavior, and reduced-motion treatment for each material motion pattern.
- Exercise rapid repetition, reversal, keyboard and pointer input, reduced motion, constrained performance, entry, exit, and cancellation.
- Inspect motion at normal speed, slowed down, and frame by frame; confirm origin, easing, coordinated properties, and visual continuity match the interaction.

**Exceptions:** Decorative motion may exist without a functional purpose when it is rare, does not compete with work, respects user motion preferences, and has a recorded product-specific rationale.

### DESIGN-INTERACTION-014 — Verify the problem and compare directions

**Level:** required
**Applies when:** The user problem, interaction model, information hierarchy, or visual direction is new, disputed, or materially uncertain.

Verify the problem with representative user evidence and direct use of the existing product before committing to a solution. Explore more than one genuinely distinct direction and name the axis each direction tests, such as hierarchy, density, layout, interaction model, or personality. Compare directions in realistic context and record why the selected direction solves the verified problem better.

**Why:** Polishing the first plausible composition can conceal a weak problem definition and produces cosmetic variation instead of design learning.

**Verify:**

- Trace the problem statement to observations, support evidence, research, or repeated product use and separate the underlying need from a requested feature.
- Review the directions at full scale with representative content; confirm they differ on a named structural or behavioral axis rather than only color, copy, or surface treatment.
- Record the selection criteria, feedback requested, feedback received, rejected directions, and decision.

**Exceptions:** A constrained correction with an established design-system answer may compare the current and corrected states instead of producing additional directions.

### DESIGN-INTERACTION-015 — Prototype material interaction

**Level:** required
**Applies when:** Timing, gesture, transition, direct manipulation, responsive adaptation, or state change materially affects whether the design works.

Evaluate the behavior in an interactive prototype or running implementation rather than approving it from static screens alone. Make controls respond promptly, keep direct manipulation connected to the user's input, preserve spatial origin and continuity, and let users interrupt, reverse, cancel, or recover where the action remains uncommitted.

**Why:** Static screens cannot reveal latency, discontinuity, gesture conflict, unreachable states, or whether the interface remains understandable while it changes.

**Verify:**

- Exercise the prototype with the intended input methods on representative devices and under constrained performance.
- Check press, drag, release, reversal, interruption, cancellation, boundary, repeated-input, and lost-focus behavior as applicable.
- Compare the approved prototype and shipped behavior and record material differences.

**Exceptions:** A static content surface with no material interaction may use rendered responsive states instead of an interactive prototype.

### DESIGN-INTERACTION-016 — Treat typography as an adaptive system

**Level:** required
**Applies when:** Text communicates hierarchy, instructions, data, status, or product identity.

Define a limited typographic system whose font choice, size, weight, line height, letter spacing, measure, alignment, and numeric treatment serve the content and platform. Preserve its hierarchy and legibility across text scaling, localization, loading and fallback fonts, dense data, and supported display conditions. Do not select or mix typefaces only to imitate a trend.

**Why:** Typography carries most interface meaning; arbitrary or fixed treatments can obscure hierarchy, shift layouts, truncate content, and make the product feel internally inconsistent.

**Verify:**

- Inventory type roles and confirm repeated roles use consistent tokens while each distinction communicates a real hierarchy difference.
- Inspect representative prose, labels, numbers, long words, right-to-left text, scripts with different vertical needs, fallback loading, and the declared text-size range.
- Confirm important text remains complete, readable, correctly ordered, and visually distinct without relying on brand recognition.

**Exceptions:** Expressive display typography may depart from the system when it remains legible, has a product-specific purpose, and does not carry essential instructional or transactional content.

### DESIGN-INTERACTION-017 — Make simplicity preserve capability

**Level:** required
**Applies when:** Reducing density, removing controls, hiding information, or introducing progressive disclosure.

Remove elements that do not support the task, but preserve the context, capability, and discoverability people need. Keep the common path apparent and place advanced or infrequent controls behind a clear, reversible disclosure. Do not equate simplicity with empty space, fewer visible controls, uniform cards, or a minimal visual style.

**Why:** Visual minimalism can make a screen look calm while increasing navigation, memory load, hidden state, and time to complete real work.

**Verify:**

- Complete representative novice, frequent, and advanced tasks before and after the reduction; compare steps, context switches, discoverability, and errors.
- Confirm hidden controls have clear cues, retain state, remain keyboard and assistive-technology accessible, and return users to the same task context.
- Identify every removed element and record whether it was redundant, unused, misleading, or relocated.

**Exceptions:** A role, permission, safety rule, or platform constraint may remove capability when the resulting difference and recovery path are explicit.

### DESIGN-INTERACTION-018 — Verify implementation fidelity

**Level:** required
**Applies when:** An approved design is implemented or an existing interface is materially revised in code.

Compare the final running interface with the approved behavior and visual system. Resolve or record differences in content, hierarchy, spacing, typography, color, imagery, component states, responsive behavior, motion, accessibility, and platform conventions. Treat the implemented product as the final design artifact; do not approve from a design file alone.

**Why:** Small unreviewed substitutions accumulate during implementation and can erase the coherence, feedback, and edge-case behavior that justified the selected direction.

**Verify:**

- Inspect matched captures or recordings of the approved reference and running implementation across representative viewports, themes, content extremes, and material states.
- Confirm design tokens and released components match their governed sources and that deviations name an owner and reason.
- Repeat the anti-slop review on the final running revision when implementation materially changes the approved direction.

**Exceptions:** A design file is not required when the running prototype is the approved source of truth and its revision is recorded.

### DESIGN-INTERACTION-019 — Evaluate reusable agent design guidance

**Level:** required
**Applies when:** A model or agent repeatedly generates, edits, or reviews interfaces using reusable design instructions, skills, examples, tokens, components, stylesheets, or checks.

Maintain a versioned evaluation suite that tests whether the guidance loads when applicable, stays inactive when out of scope, changes agent behavior as intended, generalizes beyond its examples, and preserves previously accepted behavior. Use realistic tasks with fixed inputs and render settings, a saved baseline, held-out cases, final rendered artifacts, deterministic checks for mechanical failures, and human review for hierarchy, composition, usefulness, and product fit.

**Why:** A clear design document can still be ignored, interpreted inconsistently, overfit to examples, or improve one artifact while degrading another.

**Verify:**

- Record each scenario, input, model and agent configuration, guidance version, design-system version, viewport or device, trial, trace, rendered output, grader, finding, and decision.
- Test guidance routing separately from rule application so a load failure is not misclassified as weak guidance.
- Compare matched first attempts with and without the candidate guidance, keep unsuccessful trials, and run enough independent trials to support any reliability claim.
- Include held-out scenarios and previously passing regressions; inspect final outputs rather than relying only on model explanations or aggregate scores.

**Exceptions:** One private exploratory use may begin with a single manual matched comparison. Repeated use, shared adoption, or a quality claim activates the complete evaluation requirement.

### DESIGN-INTERACTION-020 — Maintain agent guidance from observed failures

**Level:** required
**Applies when:** Repeated reviews, evaluations, or production use reveal a failure in agent-authored interface work.

Turn an accepted correction into the narrowest durable control that can enforce it: product judgment in design guidance, reusable mechanics in governed components or tokens, objective failures in deterministic checks, routing failures in agent instructions, and harness failures in the evaluation system. Require evidence and human approval before changing shared guidance. Rerun affected scenarios and regression coverage, then monitor whether the same complaint becomes less frequent in comparable work.

**Why:** Adding every complaint to one prompt creates contradictory, oversized guidance and does not show whether the correction works or causes regressions.

**Verify:**

- Link each candidate correction to exact outputs, reviewer feedback, affected rule, recurrence evidence, decision owner, and selected enforcement layer.
- Record rejected and deferred candidates, coverage gaps, changed guidance or primitive versions, targeted reruns, broader regression results, and residual failures.
- Sample real use on a declared cadence and compare complaint frequency after adoption; revise or revert controls that do not reduce the intended failure.

**Exceptions:** A one-off artifact defect may be fixed locally when it does not reveal a reusable decision. Record why it should not change shared guidance.

### DESIGN-INTERACTION-021 — Protect evaluation validity and baselines

**Level:** required
**Applies when:** An evaluation result supports adoption, release, regression protection, or a comparative quality claim for agent-authored interface work.

Define the evaluation population, sampling method, trial count, environment controls, failure handling, grader calibration, and decision rule before interpreting results. Separate capability scenarios from regression gates. Version baselines and require review of baseline changes; do not update an expected rendering, loosen a threshold, discard a failed trial, or mask variable content merely to make a candidate pass.

**Why:** Model variability, contaminated holdouts, unstable rendering, grader drift, selective reruns, and permissive baseline updates can create apparent improvement without a more reliable interface.

**Verify:**

- Record scenario selection, holdout isolation, run independence, model and sampling settings, rendering environment, fonts, browser and operating-system versions, seeds or run identities, retries, exclusions, and infrastructure failures.
- Report counts and denominators for wins, ties, losses, blockers, and grader disagreement; state uncertainty and avoid precision the design cannot support.
- Preserve baseline history and require a reviewer to inspect candidate, expected, and diff artifacts before accepting an update.
- Recalibrate model or rubric graders against qualified human judgments after material rubric, model, task-distribution, or product changes.

**Exceptions:** A formative exploration may use an informal comparison when it makes no release, regression, or reliability claim and labels the result as directional.

### DESIGN-INTERACTION-022 — Use layered rendered verification

**Level:** required
**Applies when:** A rendered interface is evaluated automatically or used as release evidence.

Combine the narrowest suitable layers: semantic and accessibility-tree checks for structure, interaction checks for behavior, browser measurements for objective layout constraints, controlled visual comparisons for unintended rendering change, accessibility tools plus knowledgeable manual evaluation, and independent human review for hierarchy, composition, meaning, and product fit. Do not treat a screenshot match, accessibility scan, model score, or aggregate pass rate as proof of overall interface quality.

**Why:** Each automated representation omits material information, while uncontrolled screenshots can fail because of rendering noise or pass despite an unusable design.

**Verify:**

- Map every release claim to its primary evidence layer and name what that layer cannot establish.
- Run visual comparisons in the baseline environment or maintain environment-specific baselines; control time, animation, network data, fonts, and other legitimate nondeterminism without hiding user-visible defects.
- Inspect full-page and critical component renders, structural and accessibility representations, material interaction states, and all blocking diffs.
- Record which accessibility checks were automated, manual, and performed with representative users or assistive technology.

**Exceptions:** A layer may be omitted when its claim is absent or another method provides equivalent evidence and the reason is recorded. Human review remains required for a final visual-quality claim.

## Guidance

Treat visual polish as support for comprehension, hierarchy, identity, and feedback. Use motion to explain change without delaying work or excluding people. Validate with realistic content and tasks rather than idealized placeholder screens.

“Slop” in this standard means an interface whose choices are interchangeable, unsupported, internally inconsistent, or fabricated despite surface-level polish. It does not mean a particular aesthetic. Apply the term to evidence and outcomes, not to a designer or tool.

Explore genuinely different directions while the problem or visual approach remains uncertain, then request focused feedback before polishing one direction. For motion, treat durations under roughly 300 milliseconds as a starting heuristic for ordinary interface transitions, not a universal requirement. Frequency, travel distance, consequence, platform convention, and user control determine the final timing.

Craft comes from accumulated correctness: alignment, optical balance, hit areas, focus, pressed states, origins, loading behavior, text fallback, gesture cancellation, and other details that may be individually quiet. Review those details in context. Do not add effects merely to signal effort.

## Examples

### Destructive bulk action

Non-compliant: A red trash icon immediately deletes selected records and shows a temporary toast.

Compliant: The action names the selected scope and consequence, requires appropriate authorization and review, prevents duplicate submission, reports partial outcomes, and provides reversal or a documented recovery path.

### Trend-associated landing page

Non-compliant: A page combines a gradient headline, three equal feature cards, decorative glow, terminal mockup, and unsupported testimonials because those elements appeared in a generated template.

Compliant: A page may use the same techniques when the hierarchy follows the buyer's decision, the terminal shows representative product behavior, the testimonials are traceable, the visual system is coherent, and the anti-slop review records why each material choice belongs.

## Sources

- World Wide Web Consortium, [Web Content Accessibility Guidelines 2.2](https://www.w3.org/TR/WCAG22/). Reviewed August 13, 2026.
- US Web Design System, [Design Principles](https://designsystem.digital.gov/design-principles/). Reviewed August 13, 2026.
- Apple, [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines). Reviewed August 13, 2026.
- Emil Kowalski, [Skills for Design Engineers](https://github.com/emilkowalski/skills). Reviewed September 1, 2026.
- Emil Kowalski, [Agents with Taste](https://emilkowal.ski/ui/agents-with-taste). Reviewed September 1, 2026.
- Emil Kowalski, [You Don't Need Animations](https://emilkowal.ski/ui/you-dont-need-animations). Reviewed September 1, 2026.
- Linear, [A calmer interface for a product in motion](https://linear.app/now/behind-the-latest-design-refresh). Reviewed September 1, 2026.
- Linear, [Manage design projects](https://linear.app/method/manage-design-projects). Reviewed September 1, 2026.
- Apple, [Designing Fluid Interfaces](https://developer.apple.com/videos/play/wwdc2018/803/). Reviewed September 1, 2026.
- Apple, [The details of UI typography](https://developer.apple.com/videos/play/wwdc2020/10175/). Reviewed September 1, 2026.
- Google, [How to create high-performance CSS animations](https://web.dev/articles/animations-guide). Reviewed September 1, 2026.
- Vercel, [How our agents build on-brand pages with design.md](https://vercel.com/blog/how-our-agents-build-on-brand-pages-with-design-md). Reviewed September 1, 2026.
- Vercel, [Teaching agents product design at Vercel](https://vercel.com/blog/teaching-agents-product-design-at-vercel). Reviewed September 1, 2026.
- Anthropic, [Demystifying evals for AI agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents). Reviewed September 1, 2026.
- OpenAI, [Model guidance](https://developers.openai.com/api/docs/guides/latest-model). Reviewed September 1, 2026.
- Microsoft, [Visual comparisons](https://playwright.dev/docs/test-snapshots). Reviewed September 1, 2026.
- World Wide Web Consortium, [Evaluating Web Accessibility Overview](https://www.w3.org/WAI/test-evaluate/). Reviewed September 1, 2026.
- GOV.UK Design System, [Contribution criteria](https://design-system.service.gov.uk/community/contribution-criteria/). Reviewed September 1, 2026.
- Design Tokens Community Group, [Design Tokens Format Module 2025.10](https://www.w3.org/community/reports/design-tokens/CG-FINAL-format-20251028/). Reviewed September 1, 2026.
