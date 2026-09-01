---
type: Playbook
title: Contributing standards
description: Acceptance, writing, and review requirements for maintaining the standards library.
tags: [governance, contribution, review]
generated: { by: codex/gpt-5, at: "2026-09-01T21:00:00Z" }
---

# Contributing standards

Only update this repository when explicitly assigned a standards-maintenance task.

## Acceptance criteria

A new or materially changed standard must:

- Address a recurring decision or material risk.
- Separate mandatory rules from explanatory guidance.
- Use stable, unique rule IDs.
- Define applicability and verification evidence.
- Cite primary sources for external factual claims where practical.
- Avoid vendor-specific prescriptions unless the vendor is intentionally part of the policy.
- State important tradeoffs and exceptions.
- Include at least one realistic example for rules that are easy to misinterpret.
- Add or update relevant task profiles.
- Update `catalog.yaml`.
- Preserve unknown OKF front-matter fields when reading and writing documents.
- Record `generated` after a meaningful content change; record `verified` only after an independent source or resource check.
- Mark a document `stable` only when its requirements are settled. Use document status and `verified` metadata to report maturity; neither field controls the library's version number.
- Register external source-set ownership and freshness in `source-register.yaml`.
- Set `release_target` when a governed document is intentionally outside the catalog's current target release; omission means the current target.

## Writing style

- Write for a capable agent or practitioner encountering the situation mid-task.
- State the outcome first, followed by rationale and implementation detail.
- Prefer measurable thresholds only when evidence supports them.
- Do not convert personal preference into policy.
- Do not use “best practice” as its own justification.
- Describe risks without pretending all projects have the same scale or threat model.

## Review

Review changes for technical correctness, operational feasibility, unintended incentives, and conflicts with existing rules. High-impact security, legal, privacy, financial, or regulatory standards require a qualified human owner.

The author and verifier must be different actors. An agent may prepare review evidence and proposed findings but may not record a human verification event or qualified approval. Run every check listed in `CONTRIBUTING.md` for each change: the catalog, integration, and testing-reference validators; their behaviour suites; the shared library tests; and the schema drift check. Before a versioned release, also run `ruby scripts/validate_catalog.rb --release`; this confirms that the catalog is marked ready and has a public release entry point.

`schema/standard.schema.json` and `schema/integration-capability.schema.json` are applied to real documents by the validators, not merely parsed. `scripts/test_schema_drift.rb` fails when a schema and its handwritten validator stop agreeing, so update both together.
