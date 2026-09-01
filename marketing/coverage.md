---
type: Reference
title: Marketing Skills coverage map
description: Maps the Marketing Skills task inventory to the bounded Raintree v1 corpus and governed post-v1 extension drafts.
tags: [marketing, coverage, skills, v1]
generated: { by: codex/gpt-5, at: "2026-09-01T12:10:24-07:00" }
sources:
  - id: marketing-skills
    resource: https://github.com/coreyhaines31/marketingskills/tree/e55de886fe7580ec75cdb7ded5092b33f7d4ed58
    title: Marketing Skills for AI Agents
    author: human:corey-haines
---

# Marketing Skills coverage map

This map uses the MIT-licensed Marketing Skills repository as a task inventory. It does not make that repository normative. Binding rules require Raintree review and primary support for external factual claims.

## V1 mapping

| Marketing skill | V1 route or disposition |
|---|---|
| `ab-testing` | `PROFILE-GROWTH-EXPERIMENT` |
| `ad-creative` | `MARKETING-PAID-MEDIA`, `MEDIA-PRODUCTION-RIGHTS` |
| `ads` | `MARKETING-PAID-MEDIA` plus current platform policies |
| [`ai-seo`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/ai-seo/SKILL.md) | `SEO-FOUNDATIONS`, `FND-EVIDENCE`; volatile claims require current primary evidence |
| `analytics` | `ANALYTICS-MEASUREMENT`; `PLAYBOOK-GA4` when applicable |
| `aso` | `DISCOVERY-APP-STORES` |
| `attribution` | `ANALYTICS-MEASUREMENT`, `FND-EVIDENCE`, `MARKETING-LIFECYCLE-008` |
| `churn-prevention` | `MARKETING-LIFECYCLE`, `FND-TRUST`, `PROFILE-UI-FEATURE` |
| `co-marketing` | `MARKETING-PUBLIC-ENGAGEMENT` |
| `cold-email` | `MARKETING-DIRECT-OUTREACH` |
| `community-marketing` | `MARKETING-PUBLIC-ENGAGEMENT` |
| `competitor-profiling` | `SALES-REVENUE-OPERATIONS`, `FND-EVIDENCE` |
| `competitors` | `MARKETING-LIFECYCLE`, `FND-EVIDENCE`, `PROFILE-PUBLIC-WEB-PAGE` |
| `content-strategy` | `MARKETING-LIFECYCLE`, `PROFILE-FUNCTIONAL-WRITING`, `SEO-FOUNDATIONS` |
| `copy-editing` | `PROFILE-FUNCTIONAL-WRITING`, `MARKETING-LIFECYCLE` |
| `copywriting` | `PROFILE-FUNCTIONAL-WRITING`, `MARKETING-LIFECYCLE`, `FND-TRUST` |
| `cro` | `MARKETING-LIFECYCLE`, `PROFILE-UI-FEATURE`, `PROFILE-GROWTH-EXPERIMENT` |
| `customer-research` | `MARKETING-LIFECYCLE-002`, `FND-EVIDENCE`, `PRIVACY-DATA` |
| `directory-submissions` | `MARKETING-DISTRIBUTION` |
| `emails` | Core lifecycle route through `PROFILE-MARKETING-LIFECYCLE`; channel law and policy remain conditional |
| `events` | `PROFILE-SPECIALIST-MARKETING`, `MARKETING-PUBLIC-ENGAGEMENT`, `MARKETING-DISTRIBUTION`; activate `MEDIA-PRODUCTION-RIGHTS`, `PRIVACY-DATA`, and `PROFILE-PUBLIC-WEB-PAGE` when their conditions apply |
| `free-tools` | `PROFILE-PRODUCT-FEATURE`, `PROFILE-PUBLIC-WEB-PAGE`, `MARKETING-LIFECYCLE` |
| `image` | `MEDIA-PRODUCTION-RIGHTS` |
| `influencer-marketing` | `MARKETING-PUBLIC-ENGAGEMENT`, `MEDIA-PRODUCTION-RIGHTS` when media is produced |
| `launch` | `PRODUCT-DELIVERY`, `MARKETING-LIFECYCLE`, `PROFILE-PUBLIC-WEB-PAGE` |
| `lead-magnets` | `MARKETING-DISTRIBUTION`, `MARKETING-LIFECYCLE` |
| `marketing-council` | `FND-EVIDENCE`; simulated perspectives cannot be represented as real expert review |
| `marketing-ideas` | Discovery input only; selected work routes through `PROFILE-MARKETING-LIFECYCLE` |
| `marketing-loops` | `PROFILE-SPECIALIST-MARKETING`, `PROFILE-AGENTIC-SYSTEM` when automated |
| `marketing-plan` | `MARKETING-LIFECYCLE`, `PRODUCT-DELIVERY`, `FND-EVIDENCE` |
| `marketing-psychology` | `FND-TRUST`, `MARKETING-LIFECYCLE`; manipulative practices remain prohibited |
| `offers` | `MARKETING-LIFECYCLE-003` and `MARKETING-LIFECYCLE-004` |
| `onboarding` | `PRODUCT-DELIVERY-007`, `MARKETING-LIFECYCLE`, `PROFILE-UI-FEATURE` |
| `paywalls` | `MARKETING-LIFECYCLE`, `FND-TRUST`, `PROFILE-UI-FEATURE` |
| `popups` | `PROFILE-UI-FEATURE`, `FND-ACCESSIBILITY`, `FND-TRUST` |
| `pricing` | `MARKETING-LIFECYCLE`, `FND-EVIDENCE`, `FND-TRUST`; qualified legal and financial review as applicable |
| `product-marketing` | `MARKETING-LIFECYCLE-001`, `PRODUCT-DELIVERY`, `FND-EVIDENCE` |
| [`programmatic-seo`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/programmatic-seo/SKILL.md) | `SEO-FOUNDATIONS`, `PROFILE-PUBLIC-WEB-PAGE`, `DATA-QUALITY` |
| `prospecting` | `MARKETING-DIRECT-OUTREACH`, `SALES-REVENUE-OPERATIONS` |
| `public-relations` | `MARKETING-PUBLIC-ENGAGEMENT` |
| `referrals` | `MARKETING-DISTRIBUTION`, `MARKETING-PUBLIC-ENGAGEMENT` when partners or endorsements apply |
| `revops` | `SALES-REVENUE-OPERATIONS` |
| `sales-enablement` | `SALES-REVENUE-OPERATIONS`, `PROFILE-FUNCTIONAL-WRITING` |
| [`schema`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/schema/SKILL.md) | `SEO-FOUNDATIONS-006`, `PROFILE-PUBLIC-WEB-PAGE` |
| [`seo-audit`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/seo-audit/SKILL.md) | `SEO-FOUNDATIONS`, `PROFILE-PUBLIC-WEB-PAGE`, `PLAYBOOK-GSC` |
| `signup` | `MARKETING-LIFECYCLE`, `PROFILE-UI-FEATURE`, `PRODUCT-DELIVERY` |
| [`site-architecture`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/site-architecture/SKILL.md) | `SEO-FOUNDATIONS`, `DESIGN-INTERACTION`, `PROFILE-PUBLIC-WEB-PAGE` |
| `sms` | `MARKETING-DIRECT-OUTREACH` plus current jurisdiction and channel rules |
| `social` | `MARKETING-PUBLIC-ENGAGEMENT` |
| `video` | `MEDIA-PRODUCTION-RIGHTS` |

## Specialist route

`PROFILE-SPECIALIST-MARKETING` selects the applicable extension standard for paid media, direct outreach, public engagement, sales operations, app stores, media production, and distribution. These extensions are governed drafts outside the bounded v1 release until independently reviewed. Every specialist task also activates applicable v1 foundations for evidence, trust, privacy, accessibility, security, measurement, and verification.

## Source

- Corey Haines and contributors, [Marketing Skills for AI Agents at commit `e55de886`](https://github.com/coreyhaines31/marketingskills/tree/e55de886fe7580ec75cdb7ded5092b33f7d4ed58). MIT-licensed task inventory, version 2.11.0, reviewed September 1, 2026. This source supplies an informative task taxonomy, not binding search-engine behavior or policy.
