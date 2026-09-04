---
type: Guide
title: Changelog
description: Release-note policy for material changes to governed requirements and repository contracts.
tags: [governance, releases, compatibility]
generated: { by: codex/gpt-5, at: "2026-09-04T13:41:00-07:00" }
---

# Changelog

This file records material changes to governed requirements, profiles, schemas, playbooks, lifecycle status, and compatibility.

## Unreleased

- No changes recorded yet.

## 1.1.1 — 2026-09-04

- Excluded installed Codex skill instructions from governed Markdown validation.
  This keeps the generated plugin self-contained without treating its package
  metadata as an OKF standards document. No governed rule or maturity status
  changed.

## 1.1.0 — 2026-09-04

- Demoted eight documents whose dependency closure includes draft material. The
  catalog now contains 7 stable and 69 draft governed documents; stability must
  be restored through qualified review.
- Added validation for missing dependencies, dependency cycles, and direct or
  transitive stable-to-draft dependencies.
- Added deterministic JSON profile routing and the `standards-navigator` Codex
  plugin recipe. Routes preserve maturity, review, exception, and unverified
  evidence status without claiming certification.
- Added `ENGINEERING-QUALITY-010` for material behavior, facts, route inventories, schemas, configuration, and artifacts represented across multiple components, repositories, packages, generated outputs, or delivery surfaces. The rule requires one canonical owner, registered consumers, direct consumption or reproducible generation, deterministic drift detection, supported-runtime verification, and an old-reference search after moves or removals. `PROFILE-SOFTWARE-CHANGE` now includes its completion evidence. Independent engineering and quality review remains pending.
- Corrected `PROFILE-FUNCTIONAL-WRITING` so every completion-evidence item names its rule level, verification tier, evidence, and visible violation symptoms. The profile classifies atomic, bounded, and extended artifacts before subtracting only items whose governed applicability condition is false. It requires explicit missing-evidence statuses under `FND-EVIDENCE-003`, includes `WRITING-FUNCTIONAL-005`, and defines the review output through `AGENT-VERIFICATION-004` and `AGENT-VERIFICATION-005`. `AGENT-VERIFICATION-003` now owns review-versus-edit authority for all agent work. `WRITING-FUNCTIONAL-015` treats style preferences generally as review signals rather than defects, and new `WRITING-FUNCTIONAL-016` defines meaning-preserving English grammar checks. The grammar and style guidance maps Automattic Harper's version-pinned lint kinds and default style families to correctness, clarity, evidence, audience, and advisory routes. It uses Oxford's problem-focused usage guidance for modality, quantity, conditions, comparisons, clause attachment, register, and dialect while keeping product house style contextual. Enhancement, readability, regionalism, style, disabled preferences, and tool suggestions do not become automatic failures. Dependency-loading failures now halt governed work, and the content index exposes the root-level `CONTENT-ERRORS` path. Independent content and standards-owner review remains pending.
- Added the post-v1 draft `APPLE-PLATFORM-INTERACTION`. Its ten rules require a declared Apple environment; task-level platform adaptation; native semantics and adaptive system resources; support for appearance, language, accessibility, display, and motion settings; platform input and focus behavior; platform-appropriate navigation, windows, and multitasking; complete system-experience lifecycle handling; dated Apple guidance and implementation assumptions; representative final-build verification; and native behavior through shared frameworks. `PROFILE-APPLE-INTERFACE` and `PLAYBOOK-APPLE-HIG` now route to the stable rule IDs. Apple's current Human Interface Guidelines remain canonical; HIG Doctor remains optional supporting evidence. Independent Apple-platform, design, engineering, accessibility, and representative-reader review remains required.
- Expanded `PLAYBOOK-AGENT-DESIGN-GUIDANCE` with an optional formative loop for distinct design exploration, bounded fresh-context model critique, purposeful generated media, and subtractive polish. Random stimuli and model scores remain exploratory evidence rather than product rationale or release approval. Generated media now routes to `MEDIA-PRODUCTION-RIGHTS`, motion to `DESIGN-INTERACTION-013`, and provider credentials to `SECURITY-SECRETS`. Independent human review, accessibility evidence, and existing release criteria remain required.
- Added the post-v1 draft `WEB-WEBMCP`. Its fifteen rules require progressive enhancement; exact and minimal tool contracts; control parity with human and service paths; explicit review for consequential actions; least-privilege origin exposure; trusted metadata boundaries; repeat-safe cancellation; accessible shared state; separate browser-agent and in-page-agent trust models; minimized, secret-free results; browser-bound declarative-form evidence; localized metadata and precise text limits; compatible contract evolution; and complete lifecycle verification. The agentic-system profile conditionally activates it for WebMCP work. The adoption guidance records the in-progress TAG review, Mozilla's neutral label, and WebKit's opposition. Independent web, AI, engineering, security, privacy, product, accessibility, and representative-reader review remains required; the source specification is a volatile W3C Community Group draft, not a W3C Standard.

