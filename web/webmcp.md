---
id: WEB-WEBMCP
title: WebMCP tools for agent-accessible web applications
description: Defines safe, accurate, accessible, and testable WebMCP tool exposure for web applications.
type: standard
status: draft
governance_status: draft
release_target: post-v1
owners: [web, ai, engineering, security, privacy, product]
last_reviewed: 2026-09-01
review_by: 2026-12-01
stale_after: 2026-12-01
applies_to: [webmcp-change, agentic-system, public-web-page, software-change]
tags: [web, webmcp, agents, tools, security, privacy, accessibility]
depends_on: [AI-AGENTS, WEB-QUALITY, SECURITY-APPLICATION, PRIVACY-DATA, FND-TRUST, FND-CHANGE, AGENT-VERIFICATION]
generated: { by: codex/gpt-5, at: "2026-09-01T16:46:56-07:00" }
sources:
  - id: webmcp-draft
    resource: https://webmachinelearning.github.io/webmcp/
    title: WebMCP Draft Community Group Report
    author: organization:w3c-web-machine-learning-community-group
    last_modified: 2026-08-26
  - id: webmcp-explainer
    resource: https://github.com/webmachinelearning/webmcp/blob/main/README.md
    title: WebMCP explainer
    author: organization:w3c-web-machine-learning-community-group
  - id: webmcp-declarative-explainer
    resource: https://github.com/webmachinelearning/webmcp/blob/main/declarative-api-explainer.md
    title: WebMCP declarative API
    author: organization:w3c-web-machine-learning-community-group
  - id: webmcp-security-privacy
    resource: https://github.com/webmachinelearning/webmcp/blob/main/security-privacy-questionnaire.md
    title: WebMCP Self-Review Questionnaire Security and Privacy
    author: organization:w3c-web-machine-learning-community-group
  - id: chrome-webmcp
    resource: https://developer.chrome.com/docs/ai/webmcp
    title: WebMCP
    author: organization:google
    last_modified: 2026-08-07
  - id: tag-webmcp-review
    resource: https://github.com/w3ctag/design-reviews/issues/1238
    title: "Incubation: WebMCP"
    author: organization:w3c-tag
  - id: mozilla-webmcp-position
    resource: https://github.com/mozilla/standards-positions/issues/1412
    title: Mozilla standards position for WebMCP
    author: organization:mozilla
  - id: webkit-webmcp-position
    resource: https://github.com/WebKit/standards-positions/issues/670
    title: WebKit standards position for WebMCP
    author: organization:webkit
---

# WebMCP tools for agent-accessible web applications

Use WebMCP as a progressive enhancement that lets an agent discover and invoke web application functions without replacing the visible, accessible user experience. A WebMCP tool must preserve the same authorization, validation, user control, and outcome evidence as the human path it represents.

This standard applies when a web application registers, exposes, executes, consumes, or materially changes a WebMCP tool. It covers imperative tools registered through `document.modelContext` and declarative tools derived from HTML forms.

WebMCP is a W3C Community Group draft, not a W3C Standard or a W3C Standards Track specification. Its API, security model, annotations, declarative form behavior, and browser support can change. Treat current browser implementations and origin trials as experimental compatibility targets, not proof of interoperability or production readiness.

The standards review remains unsettled as of September 1, 2026. The W3C Technical Architecture Group review is in progress and identifies missing multi-stakeholder support. Mozilla's standards-position issue is labeled neutral. WebKit records opposition and identifies API-design, duplication, internationalization, portability, privacy, security, consent, use-case, and venue concerns. These positions do not decide whether a bounded experiment is useful, but they prohibit claims of web-platform consensus or portable support.

## Rules

### WEB-WEBMCP-001 — Keep WebMCP a progressive enhancement

**Level:** required
**Applies when:** A page exposes or consumes a WebMCP tool.

