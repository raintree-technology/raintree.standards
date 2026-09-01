---
type: Review Record
title: Standards robustness review — full rule-bearing corpus
description: Document-by-document structural, evidence, routing, and maturity review of every Raintree foundation and standard on September 1, 2026.
tags: [governance, standards, audit, robustness, coverage]
generated: { by: codex/gpt-5, at: "2026-09-01T13:07:41-07:00" }
---

# Standards robustness review — full rule-bearing corpus

## Outcome

All 40 rule-bearing foundations and standards now have extensive operational coverage, but the corpus is not release-ready. The 515 rules retain stable IDs, applicability, rationale, verification, and exceptions. The 23 standards below the extensive band in the initial pass now add domain-specific route tables, boundary and failure scenarios, required evidence, and escalation or ownership boundaries. A later engineering-publications review added seven requirements for evaluation validity, production change coverage, developer workflow evidence, overload, isolation, migration phases, and agent production learning. The dominant remaining weakness is maturity: 29 documents remain draft, none of the 40 records independent `verified` provenance, and high-impact legal, privacy, security, accessibility, financial, marketing, and platform material still needs qualified review.

This review supports prioritization of standards work. It does not certify the library, validate a deployed system, or substitute document size for correctness.

## Audit record

| Field | Value |
|---|---|
| Audit subject | Every cataloged foundation and standard in the current working tree |
| Purpose and decision | Identify standards with robust operational coverage and standards that need more evidence, examples, scoping, routing, or review |
| Intended audience | Standards owners and qualified domain reviewers |
| Accountable owner | Standards owners named in each document |
| Auditor | `codex/gpt-5`; author review only |
| Included | 4 foundations and 36 standards; front matter, 515 rules, 355 declared sources, guidance, examples, operational route tables, dependencies, source register, profiles, and validators |
| Excluded | Live-system conformance, legal conclusions, provider control planes, source-by-source factual revalidation beyond the current task, and independent or qualified approval |
| Version | Working tree on `codex/interface-quality-standards` at the September 1, 2026 evidence cutoff |
| Environment | Repository inspection |
| Evidence cutoff | September 1, 2026 |

## Rating method

The coverage band describes how much operational material exists. It does not describe approval or correctness.

| Band | Meaning |
|---|---|
| **Extensive** | Complete treatment relative to the declared scope: substantial source or explicit internal-policy basis, complete rule anatomy, domain-specific routes, normal and failure scenarios, required evidence, examples, ownership boundaries, and cross-cutting dependencies. Narrow scope does not prevent this band. The main remaining work is independent review, qualified approval, calibration, or source freshness. |
| **Strong** | Complete and actionable core coverage with adequate sources and examples, but one or more material operational routes or evidence classes remain implicit. |
| **Focused** | A coherent narrow standard with complete rule anatomy that still lacks extensive scenario or evidence treatment within its declared scope. |
| **Reinforce** | The structure is complete, but direct source support, examples, evaluation evidence, or ownership boundaries are too indirect for the breadth of the claims. |

### Extensive acceptance test

A document reaches the extensive band only when the review can answer all of these questions from the document and its declared dependencies:

- What exact decisions and surfaces are in scope, and which are outside it?
- Which rules apply, at what level, under what condition, and with what exception boundary?
- Which normal, boundary, failure, recovery, and retirement routes must a reviewer exercise?
- What direct evidence supports each route, and what inference remains limited?
- Who owns the decision, escalation, qualified review, and final state?
- Which authoritative or explicitly internal sources support the requirements, and when must volatile sources be revalidated?
- Can a representative reader follow an example or route without inventing missing policy?

Document length and rule count do not satisfy this test by themselves. Independent verification and governance status remain separate from the coverage band.

The matrix uses exact document status separately from the band. Every document lacks independent `verified` provenance, including documents marked `stable` and `active`.

## Complete standards matrix

