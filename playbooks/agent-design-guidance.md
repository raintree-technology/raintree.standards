---
id: PLAYBOOK-AGENT-DESIGN-GUIDANCE
title: Agent design guidance and evaluation
description: Procedure for maintaining repository design guidance, bounded implementation primitives, matched interface evaluations, and production-feedback correction loops.
type: playbook
status: draft
governance_status: draft
owners: [design, product, ai, engineering, accessibility]
last_reviewed: 2026-09-01
review_by: 2026-12-01
stale_after: 2026-12-01
applies_to: [agent-design-guidance, design-md, design-skill, agent-interface-evaluation]
tags: [playbook, design, agents, evaluation, design-system, anti-slop]
depends_on: [DESIGN-INTERACTION, AI-AGENTS, ENGINEERING-TESTING, FND-EVIDENCE, FND-TRUST, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-09-01T21:18:44-07:00" }
sources:
  - id: chimala-world-class-ai-designer
    resource: https://www.lennysnewsletter.com/p/how-to-turn-your-ai-into-a-world
    title: How to turn your AI into a world-class designer
    author: human:anshu-chimala
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

# Agent design guidance and evaluation

Use this playbook when a repository or organization maintains reusable instructions that help models or agents generate, edit, or review interfaces. The result is a scoped guidance system, a bounded implementation vocabulary, a versioned evaluation suite, and an evidence-driven maintenance loop. It does not authorize an agent to establish product policy or approve its own design work.

Start with the [agent interface evaluation](../templates/agent-interface-evaluation.md) and use the [interface quality review](../templates/interface-quality-review.md) for each final rendered candidate.

## Architecture

Keep four concerns distinct:

1. **Routing and scope** determine when the guidance loads, what surface it governs, which canonical references apply, and when it must remain inactive.
2. **Design judgment** explains the audience, task, information hierarchy, product character, accepted decisions, exceptions, examples, and coverage gaps.
3. **Implementation primitives** provide governed components, tokens, styles, patterns, and assets so the agent does not reinvent repeatable mechanics. Keep a canonical machine-readable source, explicit types and semantics, platform transforms, supported variants, versions, and deprecations.
4. **Evaluation and checks** test routing, behavior, rendering, regression, and final quality with the grader suited to each claim.

Do not copy component contracts, accessibility requirements, or policy into `design.md` when another governed source owns them. Route to the canonical source and record its version.

## Formative design loop

Use these optional techniques while the direction remains exploratory. They help an agent widen and refine the design space, but they do not replace the product rationale, evaluation suite, accessibility evidence, or independent human approval required elsewhere in this playbook.

1. **Explore distinct directions.** Start from the audience, task, content, product character, and platform constraints. Generate several directions that differ on named structural, behavioral, or visual axes before polishing one. When repeated attempts collapse into the same familiar composition, introduce a bounded external stimulus such as a recorded random seed string, an unrelated visual reference, or an alternate spatial metaphor. Use the stimulus to widen the search, not as the final rationale. Record it when another person must reproduce or evaluate the exploration. A design owner must select a direction because it serves the product context, not because it is random, novel, or visually intense.
2. **Run a bounded fresh-context critique.** Give a separate critic the rendered artifact, product brief, review rubric, representative content and states, and any licensed reference set needed to judge the intended result. Withhold implementation detail and earlier rationale when doing so reduces anchoring, but do not withhold facts needed to evaluate task fit, truthfulness, accessibility, or system state. Set the iteration count, cost or time limit, stopping conditions, and escalation path before the loop begins. Treat a model score as advisory evidence only. A model critic must not approve the work, and a fixed score such as `9/10` must not replace the release criteria or independent human review.
3. **Use generated media only when it has a job.** Consider generated imagery or motion when it improves product identity, comprehension, evidence, feedback, or spatial continuity. Prefer governed components, platform behavior, or existing approved assets when they serve the same purpose with less complexity. Route produced or licensed images, audio, and video through `MEDIA-PRODUCTION-RIGHTS` for the media contract, provenance, authority, accessibility, truthfulness, distribution, and retirement requirements. Apply `DESIGN-INTERACTION-013` to motion and verify performance, reduced-motion behavior, fallbacks, interruption, and frame-by-frame continuity. Deliver provider credentials through the approved `SECURITY-SECRETS` path; never place secret values in prompts, agent instructions, source control, or generated artifacts.

After selecting a direction, remove elements that do not support hierarchy, identity, feedback, comprehension, or the task. Apply `DESIGN-INTERACTION-011` and `DESIGN-INTERACTION-017`; do not equate subtraction with an empty or capability-poor interface.

## Procedure

1. **Define the reader and decision.** Name who uses the guidance, which agents and surfaces it governs, the release decision it supports, and excluded work.
2. **Choose one recurring artifact or surface.** Start with real requests and repeated review corrections. Do not begin with a universal instruction such as “make it polished.”
3. **Collect evidence.** Preserve representative user tasks, shipped examples, design decisions, review comments, product vocabulary, component contracts, accessibility requirements, recurring failures, and unresolved gaps. Confirm permission, licensing, minimization, sanitization, retention, and deletion before creating fixtures.
4. **Write observable guidance.** State the reader's job, desired outcome, information priority, product-specific rationale, available primitives, prohibited fabrications, exceptions, and examples. Replace subjective adjectives with inspectable behavior.
5. **Define routing separately.** Add a short persistent trigger that names when to load the guidance and when to skip it. Test trigger recognition independently from rule adherence.
6. **Bound implementation choices.** Expose exact governed components, tokens, styles, assets, and composition primitives. Keep their implementation outside model context when practical, but document their names, types, semantics, supported states, themes, platform transforms, version, deprecation, and ownership. Validate generated artifacts against the canonical source.
7. **Create evaluation scenarios.** Use real task shapes with fixed prompts, inputs, data, render settings, tools, and success criteria. Include applicable and out-of-scope scenarios, content extremes, accessibility states, multiple structures, and likely failure modes.
8. **Save the baseline.** Run each scenario without the candidate guidance and retain the first valid attempt, trace, configuration, and full rendered artifact. Do not reroll a weak design away.
9. **Add holdouts and regressions.** Keep some expected decisions outside the guidance examples. Preserve previously passing failures as regression scenarios. Prevent the suite from rewarding one copied template.
10. **Run matched trials.** Change only the declared guidance or primitive version. Use multiple independent trials when making reliability claims. Isolate each run from prior outputs, shared state, caches, and history that would contaminate independence.
11. **Apply mixed graders.** Use deterministic checks for objective mechanics, outcome inspection for the rendered artifact, model critique only under a calibrated rubric, and independent human review for hierarchy, composition, usefulness, coherence, and product fit. Record disagreement instead of averaging it away.
12. **Review blindly where practical.** Randomize candidate and baseline order without revealing which guidance produced each artifact. Judge first attempts at full scale and inspect traces when the result is surprising.
13. **Separate failure classes.** Distinguish routing failure, guidance-comprehension failure, missing primitive, deterministic defect, harness defect, model-specific behavior, subjective disagreement, and genuine coverage gap.
14. **Land the narrowest correction.** Put product judgment in guidance, mechanics in components or tokens, objective defects in code checks, routing defects in persistent instructions, and evaluation defects in the harness. Require a human owner to accept a shared rule.
15. **Rerun affected and broad coverage.** A targeted rerun shows whether the correction works; regression and holdout runs show whether it caused collateral damage or overfitting.
16. **Make a bounded decision.** State the exact models, agent harness, guidance version, primitive version, scenario set, trial count, graders, environments, results, blockers, and limitations. Do not generalize beyond them.
17. **Monitor real use.** Collect production corrections on a declared cadence, group recurring complaints without converting them directly into rules, and have a person decide the correct owner and enforcement layer.
18. **Measure correction durability.** Track whether each accepted complaint category declines in comparable work. Revise or revert controls that do not reduce the failure, fail to load, or create worse regressions.
19. **Protect expected results.** Version screenshots, semantic snapshots, rubrics, thresholds, and expected states. Require review of candidate, expected, and diff artifacts before updating them. Never approve a baseline update solely because the test failed.
20. **Control rendering variance.** Pin or record browser, operating system, viewport, device scale, fonts, locale, timezone, color scheme, reduced-motion setting, network data, clock, animation state, and external assets. Use environment-specific baselines when rendering differs legitimately.
21. **Layer rendered evidence.** Combine structural, accessibility-tree, interaction, objective layout, visual-comparison, assistive-technology, and human design review according to the claim. State what each layer cannot prove.
22. **Audit suite health.** Review ambiguity, saturation, blind spots, duplicate scenarios, contaminated holdouts, flaky graders, unused scenarios, false positives, false negatives, cost, latency, and whether observed production failures are represented.
23. **Requalify material changes.** Rerun the applicable capability, holdout, regression, routing, accessibility, and human-review coverage after changes to models, agent harnesses, instructions, examples, components, tokens, fonts, browsers, rendering infrastructure, graders, or task distribution.

## Suggested `design.md` structure

Keep the file short enough to load reliably. Split it into routed references when surface-specific detail grows.

1. Scope, trigger, and exclusions
2. Intended readers, jobs, and decisions
3. Product character and desired experience
4. Information architecture and evidence hierarchy
5. Observable visual and interaction decisions
6. Available components, tokens, styles, and assets
7. Content, accessibility, responsive, and state requirements
8. Named recurring failures and why they fail
9. Good and bad examples with provenance
10. Exceptions, open decisions, and coverage gaps
11. Verification and handoff requirements
12. Owner, version, review date, and change history

## Grader routing

| Claim | Primary grader | Required corroboration |
| --- | --- | --- |
| Guidance loaded for an applicable request | Trace or explicit load record | Out-of-scope negative case |
| Required token or component used | Static or DOM check | Rendered state inspection |
| Layout fits declared viewport | Browser measurement | Full-page capture |
| Content and claims preserve supplied facts | Deterministic comparison where possible | Human review of meaning and caveats |
| Hierarchy supports the reader's task | Independent human rubric | Blind comparison when practical |
| Product fit and visual coherence | Independent design review | Representative content and states |
| Guidance improves reliability | Repeated matched trials | Holdouts, regressions, confidence limits, and trial inspection |

Aggregate scores summarize evidence; they do not override a shipping blocker or prove unmeasured quality. A model judge may assist critique but must be calibrated against qualified human decisions and must not approve its own output.

## Evaluation design requirements

- Define the target population of requests before selecting scenarios. Stratify by surface, task, reader, information structure, interaction, content length, locale, accessibility state, viewport, and failure consequence where they materially vary.
- Keep capability scenarios difficult enough to reveal improvement. Keep regression scenarios stable and near-complete enough to reveal backsliding. Do not combine their scores into one release number.
- Prevent holdout leakage through examples, filenames, expected outputs, repository history, caches, or prior trial artifacts.
- Predefine valid-trial, infrastructure-failure, retry, exclusion, tie, blocker, and inconclusive rules. Preserve every attempted run and the reason for any exclusion.
- Report raw counts and denominators. Use confidence intervals or another justified uncertainty description for comparative claims, and avoid ranking small differences the trial design cannot distinguish.
- Calibrate model graders on a representative human-labeled set. Track false positives, false negatives, disagreement, rubric changes, and drift after model or task-distribution changes.
- Treat pairwise preference as evidence about the compared artifacts, not an absolute quality score. Randomize order and inspect positional bias where the decision is consequential.
- Keep cost, latency, and token use visible, but do not trade away a blocking accessibility, truthfulness, or task-completion requirement to improve an aggregate efficiency score.

## Rendered verification layers

| Layer | Suitable claims | Does not establish |
| --- | --- | --- |
| Static source or token validation | Allowed primitives, types, references, and prohibited constructs | Final layout, behavior, or perceptual quality |
| Semantic or accessibility-tree snapshot | Roles, names, states, relationships, and reading structure | Visual hierarchy, clipping, contrast in context, or usability |
| Interaction test | Reachable behavior, focus movement, state transitions, and recovery | Overall composition or cross-environment fidelity |
| Browser measurement | Overflow, target geometry, visibility, relative position, and viewport constraints | Whether the composition serves the reader |
| Controlled visual comparison | Unintended pixel or perceptual rendering changes | Accessibility, meaning, product fit, or overall quality |
| Automated accessibility evaluation | Machine-detectable failures for the exercised state | Accessibility conformance or practical usability by itself |
| Assistive-technology and representative-user evaluation | Practical perception, operation, comprehension, and recovery | Untested users, tasks, states, or environments |
| Independent design review | Hierarchy, composition, evidence framing, coherence, and product fit | Deterministic correctness outside the reviewed scope |

Mask or normalize only content that is legitimately nondeterministic and irrelevant to the claim. Prefer controlling the source of variance. A broad mask can conceal the exact regression the comparison is intended to detect.

## Baseline change record

For each expected-artifact update, record:

- baseline ID, previous revision, and candidate revision;
- reason for the change and governing product decision;
- environment and tool versions;
- candidate, expected, and diff artifact locations;
- affected scenarios and claims;
- human inspection result;
- accessibility and interaction impact;
- regression and holdout rerun results;
- approver independent of the producing agent; and
- rollback or restoration path.

## Completion evidence

- Guidance scope, trigger, exclusions, canonical sources, owner, and version
- Governed primitive inventory and unsupported gaps
- Versioned scenarios with fixed inputs, render settings, success criteria, and privacy-safe fixtures
- Routing-positive and routing-negative evidence
- Saved first-attempt baselines and matched candidate trials
- Held-out, regression, accessibility, responsive, and content-extreme coverage
- Model, agent harness, tool, guidance, primitive, environment, and grader versions
- Complete traces, rendered outputs, deterministic results, human findings, and disagreements
- Failure classification and narrow correction owner
- Targeted reruns plus broader holdout and regression results
- Bounded release decision, blockers, exceptions, and residual uncertainty
- Production-feedback cadence, complaint taxonomy, trend results, and next owner
- Evaluation-population definition, sampling rationale, raw counts, denominators, uncertainty, exclusions, and grader-disagreement evidence
- Versioned baselines with candidate, expected, and diff review plus independent update approval
- Rendering-environment controls and nondeterminism decisions
- Layer-to-claim verification map with automated, manual, assistive-technology, representative-user, and independent design evidence as applicable
- Suite-health review and material-change requalification triggers
- Independent design review of the final rendered artifact

## Example

A shared instruction says to make reports “clean and executive-friendly.” Different agents produce unrelated dashboard templates. The team replaces the adjective with a reader decision, evidence hierarchy, supported table and chart primitives, and named failure patterns. It freezes representative proposal and report scenarios, saves first-attempt baselines, adds an out-of-scope product screen, and runs matched trials. Browser checks catch overflow and token misuse; blind human review judges whether the recommendation and evidence hierarchy work. A repeated squeezed-table failure becomes a layout check, while a weak recommendation hierarchy remains guidance. The release record reports the exact scenario set and blockers without claiming that the guidance guarantees good design.

## Sources

- Anshu Chimala, [How to turn your AI into a world-class designer](https://www.lennysnewsletter.com/p/how-to-turn-your-ai-into-a-world), September 1, 2026. Reviewed September 1, 2026.
- Vercel, [How our agents build on-brand pages with design.md](https://vercel.com/blog/how-our-agents-build-on-brand-pages-with-design-md). Reviewed September 1, 2026.
- Vercel, [Teaching agents product design at Vercel](https://vercel.com/blog/teaching-agents-product-design-at-vercel). Reviewed September 1, 2026.
- Anthropic, [Demystifying evals for AI agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents). Reviewed September 1, 2026.
- OpenAI, [Model guidance](https://developers.openai.com/api/docs/guides/latest-model). Reviewed September 1, 2026.
- Microsoft, [Visual comparisons](https://playwright.dev/docs/test-snapshots). Reviewed September 1, 2026.
- World Wide Web Consortium, [Evaluating Web Accessibility Overview](https://www.w3.org/WAI/test-evaluate/). Reviewed September 1, 2026.
- GOV.UK Design System, [Contribution criteria](https://design-system.service.gov.uk/community/contribution-criteria/). Reviewed September 1, 2026.
- Design Tokens Community Group, [Design Tokens Format Module 2025.10](https://www.w3.org/community/reports/design-tokens/CG-FINAL-format-20251028/). Reviewed September 1, 2026.