Keep the underlying task usable through the declared human interface without WebMCP support. Feature-detect the reviewed WebMCP API and fail without changing user data when the API or required capability is unavailable. Record the exact specification revision, browser versions, flags or trial requirements, and fallback behavior used for acceptance.

**Why:** WebMCP remains an evolving proposal with limited and changing browser support. Making it the only task path can exclude users, break unsupported clients, and couple the product to an unstable interface.

**Verify:**

- Complete the task with WebMCP unavailable and confirm that the human path remains usable.
- Inspect the compatibility record and exercise unsupported, partially supported, disabled, and registration-failure states.
- Confirm that fallback does not silently invoke a different tool, broaden authority, or duplicate a side effect.

**Exceptions:** An isolated experiment can omit a production fallback when it is labeled as an experiment, contains no required user task, and cannot affect production data or accounts.

### WEB-WEBMCP-002 — Make each tool contract exact

**Level:** required
**Applies when:** Defining or changing a tool name, title, description, input schema, annotation, result, or effect.

Define one bounded capability per tool. Make its name, localized title, description, schema, annotations, result, preconditions, side effects, confirmation point, and failure meaning agree with its implementation. State irreversible, financial, external, privacy-relevant, or account-changing effects directly. Do not use ambiguous completion verbs such as “finalize,” “process,” or “handle” when the tool purchases, sends, publishes, deletes, shares, or changes access.

Treat `readOnlyHint` and `untrustedContentHint` as claims that require evidence, not as agent-enforced security controls. Mark `readOnlyHint` true only when execution cannot mutate application, user, device, or external state. Mark `untrustedContentHint` true when results can contain content that the registering application does not control or trust.

**Why:** Agents select tools from natural-language metadata. A mismatch can cause an unintended consequential action, conceal untrusted content, or make a caller rely on a false safety claim.

**Verify:**

- Trace every contract field to the execution path and resulting state change.
- Compare the tool with the equivalent human flow, API contract, authorization policy, and displayed confirmation.
- Test contract interpretation with representative requests, including similar tools and requests that must not select the tool.

**Exceptions:** None.

### WEB-WEBMCP-003 — Minimize and validate tool inputs

**Level:** required
**Applies when:** A tool accepts input arguments or a declarative form synthesizes an input schema.

Request only the fields needed for the stated action. Define types, required fields, formats, enumerations, ranges, lengths, and collection bounds in the schema where the reviewed WebMCP implementation supports them. Reject unknown, malformed, unauthorized, stale, and out-of-range values in the trusted application or service boundary before any side effect. Do not request personal, inferred, cross-site, or personalization data because an agent might possess it.

Schema validation is not authorization or business validation. Recheck ownership, entitlement, current state, price, recipient, and other authoritative facts during execution.

**Why:** Over-parameterized tools can extract private agent context. Schemas can reduce malformed calls but cannot establish identity, authority, or current business state.

**Verify:**

- Map each input field to a necessary use, retention rule, and protected processing purpose.
- Exercise missing, extra, malformed, oversized, stale, cross-account, and unauthorized values.
- Confirm rejected calls cause no partial side effect and do not log unnecessary personal data.

**Exceptions:** An optional field can support a documented user benefit when its purpose, authority, minimization decision, and omission behavior satisfy `PRIVACY-DATA`.

### WEB-WEBMCP-004 — Preserve application controls across the tool path

**Level:** required
**Applies when:** A WebMCP execution reads protected data or can change application or external state.

Route the tool through the same owned domain operation, authorization policy, validation, rate limit, abuse control, transaction boundary, and audit event as the equivalent human or service path. Treat the authenticated browser session as identity context, not as proof that the user intended this specific action. Do not create an agent-only bypass around server enforcement or duplicate privileged business logic in the page callback.

**Why:** A tool callback uses a different entry path from ordinary interface actuation. Divergent controls can let an authenticated agent perform actions that the human path would reject or review.

**Verify:**