| Standard | Status | Rules / sources | Band | What is robust | Main gap or next review |
|---|---:|---:|---|---|---|
| `FND-ACCESSIBILITY` | draft | 7 / 4 | Extensive | Covers target selection, equivalent operation, focus, semantics, adaptable presentation, errors, testing with people and assistive technology, and separate web, native, document, media, and consequential-flow evidence routes. | Needs qualified accessibility review and evidence that the declared targets remain current. |
| `FND-EVIDENCE` | active | 11 / 6 | Extensive | Distinguishes observation from inference; covers descriptive, causal, qualitative, mixed, expert, and automated records; and validates the full harness against deployment. | Needs independent methodological review and representative execution records. |
| `FND-TRUST` | active | 9 / 6 | Extensive | Covers consequences, choice, fabricated proof, guardrails, defaults, exit, commercial disclosure, automated judgment, delegated action, vulnerable contexts, and full-path trust evidence. | Needs representative user testing and qualified review where consumer-protection or vulnerable-user duties apply. |
| `FND-CHANGE` | active | 10 / 4 | Extensive | Covers failure boundaries, recovery, blast radius, observability, stop conditions, rehearsal, authorization, closure, autonomous change, and portfolio control across every effective production change path. | Broad operational claims still need independent calibration against representative changes. |
| `API-CONTRACTS` | draft | 32 / 29 | Extensive | The deepest contract surface in the library: protocol semantics, errors, pagination, idempotency, compatibility, authorization, caching, async work, events, concurrency, bulk behavior, cancellation, and SDKs. | Breadth creates discoverability and overlap risk. Consider substandards or a rule map, then obtain platform and security review. |
| `AI-AGENTS` | draft | 21 / 17 | Extensive | Covers architecture, tasks, prompts, context, tools, authority, containment, privacy, recovery, versioning, evaluation, red teaming, observability, parallelism, reusable instructions, and the production detection-to-regression loop. | Needs current model/provider threat revalidation, measured eval examples, and qualified AI, security, and privacy approval. |
| `DATA-DATABASE` | active | 13 / 5 | Extensive | Covers invariants, compatibility, locks, plans, recovery, growth, backfills, ownership, concurrency, privilege, operational routes, and independently safe observable migration phases. | Needs engine-owner calibration and representative rollback evidence without making one engine normative. |
| `DATA-QUALITY` | draft | 8 / 3 | Extensive | Covers meaning, ownership, lineage, expectations, reconciliation, correction, incidents, and explicit batch, streaming, sampled, semantic-layer, model-data, and external-data routes. | Needs representative warehouse, stream, and probabilistic-quality execution records. |
| `DATA-REDIS` | draft | 13 / 16 | Extensive | Strong workload classification, memory and key bounds, expiry, connections, command work, security, persistence, restoration, observability, refill, messaging, and leases. | Product-specific and volatile. Needs live failure exercises and independent Redis and operations review before activation. |
| `ENGINEERING-QUALITY` | draft | 9 / 4 | Extensive | Provides a compact backbone plus routes for refactors, compatibility, builds, dependencies, performance, high-impact review, removal, and developer-friction decisions tied to quality outcomes. | Remains a routing backbone; domain standards must supply specialized checks and qualified review. |
| `ENGINEERING-TESTING` | draft | 25 / 15 | Extensive | Covers test claims, layers, determinism, failures, contracts, data, flakiness, gates, fixtures, environments, size, ownership, selection, time, compatibility, fault injection, canaries, and lifecycle. | Large surface needs a faster navigation map and independent quality-engineering review. Validate examples against more non-web and distributed systems. |
| `ENGINEERING-CODE-REMOVAL` | draft | 10 / 16 | Extensive | Distinguishes candidates from proof and treats TypeScript and Python analyzers with explicit authority, exceptions, baselines, and canaries. | Tool-specific behavior is volatile and language coverage is narrow. Add routes for other ecosystems or state the intended boundary more prominently. |
| `ENGINEERING-JS-QUALITY` | draft | 23 / 22 | Extensive | Detailed organization-specific policy for Trellis, Biome, monorepos, formatting, fixes, editors, migration, typing, Oxlint, layered gates, and diagnostic ownership. | Strong but tightly coupled to internal tools. Needs portability boundaries, upgrade tests, and independent JavaScript/toolchain review. |
| `KNOWLEDGE-SYSTEMS` | draft | 14 / 4 | Extensive | Covers authority, provenance, authorization, ingestion, deletion, connectors, retrieval, grounding, evaluation, retirement, and explicit internal, RAG, sync, collaborative, memory, and workforce routes. | Needs measured end-to-end evaluations and qualified AI, data, privacy, and workforce review. |
| `ANALYTICS-MEASUREMENT` | active | 12 / 6 | Extensive | Decision-first measurement with event contracts, full-path validation, minimization, denominators, identity, versioning, quality, retention, cardinality, lineage, and sensitivity. | Needs independent analytics/privacy review and more examples for modeled data, attribution, offline reconciliation, and identity loss. |
| `GROWTH-EXPERIMENTS` | active | 12 / 4 | Extensive | Covers hypotheses, assignment, metrics, guardrails, stopping, records, sensitivity, integrity, heterogeneous harm, delivery, and individual, cluster, sequential, switchback, quasi-experimental, and high-impact routes. | Needs independent statistical and experimentation review plus executed non-individual designs. |
| `MARKETING-LIFECYCLE` | draft | 9 / 3 | Extensive | Connects positioning, research, claims, offers, permission, value, personalization, incrementality, learning, retirement, and six full-lifecycle decision routes. | Wide legal and commercial scope still needs qualified marketing, privacy, and legal review. |
| `MARKETING-PAID-MEDIA` | draft | 7 / 3 | Extensive | Covers campaign contract, disclosure, claims, targeting, spend, measurement, closure, and separate search, social, creator, retargeting, automated, and restricted-category routes. | Platform annexes and qualified legal/privacy review remain necessary because policies and law change quickly. |
| `MARKETING-DIRECT-OUTREACH` | draft | 7 / 3 | Extensive | Covers authority, provenance, identity, bounded contact, suppression, vendor control, measurement, and distinct email, call, SMS, platform-message, sales-sequence, and high-risk routes. | Each deployment still needs a current jurisdiction and channel decision plus qualified review. |
| `MARKETING-PUBLIC-ENGAGEMENT` | draft | 7 / 3 | Extensive | Covers public authority, disclosures, reviews, safety, participant protection, partnerships, corrections, and owned-account, community, creator, event, and crisis routes. | Needs platform-specific annexes and qualified communications and legal review. |
| `MARKETING-DISTRIBUTION` | draft | 7 / 3 | Extensive | Covers contracts, listings, lead exchange, incentives, contests, partner data, retirement, and detailed directory, referral, promotion, co-marketing, coupon, and feed routes. | Each program still needs a current jurisdiction and platform annex with qualified review. |
| `MARKETING-PROJECT-SHOWCASE` | draft | 9 / 3 | Extensive | Defines the internal contract, external source limits, canonical record, audience, action, lifecycle, claims, ecosystem, verification, document role, and six project and projection routes. | Independent comprehension and published-render accessibility approval remain open. |
| `SALES-REVENUE-OPERATIONS` | draft | 7 / 3 | Extensive | Covers claims, intelligence, states, routing, commitments, forecasts, access, and explicit qualification, discovery, proposal, forecasting, handoff, and automation routes. | Qualified sales, finance, privacy, fairness, and legal review remains necessary. |
| `DISCOVERY-APP-STORES` | draft | 7 / 4 | Extensive | Covers policy pinning, build-specific metadata, privacy, reviewability, localization, reviews, experiments, monitoring, and separate release, experiment, enforcement, and retirement routes. | Apple and Google evidence still needs continuous separate revalidation and store-owner review. |
| `MEDIA-PRODUCTION-RIGHTS` | draft | 7 / 4 | Extensive | Covers contracts, provenance, people, accessibility, edits, participant protection, distribution, retirement, and detailed original, licensed, community, synthetic, accessible, and retirement routes. | Asset- and territory-specific qualified rights and legal review remains necessary. |
| `OPERATIONS-RELIABILITY` | draft | 11 / 5 | Extensive | Covers objectives, observability, alerts, runbooks, incidents, recovery, learning, support, vendors, operational routes, overload stability, and critical-journey shared-fate isolation. | Needs independent operations review and representative live capacity and failure exercises. |
| `OPERATIONS-LOGGING` | draft | 14 / 17 | Extensive | Detailed Pino and OpenTelemetry-oriented event contracts, context, errors, redaction, levels, volume, delivery, lifecycle, browser logs, and audit-evidence separation. | Strong but implementation-specific. Add non-Node applicability boundaries and verify cost, backpressure, and failure behavior in live pipelines. |
| `PRODUCT-DELIVERY` | draft | 8 / 3 | Extensive | Covers problem evidence, outcomes, states, prioritization, assumptions, readiness, value, closure, and routes for discovery, portfolio choice, testing, release, adoption, and retirement. | Needs representative product records and independent product, operations, and commercial review. |
| `SEO-FOUNDATIONS` | active | 19 / 18 | Extensive | Covers classic technical SEO plus migrations, content value, localization, request-boundary crawler evidence, `llms.txt`, Markdown representations, governance semantics, agent-task evaluation, and crawler-purpose policy. | Newly expanded scope crosses SEO, knowledge, HTTP, and agent evaluation. Required Markdown for every public informational page is operationally demanding and unsupported as a Google ranking control; obtain independent review and consider splitting agent discoverability from search foundations. |
| `WEB-QUALITY` | active | 18 / 9 | Extensive | Covers document semantics, accessibility, performance, resilience, third parties, security, privacy, localization, machine readiness, environments, motion, consequential errors, and permissions. | Broad umbrella with overlap across accessibility, SEO, security, and content. Needs browser/device evidence matrices and independent accessibility/security review. |
| `DESIGN-INTERACTION` | draft | 22 / 19 | Extensive | Covers full flows, hierarchy, controls, forms, adaptation, status, errors, systems, product context, content, visual coherence, anti-slop, motion, ideation, prototypes, typography, simplicity, fidelity, and agent-design evaluation. | Very broad and recently expanded. Needs decomposition or a route map, independent design/accessibility review, and representative product trials. |
| `AGENT-VERIFICATION` | active | 11 / 7 | Extensive | Covers risk-scaled checks, final inspection, user work, uncertainty, handoff, cleanup, review, planning, trajectories, corrections, and explicit code, research, document, external-action, long-running, and failed-verification records. | Needs independent review and representative execution records across non-code and long-running work. |
| `CONTENT-ERRORS` | active | 13 / 7 | Extensive | Covers next actions, severity, tone, security, work preservation, accessibility, localization, protocol parity, triggers, review, API problems, consequential submissions, and agent failures. | Strong content coverage; needs comprehension testing across languages, assistive technologies, and high-stress operational contexts. |
| `CONTENT-INTERFACE` | draft | 8 / 3 | Extensive | Covers labels, explanation, states, confirmations, inclusion, terminology, localization, rendering, and explicit compact, consequential, conversational, expert, generated, and multilingual routes. | Needs measured comprehension and qualified review in complex or regulated domains. |
| `WRITING-FUNCTIONAL` | active | 15 / 10 | Extensive | Covers reader, accuracy, terminology, outcome-first structure, direct prose, procedures, semantic structure, accessibility, summaries, final review, localization, quantitative content, comprehension, agent instructions, and AI-writing patterns. | Needs independent reader testing and clearer separation between universal functional rules and style-dependent recommendations. |
| `PRIVACY-DATA` | draft | 16 / 6 | Extensive | Covers processing maps, authority, minimization, purpose, notices, consent, rights, deletion, accuracy, pseudonymity, heightened harm, recipients, risk review, development data, released behavior, and model data. | High-impact and jurisdiction-sensitive with only six source sets. Requires qualified privacy/legal review and territory-specific decision routes. |
| `SECURITY-APPLICATION` | draft | 19 / 8 | Extensive | Covers trust boundaries, authorization, authentication, sessions, input, files, outbound requests, secrets, cryptography, configuration, supply chain, abuse, detection, administration, integrated verification, response, prompt injection, execution, and agent approval. | Needs threat-model and abuse-case evidence, platform-specific routes, and qualified security review. Broad scope may justify decomposition. |
| `SECURITY-SECRETS` | draft | 11 / 25 | Extensive | Deep Infisical-specific coverage of hierarchy, human and machine authority, delivery, rotation, exposure, availability, migration, control plane, and resolution precedence. | Robust only for the mandated Infisical model. Needs business-continuity evidence, vendor-exit analysis, and qualified security/operations review. |
| `INTEGRATIONS-VENDOR` | draft | 14 / 3 | Extensive | Combines a direct cross-provider source basis with contract, freshness, authority, callback, retry, release, telemetry, reconciliation, drift, cost, failure, exit, six operational routes, and a complete vendor-neutral callback record. | Needs qualified engineering, security, privacy, operations, and provider-specific review. |
| `LEGAL-PUBLISHED-TERMS` | draft | 20 / 25 | Extensive | Deep coverage of scope, coherent document sets, operational truth, decision-point disclosure, assent, evidence, versioning, changes, privacy notices, AI commitments, accessibility, electronic records, recurring offers, tracking, age, enforcement, transfer, and shutdown. | Content is high-impact and jurisdiction-sensitive. No qualified legal verification exists; the document must remain advisory until lawyers approve exact territorial scope and current law. |

