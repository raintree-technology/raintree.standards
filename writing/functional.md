---
id: WRITING-FUNCTIONAL
title: Functional writing
description: Defines clear, consistent, actionable writing for documentation, explanations, summaries, change records, interface text, reports, and messages.
type: standard
status: draft
governance_status: draft
owners: [content, standards]
last_reviewed: 2026-09-02
review_by: 2027-03-02
stale_after: 2027-03-02
applies_to: [functional-writing]
tags: [writing, documentation, communication, content]
depends_on: [FND-EVIDENCE, FND-TRUST, FND-ACCESSIBILITY, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-09-02T21:56:39-07:00" }
sources:
  - id: asd-ste100
    resource: https://asd-ste100.org/
    title: ASD-STE100 Simplified Technical English
    author: organization:asd-stemg
  - id: google-developer-style
    resource: https://developers.google.com/style
    title: Google developer documentation style guide
    author: organization:google
  - id: tim-pope-git-commit
    resource: https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
    title: A Note About Git Commit Messages
    author: human:tim-pope
  - id: chris-beams-git-commit
    resource: https://cbea.ms/git-commit/
    title: How to Write a Git Commit Message
    author: human:chris-beams
  - id: digital-gov-plain-language
    resource: https://digital.gov/guides/plain-language
    title: Plain language guide series
    author: organization:us-gsa
  - id: w3c-clear-content
    resource: https://www.w3.org/WAI/WCAG2/supplemental/objectives/o3-clear-content/
    title: Use Clear and Understandable Content
    author: organization:w3c
  - id: w3c-writing-accessibility
    resource: https://www.w3.org/WAI/tips/writing/
    title: Writing for Web Accessibility
    author: organization:w3c
  - id: openai-agents-md
    resource: https://learn.chatgpt.com/docs/agent-configuration/agents-md
    title: Custom instructions with AGENTS.md
    author: organization:openai
  - id: cognition-playbooks
    resource: https://docs.devin.ai/product-guides/creating-playbooks
    title: Creating Playbooks
    author: organization:cognition
  - id: simon-willison-llm-cliche-highlighter
    resource: https://tools.simonwillison.net/llm-cliche-highlighter
    title: LLM cliché highlighter
    author: human:simon-willison
  - id: harper-lint-kinds
    resource: https://github.com/Automattic/harper/blob/43745e24a6af0222d21ccd6fe1cc00570fe5e33c/harper-core/src/linting/lint_kind.rs
    title: Harper lint kinds
    author: organization:automattic
  - id: harper-default-configuration
    resource: https://github.com/Automattic/harper/blob/43745e24a6af0222d21ccd6fe1cc00570fe5e33c/harper-core/default_config.json
    title: Harper default configuration
    author: organization:automattic
  - id: oxford-practical-english-usage
    resource: https://www.oxfordlearnersdictionaries.com/us/about/practical-english-usage/introduction.html
    title: About Practical English Usage
    author: organization:oxford-university-press
  - id: oxford-learner-grammar-contents
    resource: https://www.oxfordlearnersdictionaries.com/us/grammar/online-grammar/table-of-contents
    title: Learn and Practise Grammar contents
    author: organization:oxford-university-press
---

# Functional writing

Functional writing must help its intended reader understand or act correctly after one read. This standard covers documentation, explanations, answers, summaries, change records, interface text, reports, and messages. It does not govern fiction or marketing copy unless the task adopts it explicitly.

When rules compete, protect accuracy first, then clarity, consistency, and brevity. Record an exception instead of publishing text that is false or harder to understand.

## Rules

### WRITING-FUNCTIONAL-001 — Define the reader and purpose

**Level:** required  
**Applies when:** Creating or materially revising functional writing.

Write for a named or reasonably inferable reader and one primary purpose. Include the context that the least-informed intended reader needs to understand or act.

**Why:** Text that assumes hidden context causes errors and cannot serve newcomers or later readers.

**Verify:**

- Identify the intended reader and the action, decision, or understanding the artifact must support.
- Confirm that the artifact defines necessary terms, prerequisites, and consequences.

**Exceptions:** Space-constrained interface text can rely on context that is visible on the same screen.

### WRITING-FUNCTIONAL-002 — Preserve accuracy over style

**Level:** required  
**Applies when:** Any writing rule would remove a necessary qualification, change meaning, or make the text misleading.

Keep the accurate meaning. Mark material uncertainty as an assumption, limitation, or unknown. Do not claim certainty, simplicity, safety, or completion beyond the available evidence.

**Why:** Clear prose that states the wrong thing creates more risk than awkward but accurate prose.

**Verify:**

- Compare factual claims, requirements, and completion statements with their source evidence.
- Confirm that edits for length or tone did not remove a condition, exception, or risk.

**Exceptions:** None.

### WRITING-FUNCTIONAL-003 — Use consistent, concrete terms

**Level:** required  
**Applies when:** An artifact names a concept, control, command, path, value, or measurement more than once.

Use one term for each concept. Use exact names and concrete values where they affect interpretation or action. Define an acronym or specialized term before its first use unless the intended reader can be expected to know it.

**Why:** Synonyms, vague quantities, and unexplained terms make readers infer whether two phrases mean the same thing.

**Verify:**

- Search for alternate names for key concepts and reconcile unintended variation.
- Check names, values, paths, and labels against the artifact or system they describe.

**Exceptions:** Preserve an exact quotation, external name, or interface label when changing it would be inaccurate.

### WRITING-FUNCTIONAL-004 — Put the outcome before supporting detail

**Level:** required  
**Applies when:** Writing an answer, explanation, report, summary, document, or message with supporting detail.

State the result, decision, request, or main claim first. Start each paragraph with its topic, and keep each paragraph focused on one topic.

**Why:** Readers can determine relevance before spending time on background or detail.

**Verify:**

- Read only the opening sentence and headings; confirm that they convey the artifact's purpose and outline.
- Confirm that each paragraph supports one identifiable topic.

**Exceptions:** A required legal, safety, or operational warning must appear before the action it affects.

### WRITING-FUNCTIONAL-005 — Write direct, complete sentences

**Level:** recommended

**Applies when:** Writing explanatory prose or instructions.

Prefer short, common words, active voice, present tense, and explicit subjects. Keep one main instruction or claim in each sentence. Remove filler, unexplained idioms, figurative language, and unnecessary noun forms.

**Why:** Direct sentence structures reduce ambiguity for global readers and people reading under time pressure.

**Verify:**

- Review sentences longer than about 25 words and paragraphs longer than six sentences; split them when that improves clarity.
- Search for filler, avoidable passive voice, stacked noun phrases, and terms that carry more than one intended meaning.

**Exceptions:** Use passive voice when the actor is unknown, irrelevant, or intentionally withheld. Keep a longer sentence when splitting it would obscure the relationship between its parts.

### WRITING-FUNCTIONAL-006 — Make procedures executable

**Level:** required  
**Applies when:** Writing instructions that a reader must follow.

State the goal and prerequisites before the steps. Put a condition or warning before the action it governs. Address the reader as “you” or use the imperative. Give one action per step, and state a non-obvious expected result.

**Why:** Readers must know whether a step applies, how to perform it, and whether it succeeded before they continue.

**Verify:**

- Follow the procedure in order using only the information in the artifact.
- Confirm that a sequence of more than two steps uses a numbered list and that each step has one primary action.

**Exceptions:** A compact reference can omit goals or results that are explicit in the surrounding context.

### WRITING-FUNCTIONAL-007 — Match structure to meaning

**Level:** required  
**Applies when:** Organizing headings, paragraphs, lists, warnings, or links.

Use numbered lists for sequences and bulleted lists for unordered sets. Keep list items grammatically parallel. Use headings that describe their sections and link text that describes its destination.

**Why:** Predictable structure lets readers scan without losing relationships or sequence.

**Verify:**

- Confirm that list type preserves whether order matters.
- Scan only headings and links; confirm that each remains meaningful out of surrounding prose.

**Exceptions:** Follow a required product or publishing template when its structure differs.

### WRITING-FUNCTIONAL-008 — Format names and alternatives accessibly

**Level:** required  
**Applies when:** Referring to interface controls, commands, filenames, paths, literal values, links, or meaningful images.

Copy interface labels exactly and format them according to the publishing system. Distinguish commands, filenames, paths, and literal values from prose. Give every meaningful image an equivalent text alternative.

**Why:** Exact labels and semantic formatting help readers find controls, distinguish literals, and access non-text content.

**Verify:**

- Compare labels and literals with the source interface or artifact.
- Inspect meaningful images for useful alternative text and decorative images for appropriate omission from assistive output.

**Exceptions:** Plain-text media can use unambiguous quotation or delimiters when semantic formatting is unavailable.

### WRITING-FUNCTIONAL-009 — Write change summaries for scanning

**Level:** required  
**Applies when:** Writing a commit subject, pull request title, change-log title, or another summary that describes a proposed or completed change.

Use a short imperative summary that names the outcome of the change. Capitalize its first word and omit a trailing period. Separate a body from its summary with a blank line. Use the body for context, rationale, effects, risks, or rejected alternatives that the artifact itself does not show.

**Why:** A consistent summary works in history, review lists, release notes, and automation without requiring the body.

**Verify:**

- Confirm that “If applied, this change will [summary]” forms a grammatical sentence.
- For Git commits, review subjects over about 50 characters and wrap plain-text body lines at 72 characters when repository conventions do not specify another format.

**Exceptions:** Follow an established repository or platform convention when it conflicts with capitalization, length, prefix, or punctuation rules. A trivial change can omit the body.

### WRITING-FUNCTIONAL-010 — Review the final text in context

**Level:** required  
**Applies when:** Functional writing is ready for delivery or publication.

Inspect the final rendered or plain-text artifact in its intended medium. Check accuracy, terminology, opening summary, structure, brevity, accessibility, and the reader's ability to act.

This rule specializes `AGENT-VERIFICATION-002` for functional writing. Use this rule's writing checks as part of that required final-artifact inspection, and report the result under `AGENT-VERIFICATION-005` rather than creating a second review record.

**Why:** Source text alone does not reveal broken wrapping, hidden context, inaccessible alternatives, or formatting that changes meaning.

**Verify:**

- Review the artifact in its delivery format and run any available spelling, link, terminology, or style checks.
- Confirm that a reader with the intended minimum context can understand or act after one read.

**Exceptions:** If the intended medium is unavailable, inspect the closest available representation and report the limitation.

### WRITING-FUNCTIONAL-011 — Prepare source text for localization

**Level:** required  
**Applies when:** Functional text will be translated, localized, or reused across locales.

Write complete messages with enough context for translators. Keep variables out of sentence fragments, identify placeholder meaning and grammatical role, and avoid assumptions about word order, plural forms, gender, name shape, date and number formats, text length, or reading direction.

**Why:** A sentence that works only when English fragments are concatenated cannot be translated reliably or presented correctly in every locale.

**Verify:**

- Inspect translation units for complete meaning, named placeholders, translator context, and locale-aware formatting.
- Render representative long, plural, right-to-left, and non-Latin translations in the intended medium.
- Confirm truncation, layout, links, literal values, and accessible names preserve meaning.

**Exceptions:** Single-locale text must still keep dynamic values distinct and avoid unnecessary concatenation when later localization is reasonably foreseeable.

### WRITING-FUNCTIONAL-012 — Make quantitative and tabular content interpretable

**Level:** required  
**Applies when:** Presenting measurements, comparisons, tables, charts, or computed results.

State units, time periods, populations, denominators, definitions, and material uncertainty. Give tables descriptive headers and a reading order, and provide a text equivalent or summary for charts that carries the decision-relevant meaning.

**Why:** Readers can misinterpret a precise-looking number or visual when its basis, comparison, or accessible structure is missing.

**Verify:**

- Trace material values to the definitions and evidence required by `FND-EVIDENCE-007`.
- Inspect table headers, captions, scope, ordering, and assistive-technology structure.
- Confirm the text alternative communicates the chart's relevant pattern, not only its appearance.

**Exceptions:** A compact display can rely on an adjacent legend or shared table context when the meaning remains unambiguous and accessible.

### WRITING-FUNCTIONAL-013 — Test consequential content for understanding

**Level:** required  
**Applies when:** Text governs a high-impact decision, repeated task, unfamiliar procedure, broad public obligation, or a flow with evidence of misunderstanding.

Evaluate the final content with representative intended readers or an approved comprehension method. Test whether readers can find, understand, and act on the material information rather than asking only whether they like the wording.

**Why:** Author review can confirm consistency and accuracy but cannot prove that the intended audience interprets the text as expected.

**Verify:**

- Record participant or method selection, representative tasks, observed misunderstandings, and resulting changes.
- Include readers near the least-informed intended audience and relevant accessibility or language needs.
- Re-test material revisions when the first review finds consequential confusion.

**Exceptions:** When reader testing is not feasible before an urgent release, obtain accountable approval, use the closest evidence available, and schedule post-release validation.

### WRITING-FUNCTIONAL-014 — Make agent instructions scoped and testable

**Level:** required  
**Applies when:** Writing repository instructions, prompts, skills, playbooks, tool descriptions, review rules, or durable knowledge for an agent.

State the trigger and scope, desired outcome, prerequisites and required user input, ordered procedure where order matters, postconditions, forbidden actions, escalation conditions, and verification. Put durable project rules in the governed project instruction system and task-specific procedures in the narrowest reusable artifact. Resolve precedence and conflicts explicitly.

**Why:** Vague or unscoped agent guidance is easy to ignore, apply in the wrong context, or satisfy without producing the intended state.

**Verify:**

- Run a representative applicable and non-applicable task and inspect which guidance was loaded and followed.
- Confirm every required postcondition has an inspectable check and every forbidden action has a clear boundary or safe alternative.
- Test missing input, conflicting instruction, failure, and completion behavior.

**Exceptions:** A one-time low-risk request can remain conversational when its outcome and limits are clear and no durable reuse is expected.

### WRITING-FUNCTIONAL-015 — Review style signals without treating preference as proof

**Level:** recommended

**Applies when:** Reviewing functional writing for style, quality, or possible AI assistance.

Treat style guides, pattern lists, detector results, personal taste, and authorship heuristics as review signals rather than proof of a defect. Check the text for repeated rhetorical templates, inflated claims, vague attribution, promotional filler, chatbot artifacts, and vocabulary clusters associated with formulaic AI writing. Use Simon Willison's *LLM cliché highlighter* pattern catalog as one review aid. Rewrite a match only when it obscures meaning, weakens evidence, repeats a structure unnecessarily, conflicts with the intended reader and purpose, or violates another applicable rule. Do not change accurate, effective text only to satisfy a style preference or make it appear more or less human-authored.

**Why:** Formulaic patterns can make writing sound staged, vague, or promotional, but many also occur naturally in clear human prose. The [authority rules](../governance/authority.md#rule-construction) place broad advice in guidance rather than required rules. Contextual review can improve an artifact without turning preference or a heuristic into an unsupported defect or authorship claim.

**Pattern catalog:**

1. **“No X, no Y” chains** — Two or more consecutive items introduced by “no.”
2. **“That’s the whole …”** — A claim that something is the whole point, game, idea, or thing.
3. **“Did not X, did not Y” chains** — Two or more consecutive clauses introduced by “did not” or “didn’t.”
4. **“Don’t VERB it … VERB it”** — A negated verb applied to “it,” followed by the same positive verb.
5. **“Sit with that”** — An invitation to sit with an idea, feeling, discomfort, or moment.
6. **“You already know”** — An assertion that the reader already knows the answer or necessary action.
7. **“Is the entire …”** — A subject described as the entire point, game, or business model.
8. **“The entire … is”** — An opener that defines the entire point, game, or business model.
9. **“Is real … and / not”** — A claim that something is real followed by a contrast or qualification.
10. **“The punchline is”** — A staged conclusion introduced as a punchline.
11. **“Worth naming”** — A claim that a feeling, loss, issue, or fact deserves to be named.
12. **“That’s not nothing”** — A litotic claim that something is not insignificant.
13. **“Is the whole …”** — Any subject described as the whole point, trick, pitch, or idea.
14. **Echoing sentence runs** — Consecutive sentences built from the same syntactic skeleton.
15. **Performative honesty** — Announced sincerity such as “I’ll be honest,” “to be clear,” or an initial “Honestly” or “Look.”
16. **“That’s the part …”** — A favored detail introduced as “the part” instead of being stated directly.
17. **“The only X I trust”** — A reveal framed as the only thing trusted, needed, or important.
18. **“Don’t take my word for it”** — A stock invitation for the reader to verify a claim.
19. **“Turns out …”** — A tidy conclusion introduced as a casual revelation.
20. **“Fits in your head”** — Simplicity boilerplate such as “batteries included,” “zero config,” “sane defaults,” or “it just works.”
21. **Stacked rhetorical questions** — Two or more consecutive questions used to create momentum rather than request answers.
22. **Repeated sentence openers** — Three or more consecutive sentences beginning with the same meaningful word.
23. **Colon into a triple** — A colon followed by three or more comma-separated items.
24. **“Here’s the twist”** — A stage-managed reveal introduced as the thing, twist, catch, kicker, or rub.
25. **“X is dead”** — An obituary-style declaration, including “dead; long live” constructions.
26. **“That’s why X mattered”** — A retrospective statement that assigns significance to an earlier detail.
27. **Stranded auxiliary contrast** — A reversal that ends on a bare auxiliary such as “did,” “didn’t,” “would,” or “wouldn’t.”
28. **AI vocabulary words** — Clusters of terms disproportionately associated with AI prose, including “delve,” “tapestry,” “meticulous,” “pivotal,” “intricate,” “interplay,” “underscore,” “garner,” “bolster,” “vibrant,” “bustling,” “multifaceted,” “seamless,” and “ever-evolving.”
29. **“Not just X, but Y”** — Negative parallelism such as “not only … but also” or “it’s not X—it’s Y.”
30. **“It’s important to note”** — Didactic hedging that announces what is important, notable, worth considering, or worth asking.
31. **“Stands as a testament”** — Inflated significance framed as a testament or reminder.
32. **“Plays a crucial role”** — Importance asserted through a crucial, pivotal, vital, key, or significant role.
33. **“Ever-evolving landscape”** — Generic scene-setting about a changing landscape or fast-paced world.
34. **“Experts argue”** — Claims attributed vaguely to unnamed experts, critics, observers, or reports.
35. **“Despite these challenges”** — Formulaic challenges-and-outlook language, including unresolved challenges and “time will tell.”
36. **Participle sentence tails** — Superficial analysis appended with participles such as “highlighting,” “underscoring,” “showcasing,” or “reflecting.”
37. **Promotional boilerplate** — Brochure language such as “nestled in,” “in the heart of,” “hidden gem,” “boasts,” “breathtaking,” or “stunning views.”
38. **Chatbot leftovers** — Model disclaimers, knowledge-cutoff language, citation debris, internal reference tokens, or tracking parameters copied from generated output.

**Harper result mapping:**

Harper is a useful English review aid, but its result categories do not share one requirement level. Map a result before deciding whether to change the text:

| Harper kind or family | Review interpretation | Governing route |
|---|---|---|
| `Agreement`, `BoundaryError`, `Grammar`, `Typo`, `WordOrder` | Candidate correctness defect | Apply `WRITING-FUNCTIONAL-016`; verify the sentence in context. |
| `Spelling`, `Capitalization`, `Punctuation`, `Formatting` | Candidate mechanics or exact-name defect | Apply `WRITING-FUNCTIONAL-003`, `WRITING-FUNCTIONAL-008`, or `WRITING-FUNCTIONAL-016`; protect literals, names, and medium conventions. |
| `Eggcorn`, `Malapropism`, `Nonstandard`, `Usage`, `WordChoice` | Candidate meaning or conventional-usage defect | Compare the intended meaning, audience, source terminology, and accepted language variety before changing it. |
| `Readability`, `Redundancy`, `Repetition` | Candidate clarity problem | Apply `WRITING-FUNCTIONAL-004` or `WRITING-FUNCTIONAL-005` only when the pattern delays, duplicates, or obscures useful meaning. |
| `Enhancement`, `Style` | Preference or optional improvement | Keep advisory under this rule unless another applicable rule identifies reader harm. |
| `Regionalism` | Audience and locale signal | Apply `WRITING-FUNCTIONAL-001` and, when localized, `WRITING-FUNCTIONAL-011`; do not label a valid dialect form as inherently wrong. |
| `Miscellaneous` | Unclassified signal | Inspect the underlying rule and sentence; infer no requirement level from the category. |

Harper's pinned default **Style and Redundancy** group also mixes different decisions:

| Harper default rules | Review question | Treatment |
|---|---|---|
| `FillerWords`, `DiscourseMarkers`, `LongSentences`, `KindOf`, `WayTooAdjective` | Does the wording delay or blur the main claim? | Propose a change when it improves the reader's ability to understand or act. |
| `Hedging` | Is the phrase empty caution, or does it preserve material uncertainty? | Remove empty qualification; retain or sharpen evidence-backed uncertainty under `WRITING-FUNCTIONAL-002`. |
| `RepeatedWords` and `Redundant*` rules | Is the repetition accidental, or does it distinguish scope or add necessary emphasis? | Remove accidental duplication; preserve meaning-bearing repetition. |
| `Excellent`, `FatalOutcome`, `Freezing`, `Starving`, `VeryUnique`, `WidelyAccepted` | Is the wording literal, supported, and appropriate to the reader? | Check evidence and trust before treating the result as style alone. |
| `AvoidContractions`, `BoringWords` | Does an adopted product, legal, or repository convention require this choice? | These rules are disabled in Harper's pinned default configuration. Do not enforce them as general correctness rules. |
| `Towards` and regional rules | Does the form match the intended language variety and local convention? | Prefer audience consistency; do not rewrite solely to impose another dialect. |

Pin the Harper version or commit and record the enabled rules when its output supports a review. Rule names, group membership, defaults, and results can change between versions.

**Verify:**

- Review matches from the current pattern catalog, including rhetorical chains, repeated sentence structures, stock contrasts and reveals, vague authority claims, inflated significance, promotional language, and chatbot leftovers.
- When Harper output is used, map each result through the tables above and record its version, configuration, dialect, and disposition.
- Inspect repeated or clustered matches before isolated matches, and record only changes that improve clarity, evidence, tone, structure, or fitness for the intended reader.
- Confirm that every proposed style change cites the reader need or applicable rule it serves rather than personal preference alone.
- Confirm the review does not label a writer or passage as AI-generated solely because it matches a listed pattern.

**Exceptions:** Preserve an exact quotation, required interface label, established term, or deliberate rhetorical device when it remains accurate and appropriate for the intended reader.

### WRITING-FUNCTIONAL-016 — Use grammar and mechanics that preserve meaning

**Level:** required

**Applies when:** Creating, editing, or reviewing functional writing in English.

Use grammatical structures and sentence mechanics that preserve the intended actors, actions, conditions, sequence, and scope. Check subject–verb and pronoun agreement; clear pronoun reference; verb form and tense; articles and prepositions; sentence boundaries; modifier placement; word order; possessives; spelling; capitalization; and meaning-bearing punctuation. Correct an error when it makes the sentence invalid, ambiguous, or materially harder for the intended reader to interpret.

Use this matrix to review meaning-bearing grammar:

| Area | Inspect | Common symptom |
|---|---|---|
| Agreement and reference | Subject–verb agreement; pronoun number, case, and antecedent | The reader cannot tell who or what acted, or a singular and plural form conflict. |
| Time and verb form | Tense, aspect, participles, auxiliaries, and sequence of events | The text places an event at the wrong time or leaves completion and continuation unclear. |
| Modality and obligation | `must`, `must not`, `can`, `cannot`, `may`, `might`, `should`, and negation scope | Permission sounds like obligation, advice sounds mandatory, or a prohibition has two readings. |
| Nouns and quantity | Articles, determiners, countability, possessives, demonstratives, and quantifiers such as `each`, `every`, `few`, `less`, `fewer`, `much`, and `many` | The population, ownership, or amount is grammatically inconsistent or materially ambiguous. |
| Conditions and clauses | Conditionals, exceptions, relative clauses, coordination, and clause attachment | A condition appears to govern the wrong action, or it is unclear which noun a clause modifies. |
| Comparison and parallelism | Comparison basis, paired constructions, and parallel list or clause structure | The sentence compares unlike things or makes equivalent choices look unequal. |
| Modifiers and word order | Modifier placement, adverb position, and natural order of complements | A modifier appears to describe the wrong actor, action, amount, or time. |
| Usage and collocation | Prepositions, phrasal verbs, conventional word combinations, and register | The wording is grammatical in isolation but means something different or sounds inappropriate for the intended context. |
| Mechanics | Sentence boundaries, possessives, spelling, capitalization, spacing, and meaning-bearing punctuation | A run-on, fragment, apostrophe, comma, or letter case changes the grouping or interpretation. |

Treat grammar-checker output as candidate findings, not proof. Review each result in context, protect exact quotations, interface labels, code, names, and accepted language variation, and compare every correction with the source meaning and factual claims. For reproducible tool-assisted review, record the checker, version, configuration, language variety, ignored regions, and unresolved findings.

For a disputed or unfamiliar English usage point, consult a named grammar or usage reference and record the exact entry or topic. Oxford's *Practical English Usage* is a useful reference because it covers grammar, vocabulary problems, formality, slang, standard English, and dialects through problem-focused explanations and examples. Oxford's learner-grammar contents also provide topic routes for tense and aspect, possessives, demonstratives, and quantifiers. These sources are descriptive references, not a universal product house style. Apply the intended audience's language variety and the artifact's adopted convention. When current authoritative references disagree materially, preserve the conflict under `FND-EVIDENCE-006` instead of declaring one variety universally correct.

**Why:** A sentence can use concise words and still misstate who acted, when an action occurred, which condition applies, or what a pronoun refers to. Grammar tools can expose these defects, but their style and regional-preference findings do not establish incorrect grammar.

**Verify:**

- Inspect every applicable matrix row, including modality, quantity, conditions, comparison, and clause attachment in addition to sentence boundaries and word forms.
- For bounded and extended artifacts, run a configured or proportionate English grammar checker when one is available, and adjudicate its findings in context. Treat this tool output as supporting evidence rather than a universal completion gate. When the tool check is applicable but omitted or unavailable, report it as `not run` or `not available` instead of claiming it passed.
- Compare each accepted correction with the source to confirm that it preserves facts, requirements, qualifications, names, literal values, and intended emphasis.
- For a disputed usage decision, record the reference, entry or topic, language variety, context, and reason for the selected form.
- Keep Harper's `Enhancement`, `Readability`, `Regionalism`, and `Style` categories advisory under `WRITING-FUNCTIONAL-015`; do not treat them as grammar failures without an independent applicable rule.

**Exceptions:** Headings, buttons, labels, table cells, commit subjects, conversational messages, and other constrained forms can use intentional fragments when their meaning remains clear in context. Preserve an exact quotation, interface label, code sample, proper name, or accepted dialect form unless the task authorizes changing it.

## Guidance

Use about 20 words as a review trigger for an instruction and about 25 words for a descriptive sentence. These are diagnostic thresholds, not correctness tests. A six-sentence paragraph and a noun phrase with more than three nouns also deserve review.

Prefer verbs over noun forms: “Install the package,” not “Perform the installation of the package.” Remove words that do not change meaning, including “simply,” “just,” “easily,” “basically,” “actually,” “very,” and “really.” Never describe a task as easy or obvious.

Write dates as `2026-08-12` or “August 12, 2026.” Avoid relative terms such as “currently,” “recently,” and “soon” when a version, state, or date would remain accurate longer. Use requirement words precisely: required behavior uses “must”; permission or capability uses “can”; uncertainty uses “might.”

Use sentence case for titles and headings, the serial comma, and simple contractions in conversational documentation and messages. Avoid contractions in formal specifications when they could weaken precision. Spell out zero through nine and use numerals for 10 and above unless an interface, specification, or domain convention differs.

## Examples

### Reader and purpose

Non-compliant: “This document explains the process.”

Compliant: “This guide helps support engineers restore a failed customer import without losing submitted records.”

### Accuracy over style

Non-compliant: “The migration is safe.”

Compliant: “The staging migration completed without data loss. Production lock behavior was not tested.”

### Consistent terms

Non-compliant: “Sign in to the console. If you cannot log in, reset your password.”

Compliant: “Sign in to the console. If you cannot sign in, reset your password.”

### Executable instruction

Non-compliant: “Please make sure permissions are configured correctly and try importing again.”

Compliant: “To import contacts, allow contact access in **Settings**. Then try the import again.”

### Outcome before detail

Non-compliant: “After reviewing the logs, deployment history, and alert timeline, we decided to roll back.”

Compliant: “Roll back the release. The logs, deployment history, and alert timeline show that errors began with version 4.2.”

### Direct sentence

Non-compliant: “The completion of the configuration of access permissions should be performed prior to import initiation.”

Compliant: “Configure access permissions before you start the import.”

### Change summary

Non-compliant: “Added rate limiting to login.”

Compliant: “Add rate limits to sign-in attempts”

### Final-context review

Non-compliant: “The Markdown source passed review, so the published page is correct.”

Compliant: “The Markdown source passed its link check. The published page was not available for rendered review.”

### Grammar and meaning

Non-compliant: “The deployment logs shows the workers was stopped after the alert.”

Compliant: “The deployment logs show that the workers were stopped after the alert.”

### Modality and prohibition

Non-compliant: “Users may not export these records.”

Compliant when export is prohibited: “Users must not export these records.”

### Modifier attachment

Non-compliant: “After deleting the account, the confirmation email was sent.”

Compliant: “After the administrator deleted the account, the system sent the confirmation email.”

### Tool-assisted style review

Non-compliant: “Harper flagged the contraction, so the sentence fails the writing standard.”

Compliant: “Harper flagged ‘don’t’ as a style preference. The repository permits conversational contractions, and the sentence remains clear, so no change is proposed.”

## Sources

- ASD Simplified Technical English Maintenance Group, [ASD-STE100 Simplified Technical English](https://asd-ste100.org/), Issue 9, January 15, 2025. Reviewed August 12, 2026.
- Google, [Google developer documentation style guide](https://developers.google.com/style). Reviewed August 12, 2026.
- Tim Pope, [A Note About Git Commit Messages](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html), April 19, 2008. Reviewed August 12, 2026.
- Chris Beams, [How to Write a Git Commit Message](https://cbea.ms/git-commit/). Reviewed August 12, 2026.
- U.S. General Services Administration, [Plain language guide series](https://digital.gov/guides/plain-language). Reviewed August 13, 2026.
- World Wide Web Consortium, [Use Clear and Understandable Content](https://www.w3.org/WAI/WCAG2/supplemental/objectives/o3-clear-content/), WAI cognitive accessibility guidance. Reviewed August 13, 2026.
- World Wide Web Consortium, [Writing for Web Accessibility](https://www.w3.org/WAI/tips/writing/). Reviewed August 13, 2026.
- OpenAI, [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md). Reviewed August 13, 2026.
- Cognition, [Creating Playbooks](https://docs.devin.ai/product-guides/creating-playbooks). Reviewed August 13, 2026.
- Simon Willison, [LLM cliché highlighter](https://tools.simonwillison.net/llm-cliche-highlighter), pattern catalog. Reviewed August 28, 2026.
- Automattic, [Harper lint kinds](https://github.com/Automattic/harper/blob/43745e24a6af0222d21ccd6fe1cc00570fe5e33c/harper-core/src/linting/lint_kind.rs), commit `43745e24a6af0222d21ccd6fe1cc00570fe5e33c`. Reviewed September 2, 2026.
- Automattic, [Harper default configuration](https://github.com/Automattic/harper/blob/43745e24a6af0222d21ccd6fe1cc00570fe5e33c/harper-core/default_config.json), commit `43745e24a6af0222d21ccd6fe1cc00570fe5e33c`. Reviewed September 2, 2026.
- Oxford University Press, [About *Practical English Usage*](https://www.oxfordlearnersdictionaries.com/us/about/practical-english-usage/introduction.html), grammar, usage, register, and dialect reference scope. Reviewed September 2, 2026.
- Oxford University Press, [*Learn & Practise Grammar*: contents](https://www.oxfordlearnersdictionaries.com/us/grammar/online-grammar/table-of-contents), tense, aspect, possessive, demonstrative, and quantifier topic index. Reviewed September 2, 2026.
