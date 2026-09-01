---
type: Review Record
title: SEO and Marketing Skills coverage review
description: Bounded review of Raintree search and marketing routes against Corey Haines's Marketing Skills inventory.
tags: [marketing, seo, review, coverage, sources]
generated: { by: codex/gpt-5, at: "2026-09-01T12:55:52-07:00" }
---

# SEO and Marketing Skills coverage review

## Outcome

The reviewed Raintree routes cover all 50 tasks in Marketing Skills version 2.11.0 after adding the missing `events` route and pinning the comparison to upstream commit `e55de886fe7580ec75cdb7ded5092b33f7d4ed58`. The SEO routes cover the operational concerns in the upstream `seo-audit`, `programmatic-seo`, `schema`, and `site-architecture` skills through `SEO-FOUNDATIONS`, `PROFILE-PUBLIC-WEB-PAGE`, `WEB-QUALITY`, `DATA-QUALITY`, and `PLAYBOOK-GSC`.

This review does not make Marketing Skills normative. It does not establish that AI-search optimization techniques affect citation or ranking. Current primary platform evidence remains required under `FND-EVIDENCE-002`.

## Audit record

| Field | Value |
|---|---|
| Audit subject | `marketing/coverage.md`, `seo/foundations.md`, `profiles/public-web-page.md`, `profiles/marketing-lifecycle.md`, and `profiles/specialist-marketing.md` |
| Purpose and decision | Decide whether the library routes the current Marketing Skills inventory and whether the SEO routes omit a recurring task or material control |
| Intended audience | Standards, marketing, SEO, content, and engineering owners |
| Accountable owner | Standards and SEO owners |
| Auditor | `codex/gpt-5`; author review only |
| System boundary | Repository documents and public upstream source files; no live site, Search Console property, analytics property, or search-result testing |
| Version | Current working tree on `codex/interface-quality-standards`; upstream commit `e55de886fe7580ec75cdb7ded5092b33f7d4ed58` |
| Evidence cutoff | September 1, 2026 |

## Source classification