## Portfolio findings

### What is working

- All 515 rules have the required ID, level, applicability, rationale, verification, and exception structure.
- The corpus consistently routes evidence, trust, safe change, privacy, security, accessibility, and verification through dependencies.
- The strongest documents describe failure, rollback, stale state, conflicting evidence, authority, and final-state checks rather than only happy paths.
- Source freshness is registered centrally, and volatile provider material is generally routed to named playbooks and manifests.
- The library has meaningful depth in API contracts, testing, JavaScript quality, AI agents, design, web, SEO, logging, security, legal publication, and secrets management.

### What needs attention

1. **Independent review is the largest universal gap.** None of the 40 rule-bearing documents records `verified` provenance. Structural validity must not be represented as approval.
2. **Draft volume is high.** Twenty-nine documents are draft. Several stable documents have broad or recently changed content and still need independent review before release.
3. **Direct-source gaps are closed.** `MARKETING-PROJECT-SHOWCASE` now distinguishes its internal policy from supporting documentation and accessibility sources. `INTEGRATIONS-VENDOR` now declares a cross-provider control basis while keeping volatile provider facts in playbooks.
4. **Some broad standards are hard to navigate.** `API-CONTRACTS`, `ENGINEERING-TESTING`, `ENGINEERING-JS-QUALITY`, `DESIGN-INTERACTION`, `SEO-FOUNDATIONS`, `SECURITY-APPLICATION`, and `LEGAL-PUBLISHED-TERMS` would benefit from rule maps or carefully scoped substandards.
5. **Marketing and commercial extensions now have extensive routes but remain review-sensitive.** Their channel, jurisdiction, moderation, platform, financial, and failure routes are explicit. Current qualified legal, privacy, finance, communications, and platform review remains necessary.
6. **Vendor-specific standards are deep but narrow.** Redis, Pino, Trellis/Biome/Oxlint, Infisical, app stores, and provider bundles require freshness checks, exit paths, and domain-owner review.
7. **Sixteen documents reach their next source-review date by November 2026.** Owners should schedule revalidation now rather than wait for staleness.