- Compare effective controls and outcomes across the WebMCP, human, and service paths.
- Attempt direct callback invocation, parameter tampering, cross-account access, replay, and calls after authorization changes.
- Confirm audit evidence attributes the action, initiating surface, effective identity, target, decision, and outcome without recording prohibited data.

**Exceptions:** A read-only public-data tool can omit authentication when the same data is intentionally public and its abuse and availability limits remain enforced.

### WEB-WEBMCP-005 — Require user control for consequential execution

**Level:** required
**Applies when:** A tool can purchase, transfer, send, publish, delete, disclose, change access, accept terms, or cause another high-impact or hard-to-reverse effect.

Show the user the exact target, material inputs, recipient, price or obligation, and effect before commitment. Bind approval to that exact action and re-open review when a material value or state changes. Provide cancellation, correction, result confirmation, and recovery appropriate to the consequence.

Do not use declarative `toolautosubmit` for a consequential action unless a separate trusted confirmation step still binds the exact action before the side effect. Do not rely on a current or proposed WebMCP annotation to supply this control.

**Why:** The current proposal does not guarantee that declared intent matches behavior and does not provide normative safeguards for sensitive or high-privilege operations.

**Verify:**

- Exercise preview, edit, approve, deny, timeout, changed-state, cancellation, partial failure, and recovery paths.
- Confirm unanswered or denied approval does not execute through WebMCP, interface actuation, retry, or fallback.
- Verify that confirmation identifies whether the action is proposed, pending, completed, or failed from authoritative state.

**Exceptions:** A pre-authorized, low-impact recurring action can execute within a visible scope, limit, duration, and revocation control under `FND-TRUST-009`.

### WEB-WEBMCP-006 — Constrain origin exposure and registration lifetime

**Level:** required
**Applies when:** Registering tools, embedding frames, setting the `tools` Permissions Policy, or exposing tools across origins.

Use a secure context and keep the `tools` Permissions Policy at its least-privilege default. Expose a tool across origins only to an exact, potentially trustworthy origin with a documented need, owner, data path, and revocation route. Do not use broad domain patterns or convenience delegation.

Tie each imperative registration to the document and feature state that makes the tool valid. Unregister it when the feature, account, authorization, selected resource, or owning component is no longer active. Rediscover tools after navigation or material state changes instead of relying on a stale registration or cached `RegisteredTool`.

**Why:** Cross-origin discovery and stale registrations can expose privileged functions to unintended callers or apply old schemas and assumptions to new state.

**Verify:**

- Inspect effective response headers, frame `allow` attributes, `exposedTo` values, origins, and secure-context behavior.
- Attempt discovery and execution from same-origin, allowed cross-origin, denied cross-origin, opaque-origin, navigated, signed-out, and stale-state contexts.
- Confirm teardown removes the registration and pending work follows the documented cancellation policy.

**Exceptions:** None for cross-origin exposure. A static, read-only tool can remain registered for the document lifetime when its authority and result do not depend on changing feature state.

### WEB-WEBMCP-007 — Separate trusted contracts from untrusted content

**Level:** required
**Applies when:** Tool metadata, arguments, or results can contain content from users, external sources, retrieved documents, or model output.

Keep tool names, descriptions, parameter descriptions, and annotations under trusted application control. Do not interpolate untrusted content into instructions or metadata. Treat all tool arguments and returned content as untrusted data at their receiving boundaries. Set `untrustedContentHint` when applicable, preserve provenance in the result, and prevent returned text from granting authority, changing the task, selecting another tool, or overriding user instructions.

Bound metadata and result size to the task. Sanitize for the destination context, but do not represent sanitization as a complete prompt-injection defense.

**Why:** Tool metadata and results enter agent context. Embedded instructions can redirect later reasoning, disclose cross-site data, or trigger unrelated tools.

**Verify:**

- Test malicious instructions in every metadata field, argument, upstream content field, error, and result.
- Confirm the agent does not follow result-borne requests to reveal data, expand scope, or invoke unrelated tools.
- Inspect provenance, trust annotations, length bounds, destination encoding, and logs for representative results.