## 1.0.0 — 2026-09-01

- Released the first stable library contract for catalog structure, rule IDs, task profiles, and automated validation. Document status and review metadata continue to report the maturity of individual standards.
- Added the post-v1 draft `ENGINEERING-TESTING`, `PLAYBOOK-TEST-STRATEGY`, and `PROFILE-SOFTWARE-CHANGE`. They define scope-relative test-layer claims; separate smoke, synthetic, and canary decisions; require bounded smoke tests, test-size contracts, stable suite ownership and lifecycle, controlled flake diagnosis, production-derived data governance, architecture-aware portfolios, conservative selective execution, controlled time, version-skew and migration evidence, bounded shadow and fault-injection exercises, explicit canary promotion, and staged local through post-deployment evidence. Existing product, UI, public-web, service/API, and agentic profiles conditionally activate the software-change profile for implementation and test-suite work. Independent engineering, quality, and operations review remains required.
- Added a non-normative testing reference layer: rapid field guide, twelve situation recipes, eleven copyable records, three real-repository worked examples, and `testing/routes.yaml` machine routing. A dedicated validator and behavior suite cover every standard taxonomy type and prevent unknown, missing, or abbreviated rules; stale paths and anchors; duplicate headings and route lists; malformed paths and dates; invalid stages; missing templates; and catalog-route drift. Pilot observations informed removal of duplicated policy guidance; representative-reader and independent review remain pending.
- `governance/contributing.md` now states the release-gate lifecycle directly: a document may be `stable` while independent verification is pending, and the `--release` gate blocks a versioned release until `verified` is recorded. This removes a contradiction with the gate design described in the same document and in `governance/authority.md`.
- `governance/v1-readiness.md` records the five stable documents that depend on drafts as known release blockers.
- `DATA-DATABASE-007` level corrected from `avoid` to `required`; the rule requires bounding growing access paths.
- `WEB-QUALITY-017`, `AI-AGENTS-008`, and `API-CONTRACTS-008` now delegate to their owning rules (`CONTENT-ERRORS-012`, `PRIVACY-DATA-016`, `SECURITY-APPLICATION-002`) instead of restating them; `API-CONTRACTS-003` now cites `CONTENT-ERRORS-011` for HTTP error formats; the `WEB-QUALITY` accessibility section names the `FND-ACCESSIBILITY` rules it specializes.
- Declared previously implicit `depends_on` edges: `WEB-QUALITY` and `API-CONTRACTS` → `CONTENT-ERRORS`; `AI-AGENTS` → `PRIVACY-DATA`; `KNOWLEDGE-SYSTEMS` → `AI-AGENTS`; `OPERATIONS-LOGGING` → `API-CONTRACTS`; `ENGINEERING-CODE-REMOVAL` → `ENGINEERING-JS-QUALITY`; `WRITING-FUNCTIONAL` → `AGENT-VERIFICATION`.
- `PROFILE-SPECIALIST-MARKETING` completion evidence now cites rule IDs.
- Every rule's `Level` line now uses the standard template's hard line break so `Level` and `Applies when` render on separate lines.
- Catalog and index reconciliation: `governance/documentation-quality.md` added to `catalog.yaml`; `MARKETING-PROJECT-SHOWCASE` added to the root index; `OPERATIONS-LOGGING` and `MARKETING-PROJECT-SHOWCASE` added to the coverage matrix; duplicate entries removed from the foundations and data indexes; the browse list is alphabetized; the standards-audit playbook names the Google Search Console playbook in its provider route.

Each release entry should name affected stable IDs, applicability or requirement-level changes, migration work, independent verification status, and any unresolved release blockers. Catalog structure changes alone do not imply content approval.