## Non-rule routing layer

The catalog also contains 34 profiles, playbooks, and patterns. They are not included in the 40-row rule matrix because they do not define rule-level obligations.

| Layer | Count | Current state | Robustness observation |
|---|---:|---|---|
| Profiles | 20 | 4 active, 16 draft | Dependency parity and completion-evidence structure validate. Draft volume and missing independent route walkthroughs are the primary gaps. |
| Playbooks | 11 | 11 draft | Provider playbooks have rich manifest-backed bundles. General audit and testing playbooks need representative execution records and independent review. |
| Patterns | 3 | 3 draft | The patterns have useful architecture and scenarios but need adoption evidence and clearer selection criteria. |

## Evidence register

| Evidence ID | Source and method | Scope | Result | Limit |
|---|---|---|---|---|
| `E-ROBUST-001` | `catalog.yaml` plus YAML and Markdown parsing | 74 governed documents | Identified 40 rule-bearing documents and 34 routing/procedural documents | Structural inspection only |
| `E-ROBUST-002` | Rule-section extraction | 515 rules | Every rule has level, applicability, rationale, verification, and exceptions | Does not prove domain correctness |
| `E-ROBUST-003` | Front-matter source extraction | 355 declared sources | Every rule-bearing standard has a direct source set or explicit internal-policy basis with supporting sources | Source count does not measure authority by itself |
| `E-ROBUST-007` | Operational-route inspection after reinforcement | 23 formerly sub-extensive standards | Added 134 domain-specific routes plus one complete vendor-neutral evidence record; all 40 standards satisfy the extensive acceptance test | Author review does not establish independent correctness or operational feasibility |
| `E-ROBUST-008` | First-party engineering-publication comparison | 11 publishers and six confirmed gap families | Added seven requirements for harness validity, change-path coverage, developer workflow evidence, overload, isolation, migration phases, and agent production learning | Publisher case studies have selection and context limits; qualified review remains open |
| `E-ROBUST-004` | Lifecycle metadata extraction | 40 rule-bearing documents | 29 draft, 11 active; zero records with independent `verified` provenance | Does not inspect unpublished review records |
| `E-ROBUST-005` | Source-register date comparison | Current repository date | 16 documents have review dates by November 2026 | Future source changes remain possible |
| `E-ROBUST-006` | Repository validation suite | Final working tree | Structural, integration, testing-reference, workflow, library, and README/`llms.txt` checks | Automated checks cannot provide qualified approval |