**Exceptions:** None.

### WEB-WEBMCP-008 — Make execution cancellable and repeat-safe

**Level:** required
**Applies when:** A tool performs asynchronous work, can be retried, or can outlive the initiating page state.

Honor the execution `AbortSignal`, define a timeout, and stop work at safe boundaries. Make mutation tools idempotent or require a unique operation key and authoritative duplicate detection. Define what cancellation means before, during, and after commitment, and return a truthful outcome that distinguishes canceled, unknown, partial, failed, and completed states.

Do not infer success only because an execution callback resolved. Verify consequential outcomes against authoritative application state before presenting completion.

**Why:** Navigation, cancellation, races, retries, and delayed callbacks can duplicate effects or leave the user and agent with an incorrect result.

**Verify:**

- Interrupt execution before validation, before commitment, during external work, after commitment, and during result delivery.
- Retry with the same and different operation keys and confirm the documented single-effect behavior.
- Compare returned status with authoritative state after timeout, navigation, callback rejection, serialization failure, and late completion.

**Exceptions:** A synchronous, side-effect-free computation can omit a separate timeout and idempotency key when its input and execution cost are bounded.

### WEB-WEBMCP-009 — Preserve the visible and accessible task state

**Level:** required
**Applies when:** Tool execution reads from or changes a user-visible page, form, selection, status, or workflow.

Keep the human interface and WebMCP tool bound to the same current task state. Show material tool effects, pending work, errors, and completion in the interface without stealing focus or hiding the user's ability to interrupt, correct, or continue manually. Preserve native form semantics and accessible names when using declarative WebMCP attributes.

Do not expose an agent-only outcome that a user cannot inspect, understand, or recover from through a supported interface.

**Why:** WebMCP is intended for shared user-agent workflows. Hidden or divergent state prevents users and assistive technologies from verifying what the agent did.

**Verify:**

- Complete representative flows through WebMCP and manually, then compare visible state, accessible state, validation, errors, and authoritative outcome.
- Exercise keyboard and supported assistive technology during pending, confirmation, success, failure, and cancellation states.
- Confirm focus, announcements, form values, and page navigation remain understandable after agent action.

**Exceptions:** A developer-only experiment can use diagnostic output instead of a complete product interface when it has no production authority and is not presented as user-accessible.

### WEB-WEBMCP-010 — Verify the complete WebMCP lifecycle

**Level:** required
**Applies when:** Releasing or materially changing a WebMCP tool, consumer, permissions policy, or declarative form integration.

Test the final running artifact across registration, discovery, selection, execution, cancellation, result handling, unregistration, navigation, and fallback. Cover representative supported browsers and agents, unsupported clients, same-origin and cross-origin boundaries, valid and invalid inputs, authorization changes, duplicate calls, partial failures, stale tools, untrusted content, consequential approvals, and human continuation.

Bind evidence to the exact specification revision, browser or trial configuration, application revision, tool contract, and evaluation set. Record unresolved proposal gaps and browser-specific behavior. Do not describe a successful implementation as WebMCP-conformant or interoperable unless an applicable conformance definition and cross-browser evidence exist.

**Why:** A unit test of the callback cannot reveal discovery, browser mediation, origin, lifecycle, accessibility, or agent-interpretation failures.

**Verify:**

- Preserve the environment matrix, tool inventory, contract snapshots, scenario results, traces, authoritative outcome checks, accessibility checks, and residual risks.
- Run held-out selection and refusal scenarios and adversarial tests for metadata injection, output injection, data over-requesting, intent ambiguity, and authority bypass.
- Inspect the rendered human interface and browser-visible behavior in the declared delivery environments.

**Exceptions:** A non-production prototype can use a reduced matrix when the omitted behavior, authority limit, and required pre-release checks are recorded.

### WEB-WEBMCP-011 — Distinguish browser and in-page callers

