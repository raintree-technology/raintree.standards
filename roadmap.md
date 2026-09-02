---
type: Roadmap
title: Coverage roadmap
description: Prioritized gaps and triggers for expanding the raintree.standards library.
tags: [roadmap, coverage, governance]
generated: { by: codex/gpt-5, at: "2026-09-01T21:33:16-07:00" }
---

# Coverage roadmap

Use this roadmap to see what is authored, what still needs review, and when to propose a
new standard. The bounded version 1 domain baseline is authored. Release remains
blocked on the independent and qualified reviews recorded in
[version 1.0 readiness](governance/v1-readiness.md).

After version 1, add to the library only when recurring work exposes a decision, risk,
or verification gap.

## V1 baseline

- [x] APIs: contracts, errors, pagination, idempotency, versioning, rate limiting
- [x] Engineering: architecture, testing, dependencies, observability, release readiness, and shared JavaScript and TypeScript quality policy through Biome, Trellis, Oxlint, and vendored anti-slop
- [x] Data: modeling, migrations, lineage, validation, reconciliation, backup and recovery
- [x] Product: discovery, requirements, prioritization, launches, onboarding, metrics
- [x] Design: interaction patterns, forms, states, responsive behavior, design systems
- [x] Content: interface copy, empty states, confirmations, inclusive language
- [x] Growth and marketing: acquisition, conversion, onboarding, retention, lifecycle messaging, experimentation
- [x] SEO: technical SEO, structured data, content quality, internal linking, migrations, Search Console operations
- [x] Operations: objectives, runbooks, incidents, support, vendors, recovery, postmortems
- [x] Universal accessibility plus an Apple-specific interface route

## Draft baselines awaiting qualified review

- AI: `AI-AGENTS` covers architecture selection, task contracts, instruction trust, context, tools, authority, containment, data paths, environmental feedback, recovery, human judgment, versioning, evaluation validity, repeated trials, grading, red teaming, observability, parallelism, and governed knowledge.
- Security: `SECURITY-APPLICATION` covers application threat modeling, access control, authentication, sessions, untrusted input, files, outbound requests, cryptography, configuration, dependencies, abuse limits, detection, high-impact actions, verification, and response. `SECURITY-SECRETS` defines Infisical as the sole product-secret system of record and governs hierarchy, human and workload identity, delivery, precedence, rotation, exposure, availability, audit, control-plane operation, recovery, and migration.
- Privacy: `PRIVACY-DATA` covers processing maps, authority, minimization, purpose, notice, consent, rights, retention, accuracy, de-identification, heightened harm, recipients, impact assessments, non-production data, and release verification.

The draft standards, playbooks, profiles, and patterns listed in the catalog remain pending until their owners complete the required independent and domain-qualified reviews.

## Post-v1 extensions authored as drafts

- [x] Paid advertising and platform-specific campaign operations — `MARKETING-PAID-MEDIA`
- [x] Cold outreach, prospecting, and jurisdiction-specific channel rules — `MARKETING-DIRECT-OUTREACH`
- [x] Public relations, social publishing, communities, influencers, and partnerships — `MARKETING-PUBLIC-ENGAGEMENT`
- [x] Sales enablement, competitive intelligence, and revenue operations — `SALES-REVENUE-OPERATIONS`
- [x] App-store optimization and store policy — `DISCOVERY-APP-STORES`
- [x] Image, video, ad creative, and other media production and rights — `MEDIA-PRODUCTION-RIGHTS`
- [x] Directories, lead assets, referrals, incentives, contests, and distribution programs — `MARKETING-DISTRIBUTION`
- [x] Project, supplier, facility, and counterparty evidence reviews — `PROFILE-COMMERCIAL-EVIDENCE-REVIEW`
- [x] Organizational knowledge systems, federated retrieval guidance, and source-neutral conformance audits — `KNOWLEDGE-SYSTEMS`, `PROFILE-COMPANY-BRAIN`, `PATTERN-FEDERATED-KNOWLEDGE`, and `PLAYBOOK-STANDARDS-AUDIT`
- [x] Public terms, privacy notices, legal centers, assent evidence, and legal-document change control — `LEGAL-PUBLISHED-TERMS` and `PROFILE-LEGAL-DOCUMENT`
- [x] Server-side TypeScript structured logging with Pino — `OPERATIONS-LOGGING`
- [x] Safe unused-code and dependency cleanup with TypeScript/JavaScript Knip plus Biome/Trellis, Python Ruff and deptry, contextual Vulture, and analyzer canaries — `ENGINEERING-CODE-REMOVAL` and `PROFILE-CODE-REMOVAL`
- [x] Source-neutral external-platform requirements plus separate Stripe, Plaid, Vercel, Resend, Neon, and Cloudflare playbooks and manifest-backed review bundles — `INTEGRATIONS-VENDOR` and the six provider playbooks
- [x] Risk- and architecture-based software testing, separate smoke, synthetic, and canary contracts, staged and selective gates, controlled time and version compatibility, test-size and suite-lifecycle controls, governed production-derived data, bounded shadow and fault-injection exercises, explicit canary promotion, rapid field guidance, situation recipes, copyable records, real-repository examples, machine routing, validation, and ordinary software-change routing — `ENGINEERING-TESTING`, `PLAYBOOK-TEST-STRATEGY`, and `PROFILE-SOFTWARE-CHANGE`
- [x] WebMCP progressive enhancement, provider and consumer trust boundaries, tool contracts, input and result minimization, control parity, consequential-action review, origin and lifecycle boundaries, prompt-injection handling, cancellation, accessibility, declarative-form evidence, localization, contract evolution, adoption gates, and end-to-end verification — `WEB-WEBMCP`
- [x] Apple-platform scope, task adaptation, native semantics, user-setting adaptation, input and focus, navigation and windowing, system experiences, current-source pinning, representative final-build evidence, and shared-framework behavior — `APPLE-PLATFORM-INTERACTION`

All seven specialist extension standards, `PROFILE-SPECIALIST-MARKETING`, and
`PROFILE-COMMERCIAL-EVIDENCE-REVIEW` remain drafts pending independent,
domain-qualified review. The organizational-knowledge standard, company-brain
profile, federated-knowledge pattern, and standards-audit playbook have the same draft
and review boundary.

The published-legal-terms standard and legal-document profile require qualified legal
and privacy review. The TypeScript logging standard requires independent engineering,
operations, security, and privacy review. The code-removal standard requires
independent engineering review. The Redis standard and Redis-change profile require
independent data, engineering, operations, and security review.
The external-platform standard and provider playbooks require independent platform,
security, privacy, operations, and provider-domain review as applicable.
The software-testing standard, test-strategy playbook, and software-change profile require independent engineering, quality, and operations review.
The WebMCP standard requires independent web, AI, engineering, security, privacy, product, accessibility, and representative-reader review. Its external source set remains highly volatile while WebMCP is a Community Group draft.
The Apple-platform interaction standard requires independent Apple-platform, design, engineering, accessibility, and representative-reader review. Apple's live Human Interface Guidelines remain the canonical and highly volatile platform source.

## Open extension queue

- Deeper domain patterns that recurring project evidence shows cannot be handled by the authored standards

## Add a standard when

- The same judgment recurs across projects.
- A failure could materially harm users or the business.
- Reviews repeatedly produce the same feedback.
- Agents need an explicit completion test.
- An incident, experiment, or decision produced reusable knowledge.