- **Proposed discovery format:** Jeremy Howard, [The `llms.txt` file proposal](https://llmstxt.org/), version 2. The proposal defines the file format, path scoping, Markdown page alternatives, and `alternate` and `describedby` discovery links. It is not a ratified web standard, access-control mechanism, or ranking signal.
- **Informative taxonomy:** Corey Haines and contributors, [Marketing Skills for AI Agents](https://github.com/coreyhaines31/marketingskills/tree/e55de886fe7580ec75cdb7ded5092b33f7d4ed58), version 2.11.0, MIT License.
- **Informative SEO procedures:** [`seo-audit`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/seo-audit/SKILL.md), [`ai-seo`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/ai-seo/SKILL.md), [`programmatic-seo`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/programmatic-seo/SKILL.md), [`schema`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/schema/SKILL.md), and [`site-architecture`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/site-architecture/SKILL.md).
- **Normative external behavior:** The primary Google, Microsoft, IETF, W3C, schema.org, and provider-specific crawler sources cited by the governed Raintree standards. Google states that `llms.txt` does not affect Google Search visibility or ranking. Provider crawler semantics apply only to the named provider and require revalidation. Marketing Skills does not replace them.

## Findings

| Finding | Observation | Resolution | State |
|---|---|---|---|
| Inventory drift | Upstream contains 50 skill directories. The local map contained 49 and omitted `events`. | Added `events` with specialist, public-engagement, distribution, media, privacy, and public-web routing conditions. | Resolved |
| Broad SEO attribution | The coverage map cited only the upstream repository root, so a reviewer could not reproduce the exact SEO comparison after upstream changes. | Pinned the source revision and linked each SEO-specific row to its skill file. | Resolved |
| Technical SEO routing | Upstream audit topics include crawlability, indexation, status, canonicalization, rendering, mobile behavior, performance, HTTPS, localized variants, structured data, internal links, content quality, and measurement. | Existing routes cover these concerns across `SEO-FOUNDATIONS`, `WEB-QUALITY`, `FND-ACCESSIBILITY`, `FND-TRUST`, `FND-EVIDENCE`, and `PLAYBOOK-GSC`. | No change required |
| Programmatic SEO safeguards | Upstream emphasizes distinct value, source data, index controls, internal discovery, and post-launch monitoring. | `SEO-FOUNDATIONS-001`, `SEO-FOUNDATIONS-007`, `SEO-FOUNDATIONS-009` through `SEO-FOUNDATIONS-011`, `DATA-QUALITY`, and `PROFILE-PUBLIC-WEB-PAGE` cover the recurring risks with stronger evidence requirements. | No change required |
| Structured-data verification | Upstream warns that static fetches can miss client-injected JSON-LD and requires rendered validation. | `SEO-FOUNDATIONS-005`, `SEO-FOUNDATIONS-006`, and the public-web completion evidence require delivered and rendered inspection. | No change required |
| `llms.txt` and Markdown pages | The version 2 proposal defines scoped `llms.txt` files, explicit Markdown alternatives, and `alternate` and `describedby` links. It recommends concise route files rather than one unbounded full-corpus prompt. | `SEO-FOUNDATIONS-014` requires an explicit route inventory. `SEO-FOUNDATIONS-015` requires an advertised Markdown representation for every public informational page and adds HTTP negotiation, cache, parity, locale, version, and exclusion evidence. | Incorporated and strengthened |
| Marketing Skills procedure | `seo-audit` contributes audit ordering and rendered-schema detection; `ai-seo` contributes agent-readable routes, JavaScript boundaries, and the distinction between Google and other tools; `schema` contributes visible-content parity and validation workflow. | Cite the pinned skill files as informative procedures. Keep Google, IETF, Schema.org, and other primary sources authoritative. | Incorporated as informative sources |
| Unsupported optimization claims | The `ai-seo` skill includes quantitative citation, visibility, freshness, and platform-behavior claims that are not established by the three linked skill files alone. | Do not import those values or convert them into Raintree thresholds. Require current primary evidence under `FND-EVIDENCE-002`. | Excluded |
| Raintree decision purpose | A generic route list can help an agent fetch files while still allowing it to skip profile dependencies, confuse draft and active material, or treat a third-party skill as policy. | `llms.txt` now teaches the task-to-profile-to-dependency-to-rule flow before listing files. `SEO-FOUNDATIONS-017` preserves governance semantics in every machine representation. | Resolved |
| Retrieval versus application | File reachability and schema validity do not prove that an agent selects and applies the correct standards. | `SEO-FOUNDATIONS-018` requires end-to-end positive, negative, ambiguous, stale, conflicting, and out-of-scope tasks with repeated evaluation where outputs vary. | Resolved |
| Crawler-purpose conflation | Search discovery, user-request retrieval, training, previews, and automated interaction can use different provider clients and controls. | `SEO-FOUNDATIONS-019` requires provider-specific purpose classification, delivery-boundary exercises, current sources, and scheduled revalidation. | Resolved |
| AI-search measurement | Upstream proposes AI-answer citation checks and discusses optional machine-readable files. Search platforms and evidence remain volatile, and no authoritative cross-platform measurement contract exists in this library. | Keep `ai-seo` routed through `SEO-FOUNDATIONS` and `FND-EVIDENCE`. Require current primary evidence and label platform-specific procedures as informative. | Limitation recorded |

## Scoped conclusion

**Overall result: conforming after correction.** The bounded task inventory is fully routed at the pinned upstream revision, and the SEO-specific concerns have governed Raintree routes. This result applies only to document coverage. It does not certify a website, validate live search performance, or independently approve the standards.

## Handoff and review

- Independent review: Not performed. The author and reviewer are the same agent.
- Qualified review: SEO, marketing, legal, privacy, accessibility, and platform-owner review remains required where the active standards call for it.
- Retest: Compare the 50 upstream skill directories with the 50 rows in `marketing/coverage.md`, then run the repository checks in `CONTRIBUTING.md`.