## Scoped conclusion

**Overall result: indeterminate for release maturity.** The corpus is structurally complete and materially deep, with no mechanical rule-shape failure found. Release readiness remains indeterminate because every rule-bearing document lacks independent verification, most documents remain draft, and high-impact domains need qualified approval. The matrix should guide review order, not be converted into a certification or aggregate quality score.

## Recommended review order

1. Review foundations and cross-cutting gates: `FND-EVIDENCE`, `FND-TRUST`, `FND-CHANGE`, `FND-ACCESSIBILITY`, and `AGENT-VERIFICATION`.
2. Review high-impact controls: `SECURITY-APPLICATION`, `PRIVACY-DATA`, `LEGAL-PUBLISHED-TERMS`, `AI-AGENTS`, and `SECURITY-SECRETS`.
3. Review broad delivery standards: `API-CONTRACTS`, `ENGINEERING-TESTING`, `WEB-QUALITY`, `SEO-FOUNDATIONS`, and `DESIGN-INTERACTION`.
4. Independently review the new operational routes and direct-source boundaries in `MARKETING-PROJECT-SHOWCASE` and `INTEGRATIONS-VENDOR`.
5. Review focused commercial and platform extensions with qualified owners and current jurisdiction or platform evidence.
6. Execute representative profile and playbook walkthroughs, then bind independent verification to the exact final revision.

## Handoff and review

- Independent review: Not performed. The author and reviewer are the same agent.
- Qualified domain review: Not performed.
- Exceptions: None approved or implied.
- Unfinished work: Source-by-source factual revalidation, representative user and agent trials, provider exercises, and qualified approvals remain.