**Level:** required
**Applies when:** Designing, exposing, consuming, or reviewing a WebMCP tool.

Record whether each intended caller is a browser-provided agent or an in-page JavaScript agent, including an agent in a same-origin or cross-origin frame. For each caller model, record the agent provider, executing document and origin where observable, accessible user and cross-site context, authenticated session use, permission path, user-visible control, and accountable owner.

Treat the two caller models as separate trust boundaries. A `tools` Permissions Policy and `exposedTo` origin list control document access under the reviewed draft; they do not prove user intent, make a caller trustworthy, or establish how a browser-provided agent is exposed. An in-page consumer must bind selection and execution to the discovered tool's origin, current document, contract, and user objective. It must treat provider metadata and results as untrusted even when the provider is allowlisted.

**Why:** WebMCP serves browser-provided agents and in-page agents through different discovery and execution paths. The proposal continues to evolve around their exposure and authority boundaries.

**Verify:**

- Inspect the architecture record for a separate data-flow and authority analysis for each caller model.
- Exercise discovery and execution from the intended browser agent, same-origin document, allowed frame, denied frame, and an unexpected but technically reachable caller.
- Confirm a consumer rejects an origin, document, tool instance, or contract that differs from the reviewed selection.

**Exceptions:** A deployment that supports only one caller model can omit the other model's execution tests when it proves the other route is unavailable and records the browser-specific limitation.

### WEB-WEBMCP-012 — Minimize and protect tool results

**Level:** required
**Applies when:** A tool returns data to an agent or another document.

Return only the fields, records, precision, and history needed for the current task. Bound collection size, nesting, text length, and total serialized size. Include enough provenance, currency, scope, and authoritative identifiers to interpret and verify the result without returning unrelated page, account, or cross-site context.

Do not return passwords, session values, bearer tokens, private keys, recovery codes, raw payment credentials, or other reusable secrets to agent context. Keep sensitive values in the trusted user interface or return a short-lived opaque reference whose redemption enforces identity, purpose, expiry, and one-time or bounded use. Do not treat `untrustedContentHint`, a future output schema, redaction after model ingestion, or a caller's promise not to retain data as a confidentiality control.

**Why:** The current API serializes callback results for the caller but does not define a sensitive-output primitive or complete output-schema enforcement. Excess results can expose protected data to the model, agent provider, logs, or a cross-origin consumer.

**Verify:**

- Map each result field to the current task, authorized recipient, retention path, and authoritative source.
- Inspect model context, traces, browser diagnostics, analytics, errors, and support evidence for raw secrets and unnecessary protected data.
- Exercise empty, maximum-size, multi-record, sensitive, expired-reference, unauthorized-redemption, and partial-result cases.

**Exceptions:** A protected value other than a reusable secret can be returned when the user explicitly authorizes that recipient and purpose, `PRIVACY-DATA` permits the disclosure, and the result remains minimized and access-controlled.

### WEB-WEBMCP-013 — Treat declarative WebMCP as browser-specific

**Level:** required
**Applies when:** Adding WebMCP attributes to a form or consuming a declarative WebMCP tool.

Keep the valid, labeled, keyboard-operable HTML form as the source of truth. Before enabling declarative WebMCP, inspect the exact browser's synthesized tool name, description, required fields, constraints, input schema, submission behavior, cancellation behavior, and result. Do not assume that HTML constraints map to JSON Schema or agent validation in a way the reviewed implementation does not demonstrate.

Do not send an entire successor document or the first available JSON-LD block to agent context as an implicit navigation result. Use an explicit, bounded response whose source and meaning are owned by the application, or stop and require the agent to observe the new document under a separately reviewed policy. When form removal, reset, attribute change, or navigation races with execution, fail closed and reconcile the authoritative submission state before retrying.

**Why:** The draft specification's declarative section, schema-synthesis algorithm, cross-document result mechanism, and several lifecycle events remain incomplete or under debate. The explainer describes experimental behavior that one browser may implement differently.

