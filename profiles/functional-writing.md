---
id: PROFILE-FUNCTIONAL-WRITING
title: Functional writing profile
description: Routes functional writing to clarity, evidence, trust, and final-artifact review requirements.
type: profile
status: draft
governance_status: draft
owners: [content, standards]
last_reviewed: 2026-09-02
review_by: 2027-03-02
stale_after: 2027-03-02
applies_to: [functional-writing]
tags: [profile, writing, content]
depends_on: [WRITING-FUNCTIONAL, FND-EVIDENCE, FND-TRUST, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-09-02T21:56:39-07:00" }
---

# Functional writing profile

Use this profile to create, edit, or formally review documentation, explanations, answers, summaries, change records, interface text, reports, and messages. Do not use it for fiction or marketing copy unless the task explicitly adopts it.

Load every required dependency before applying this profile. If a dependency cannot be located through `catalog.yaml` or read completely, stop and report the dependency ID, expected path, and failure. Do not substitute the summaries below or remembered guidance for the missing document.

## Required standards

The front-matter `depends_on` list is the authoritative machine-readable route. This section explains why each dependency applies and must match that list.

- `WRITING-FUNCTIONAL` — defines the reader, language, structure, procedure, summary, authority, and review rules
- `FND-EVIDENCE` — limits factual and completion claims to evidence that was actually obtained
- `FND-TRUST` — requires truthful framing and informed reader choices
- `AGENT-VERIFICATION` — requires final-artifact inspection, explicit limitations, and a reproducible handoff

## Conditional standards

- User-facing failure message → `CONTENT-ERRORS` at [`error-messages.md`](../error-messages.md)
- Interface label, guidance, state, confirmation, or localization unit → `CONTENT-INTERFACE`
- Public documentation or indexable page → `PROFILE-PUBLIC-WEB-PAGE`
- Personal data in documentation, reports, messages, examples, screenshots, or review evidence → `PRIVACY-DATA`
- Repository instructions, prompts, tool descriptions, skills, playbooks, or durable knowledge for agents → `AI-AGENTS`
- Functional writing that contains a marketing or conversion claim → `PROFILE-MARKETING-LIFECYCLE`
- Sales collateral, outreach, public relations, sponsored content, app-store copy, or partner material → `PROFILE-SPECIALIST-MARKETING`
- Project, supplier, facility, counterparty, or diligence evidence review → `PROFILE-COMMERCIAL-EVIDENCE-REVIEW`
- Public terms, privacy or cookie notice, acceptable-use policy, legal addendum, or legal center → `PROFILE-LEGAL-DOCUMENT`
- Other legal, regulatory, safety, or medical content → no complete domain standard exists in this library; escalate to a qualified reviewer and record the governing external policy before publication

## Artifact classification gate

Classify the artifact before selecting completion evidence:

1. **Atomic** — One field, label, title, commit subject, or sentence without an independent procedure or supporting argument.
2. **Bounded** — One message or short document that can contain paragraphs or lists but does not meet the extended condition.
3. **Extended** — A multi-section, public, consequential, procedural, localized, quantitative, media-bearing, or agent-instruction artifact.

Within this profile, start with all completion-evidence items below. Subtract an item only after recording that its governed rule's `Applies when` condition is false for the classified artifact. Record the item as `not applicable` and state the observed reason. This gate is an applicability decision, not an exception: it does not deactivate a required dependency, waive an applicable rule, lower a rule's level, or convert unavailable verification into a pass. If classification is uncertain, retain the item and report its verification status. Use `governance/exceptions.md` when an applicable rule cannot be satisfied and permits an exception.

An atomic artifact normally subtracts checks for structures it does not contain, such as procedures, headings, images, localization, tables, and reader testing. It still retains applicable accuracy, exact-name, change-summary, final-context, and edit-authority checks. A public or consequential artifact is extended even when it is short.

## Agent edit authority

Apply `AGENT-VERIFICATION-003` before changing a target repository or shared artifact. A review request is read-only. An edit request authorizes meaning-preserving changes only within its stated scope. Report a proposed edit that changes a factual claim instead of applying it unless the task separately authorizes a factual update and the evidence supports that update. Follow the precedence and provenance rules through their owning documents rather than restating them here.

## Completion evidence

Each **Verification tier** names the minimum method needed for that item. Under `FND-EVIDENCE-003` (**Do not claim unperformed verification**), report `not run` when the method was available but was not performed and `not available` when the artifact, tool, environment, or human reader was unavailable. A source inspection cannot satisfy a rendered-artifact, accessibility-tool, procedure-walkthrough, or representative-reader tier. For an item with more than one tier, report each tier separately.

- `FND-EVIDENCE-003`
  - **Level:** `prohibited`
  - **Verification tier:** record inspection
  - **Evidence:** Every completion statement maps to actual output, an inspected artifact, or a labeled manual observation; every missing method uses `not run` or `not available` instead of a satisfaction claim.
  - **Symptoms:** A result says or implies that a review passed without the named tier evidence; an unavailable check disappears; a source inspection is presented as rendered, tool-assisted, walkthrough, or reader evidence.
- `WRITING-FUNCTIONAL-001`
  - **Level:** `required`
  - **Verification tier:** source inspection
  - **Evidence:** The artifact or review record identifies the intended reader and primary purpose. An atomic artifact can rely on reasonably inferable context instead of adding a review note to the artifact.
  - **Symptoms:** The reader is unnamed or not inferable; the opening does not reveal what the artifact helps the reader understand or do; required context is missing.
- `WRITING-FUNCTIONAL-002`
  - **Level:** `required`
  - **Verification tier:** source comparison
  - **Evidence:** Material factual claims, requirements, qualifications, and completion statements trace to cited or recorded source evidence.
  - **Symptoms:** A style edit changes meaning; certainty exceeds the source; a condition, exception, risk, or unknown disappears.
- `WRITING-FUNCTIONAL-003`
  - **Level:** `required`
  - **Verification tier:** source inspection for terminology consistency; source comparison for exact names, labels, paths, and values
  - **Evidence:** Source inspection finds no unintended alternate terms. Separate source comparison confirms each exact identifier against its authoritative artifact.
  - **Symptoms:** One concept has competing names; a control or path differs from its source; an acronym or specialist term is unexplained for the intended reader.
- `WRITING-FUNCTIONAL-004`
  - **Level:** `required`
  - **Verification tier:** source inspection
  - **Evidence:** The opening states the result, decision, request, or main claim before its supporting detail.
  - **Symptoms:** Background delays the result; a reader must reach the end to learn the decision; paragraphs mix unrelated topics.
- `WRITING-FUNCTIONAL-005`
  - **Level:** `recommended`
  - **Verification tier:** source inspection
  - **Evidence:** Explanatory prose and instructions use direct, complete sentences, or the review records a concrete reason for deviating.
  - **Symptoms:** Filler, avoidable passive voice, stacked noun phrases, long multi-claim sentences, idioms, or missing subjects obscure the meaning.
- `WRITING-FUNCTIONAL-006`
  - **Level:** `required`
  - **Verification tier:** procedure walkthrough
  - **Evidence:** A walkthrough performed in order records prerequisites, actions, non-obvious results, and the point at which the procedure succeeds or fails.
  - **Symptoms:** A step depends on omitted knowledge; warnings follow the risky action; steps contain several primary actions; the reviewer cannot tell whether a step succeeded.
- `WRITING-FUNCTIONAL-007`
  - **Level:** `required`
  - **Verification tier:** source inspection for semantic structure; rendered artifact for delivery-format placement and relationships
  - **Evidence:** Source inspection confirms meaningful headings, correct list semantics, parallel items, and descriptive links. Separate rendered inspection confirms that the delivery format preserves those relationships and keeps warnings with the affected action.
  - **Symptoms:** Sequence appears unordered; list items are not parallel; headings do not describe their sections; link text loses meaning outside its sentence; warnings are visually detached from the affected action.
- `WRITING-FUNCTIONAL-008`
  - **Level:** `required`
  - **Verification tier:** source comparison for interface labels; rendered artifact for literal formatting; accessibility tool for non-text alternatives
  - **Evidence:** Source comparison confirms exact interface labels. Separate rendered inspection confirms that literals remain distinguishable. Separate accessibility-tool output confirms useful alternatives for meaningful images and omission of decorative images from assistive output.
  - **Symptoms:** Labels do not match the interface; literals look like prose; an image has missing, redundant, filename-only, or appearance-only alternative text; a decorative image is announced.
- `WRITING-FUNCTIONAL-009`
  - **Level:** `required`
  - **Verification tier:** source inspection for an atomic plain-text summary; rendered artifact when platform or repository presentation affects the result
  - **Evidence:** The final summary is imperative and grammatical after “If applied, this change will.” When presentation conventions apply, separate rendered inspection confirms body separation, prefix, punctuation, length, and wrapping.
  - **Symptoms:** The subject describes activity instead of outcome; it is not grammatical after “If applied, this change will”; punctuation, length, prefix, or wrapping conflicts with the governing repository convention.
- `WRITING-FUNCTIONAL-010` and `AGENT-VERIFICATION-002`
  - **Level:** `required`
  - **Verification tier:** rendered artifact
  - **Evidence:** The handoff names the inspected medium and records the final-context result without duplicating the review record.
  - **Symptoms:** Only source text was inspected; the medium is unnamed; wrapping, context, links, formatting, or accessibility remain unchecked but the handoff claims completion.
- When localized, `WRITING-FUNCTIONAL-011`
  - **Level:** `required`
  - **Verification tier:** source inspection for translation units; rendered artifact for representative locales; accessibility tool for localized accessible names
  - **Evidence:** Source inspection confirms complete translation units and named placeholders. Separate long, plural, right-to-left, and non-Latin renderings confirm meaning, layout, links, and literals. Separate accessibility-tool output confirms localized accessible names.
  - **Symptoms:** Messages are assembled from fragments; placeholders lack context; translation truncates or reorders meaning; direction, plural, number, date, link, or accessible-name behavior fails.
- When quantitative or tabular, `WRITING-FUNCTIONAL-012` and `FND-EVIDENCE-007`
  - **Level:** `required`
  - **Verification tier:** source comparison, rendered artifact, and accessibility tool
  - **Evidence:** Source comparison traces values to their method, scope, units, periods, populations, denominators, and uncertainty. Separate rendered inspection confirms headers and visible relationships. Separate accessibility-tool output confirms reading order and a decision-relevant text equivalent.
  - **Symptoms:** A number lacks scope or units; precision exceeds the method; headers do not identify relationships; reading order is ambiguous; chart text describes appearance but omits the relevant pattern.
- When consequential or repeatedly misunderstood, `WRITING-FUNCTIONAL-013`
  - **Level:** `required`
  - **Verification tier:** representative-reader review
  - **Evidence:** A comprehension record identifies the readers or approved method, tasks, observed misunderstandings, changes, and any required retest.
  - **Symptoms:** The author substitutes personal confidence for reader evidence; participants do not represent the least-informed audience; the review measures preference instead of the ability to find, understand, and act.
- When `CONTENT-ERRORS` is active, `CONTENT-ERRORS-001`, `CONTENT-ERRORS-002`, `CONTENT-ERRORS-004`, `CONTENT-ERRORS-006`, and `CONTENT-ERRORS-008`
  - **Level:** `required`
  - **Verification tier:** source comparison for safe and truthful meaning; rendered artifact for placement and persistence; accessibility tool for focus and announcements
  - **Evidence:** Source comparison confirms the failed outcome, next action, safe specificity, and truthful protocol meaning. Separate rendered inspection confirms placement and persistence. Separate accessibility-tool output confirms focus and announcements.
  - **Symptoms:** The message blames the user, hides the next action, appears on the wrong surface, leaks sensitive detail, loses focus or announcements, or contradicts the machine-readable failure.
- When `PRIVACY-DATA` is active, `PRIVACY-DATA-003`, `PRIVACY-DATA-005`, `PRIVACY-DATA-012`, and `PRIVACY-DATA-014`
  - **Level:** `required`
  - **Verification tier:** source comparison
  - **Evidence:** The artifact and its evidence include only needed personal data, explain relevant processing, control recipients, and keep personal data out of unsafe evidence and development paths.
  - **Symptoms:** Examples or screenshots expose unnecessary personal data; processing or recipients are undisclosed; review evidence enters an unauthorized system or location.
- When `AI-AGENTS` is active, `WRITING-FUNCTIONAL-014`, `AI-AGENTS-002`, and `AI-AGENTS-020`
  - **Level:** `required`
  - **Verification tier:** procedure walkthrough
  - **Evidence:** Applicable and non-applicable task walkthroughs cover scope, outcome, inputs, ordered procedure, postconditions, forbidden actions, escalation, verification, ownership, and versioned reuse.
  - **Symptoms:** The instruction loads outside its scope; required input or success state is implicit; a forbidden action has no boundary; missing-input, conflict, failure, or completion behavior is undefined.
- For style, quality, or authorship-sensitive review, `WRITING-FUNCTIONAL-015`
  - **Level:** `recommended`
  - **Verification tier:** source inspection; supporting language-tool inspection when used
  - **Evidence:** Review notes connect each proposed style change to the intended reader or an applicable rule and do not treat patterns, preferences, detectors, vocabulary, or Harper categories as proof of a defect or AI authorship. When Harper output is used, the record includes its version, configuration, dialect, result kind, and disposition.
  - **Symptoms:** A reviewer rewrites effective text to satisfy personal taste; a pattern or Harper result becomes an automatic defect; a style or regional result is reported as incorrect grammar; the review labels authorship without adequate evidence.
- For agent review or editing, `AGENT-VERIFICATION-003`
  - **Level:** `required`
  - **Verification tier:** source comparison
  - **Evidence:** The review record identifies review-only, meaning-preserving edit, or factual-update authority; the final diff remains within scope; factual changes are proposed rather than silently applied; provenance keeps author and verifier separate.
  - **Symptoms:** A review request produces file changes; a style edit changes a fact; unrelated prose changes appear; the author records `verified` provenance for their own work.
- For a formal writing review, `AGENT-VERIFICATION-004` and `AGENT-VERIFICATION-005`
  - **Level:** `required`
  - **Verification tier:** record inspection
  - **Evidence:** Each finding contains rule ID, location, symptom, level, and proposed change; the review ends with a verdict and explicit **Unverified** block.
  - **Symptoms:** Findings cannot be traced to a rule or location; distinct issues are merged; the verdict ignores required failures or uncertainty; unavailable checks disappear from the report.
- For functional writing in English, `WRITING-FUNCTIONAL-016`
  - **Level:** `required`
  - **Verification tier:** source inspection; supporting grammar-tool inspection when configured or proportionate
  - **Evidence:** Source inspection covers agreement and reference; time and verb form; modality and obligation; nouns and quantity; conditions and clause attachment; comparison and parallelism; modifiers and word order; usage and collocation; and mechanics. When a grammar tool is configured or proportionate, its separate result records the checker, version, configuration, language variety, ignored regions, and adjudicated findings. A disputed usage decision records its exact reference entry or topic and context.
  - **Symptoms:** Grammar obscures the actor, action, condition, sequence, quantity, comparison, or scope. Permission sounds mandatory or a prohibition has two readings. Pronouns lack clear antecedents, or clauses and modifiers attach to the wrong term. A dialect preference is presented as universal grammar. A tool result is auto-applied, omitted, or presented as proof without contextual review.

## Review output contract

For every formal review, emit one record per issue with these exact fields:

- **Rule ID:** Stable governed rule ID.
- **Location:** File, section, page, screen, or other exact locator.
- **Symptom:** Directly observed violation or uncertainty.
- **Level:** Governing requirement level.
- **Proposed change:** Narrow correction that preserves accurate meaning.

End with:

- **Verdict:** `conforming`, `non-conforming`, or `indeterminate`.
- **Unverified:** Every applicable check that was `not run`, `not available`, failed, substituted, or partial, with its rule ID and practical limit.

Use `non-conforming` when an applicable `required` or `prohibited` rule fails. Use `indeterminate` when missing evidence prevents that decision. A deviation from a `recommended` rule alone does not make the artifact non-conforming.