**Verify:**

- Snapshot the synthesized contract and compare it with the visible form and server contract in every supported browser build.
- Exercise reset, validation failure, manual submit, `toolautosubmit`, `respondWith()`, DOM removal, attribute mutation, navigation, back-forward cache, cancellation, and late resolution.
- Inspect every navigation result for provenance, minimization, sensitive data, untrusted instructions, and agreement with authoritative state.

**Exceptions:** A non-production demonstration can use an explicitly identified explainer behavior when it records the exact browser build, avoids protected data and durable side effects, and does not claim standards conformance.

### WEB-WEBMCP-014 — Localize human metadata and bound text precisely

**Level:** required
**Applies when:** A tool is available in more than one language or accepts or returns human-language text.

Keep the stable machine name separate from the localized human title, description, parameter descriptions, units, enumerations, validation messages, and confirmation text. Use the document's effective locale and the same terminology as the visible task. Preserve user text without changing its normalization or meaning unless the product contract explicitly requires a transformation.

Define every text limit in a precise unit appropriate to its boundary, such as Unicode scalar values, grapheme clusters, UTF-8 bytes, or model tokens. Do not label a byte, code-unit, or token limit as a “character” limit. Apply byte limits only at storage or transport boundaries and give user-facing text a limit that does not split a grapheme or reject a language merely because it uses multi-byte encoding.

**Why:** Tool metadata can guide user-visible agent decisions, and ambiguous text limits behave differently across scripts, emoji sequences, normalization forms, and model tokenizers.

**Verify:**

- Compare localized tool metadata with the visible interface, supported locale files, units, enumerations, and confirmation language.
- Test non-Latin scripts, combining marks, emoji sequences, right-to-left text, long translations, locale-specific numbers and dates, and values at each declared limit.
- Confirm logs, schemas, validation errors, and truncation preserve the declared unit and do not expose or corrupt user text.

**Exceptions:** A single-locale experiment can omit translation coverage when it declares that locale and still handles arbitrary user text safely.

### WEB-WEBMCP-015 — Evolve contracts without ambiguous replacement

**Level:** required
**Applies when:** Changing, replacing, deprecating, or removing a registered tool.

Keep a tool name bound to one semantic capability and effect class. Do not unregister and immediately re-register the same name with an incompatible schema or effect while a document or invocation can still hold the old contract. Introduce a new name or versioned capability for an incompatible change, allow callers to rediscover it, and retire the old tool after pending executions and the documented compatibility window end.

For a compatible metadata or schema change, quiesce new calls, resolve or cancel pending work according to the recorded policy, update the registration, and require rediscovery before execution. Do not cache a `RegisteredTool`, origin decision, or approval across navigation, document replacement, account change, authorization change, or a `toolchange` event.

**Why:** The current draft documents a race in which arguments selected for an old schema can reach a quickly re-registered tool with the same name. Discovery objects also bind to a document and origin whose state can change.

**Verify:**

- Compare contract snapshots and classify each change as compatible or incompatible with rationale and owner.
- Exercise old discovery plus new registration, pending execution plus unregistration, rollback, mixed browser versions, navigation, and stale consumer caches.
- Confirm incompatible callers fail without side effects and receive a bounded path to rediscover or use the human interface.

**Exceptions:** A non-production page reload can replace all tools atomically when no external caller, pending execution, durable approval, or retained discovery object survives the reload.

## Guidance

Use the current `document.modelContext` surface only against the exact draft and browser implementation recorded for the project. Older examples based on `navigator.modelContext`, `provideContext()`, or `clearContext()` do not match the reviewed August 26, 2026 Community Group draft.

Prefer a small task-level tool over a low-level mirror of every button or a broad function that interprets many intents. A good tool reduces ambiguous actuation while leaving policy and state decisions in owned application code.

Register a tool only while it is relevant. For a single-page application, bind registration and its abort controller to component teardown, account changes, route changes, and authorization changes. Treat `toolchange` as a discovery notification whose timing must not replace authoritative state checks.

For declarative WebMCP, start from a valid, labeled, keyboard-operable HTML form. Review synthesized names, field descriptions, required state, constraints, submission behavior, and response handling as a tool contract. The declarative section of the current specification is incomplete, so do not infer behavior that exists only in the explainer or one browser build.

Use staged rollout and a kill switch for production experiments. Monitor registration failures, selection errors, denied approvals, canceled executions, duplicate prevention, authorization failures, tool-result mismatch, recovery, and fallback use without retaining unnecessary arguments or returned content.

### Adoption evidence

Treat the current external signals as deployment constraints, not as popularity scores.

| Signal reviewed September 1, 2026 | Required interpretation |
|---|---|
| W3C Community Group Draft Report | Pin the reviewed draft and revalidate before each material release. Do not call it a W3C Standard. |
| Chrome documentation and origin trial | Treat Chrome behavior as experimental implementation evidence, not cross-browser support. |
| W3C TAG early review in progress with missing multi-stakeholder support | Do not claim architectural review is complete or that the proposal has web-platform consensus. |
| Mozilla standards-position issue labeled neutral | Keep Firefox in the unsupported and fallback matrix unless current implementation evidence proves otherwise. |
| WebKit standards position of oppose | Keep Safari in the unsupported and fallback matrix and address the recorded design, portability, privacy, security, internationalization, and consent concerns before any portability claim. |

## Examples

### Purchase tool

Non-compliant: `finalizeCart` says it “finalizes” a cart, sets `readOnlyHint` to true, accepts an arbitrary `customerContext` object, and immediately charges the saved payment method. Its callback duplicates checkout logic and returns `{ status: "success" }` without checking the order service.

Compliant: `review-order` is read-only and returns the current items, total, currency, delivery address summary, and an expiring order revision. `place-order` accepts only the reviewed order revision and a unique operation key. It uses the same checkout service and authorization policy as the visible flow, shows the exact total and recipient for confirmation, rejects changed revisions, prevents duplicate charges, and verifies the created order before reporting completion.

### Support search with untrusted results

Non-compliant: A support-search tool inserts forum posts into its description so the agent has “more context.” It returns user posts without provenance or an untrusted-content annotation.

Compliant: The description remains fixed application text. The bounded query schema requests only search terms and an optional product area. The result identifies each source and treats post content as data. The tool sets `untrustedContentHint`, and tests confirm that instructions embedded in a post cannot change the user's task or cause another tool call.

## Sources

- W3C Web Machine Learning Community Group, [WebMCP Draft Community Group Report](https://webmachinelearning.github.io/webmcp/), August 26, 2026. Reviewed September 1, 2026.
- W3C Web Machine Learning Community Group, [WebMCP explainer](https://github.com/webmachinelearning/webmcp/blob/main/README.md). Reviewed September 1, 2026.
- W3C Web Machine Learning Community Group, [WebMCP declarative API](https://github.com/webmachinelearning/webmcp/blob/main/declarative-api-explainer.md). Reviewed September 1, 2026.
- W3C Web Machine Learning Community Group, [WebMCP security and privacy self-review](https://github.com/webmachinelearning/webmcp/blob/main/security-privacy-questionnaire.md). Reviewed September 1, 2026.
- Google Chrome for Developers, [WebMCP](https://developer.chrome.com/docs/ai/webmcp), updated August 7, 2026. Reviewed September 1, 2026.
- W3C Technical Architecture Group, [Incubation: WebMCP](https://github.com/w3ctag/design-reviews/issues/1238). Reviewed September 1, 2026.
- Mozilla, [WebMCP standards position](https://github.com/mozilla/standards-positions/issues/1412). Reviewed September 1, 2026.
- WebKit, [WebMCP standards position](https://github.com/WebKit/standards-positions/issues/670). Reviewed September 1, 2026.
