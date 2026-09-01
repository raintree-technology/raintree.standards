---
id: SEO-FOUNDATIONS
title: Search foundations
description: Makes useful public content discoverable and understandable without misleading users or crawlers.
type: standard
status: stable
governance_status: active
owners: [seo, content, engineering]
last_reviewed: 2026-09-01
review_by: 2026-11-13
stale_after: 2026-11-13
applies_to: [public-web-page, seo-migration, content-program]
tags: [seo, crawling, indexing, content]
depends_on: [FND-EVIDENCE, FND-TRUST]
generated: { by: codex/gpt-5, at: "2026-09-01T12:55:52-07:00" }
sources:
  - id: google-crawling-indexing
    resource: https://developers.google.com/search/docs/crawling-indexing
    title: Crawling and indexing
    author: organization:google
  - id: google-canonicalization
    resource: https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls
    title: How to specify a canonical URL
    author: organization:google
  - id: google-redirects
    resource: https://developers.google.com/search/docs/crawling-indexing/301-redirects
    title: Redirects and Google Search
    author: organization:google
  - id: ietf-http-semantics
    resource: https://www.rfc-editor.org/rfc/rfc9110.html
    title: HTTP Semantics
    author: organization:ietf
  - id: ietf-robots
    resource: https://www.rfc-editor.org/rfc/rfc9309.html
    title: Robots Exclusion Protocol
    author: organization:ietf
  - id: google-helpful-content
    resource: https://developers.google.com/search/docs/fundamentals/creating-helpful-content
    title: Creating helpful reliable people-first content
    author: organization:google
  - id: google-javascript-seo
    resource: https://developers.google.com/search/docs/crawling-indexing/javascript/javascript-seo-basics
    title: Understand the JavaScript SEO basics
    author: organization:google
  - id: google-localized-versions
    resource: https://developers.google.com/search/docs/specialty/international/localized-versions
    title: Tell Google about localized versions of your page
    author: organization:google
  - id: google-structured-data
    resource: https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data
    title: Introduction to structured data markup in Google Search
    author: organization:google
  - id: google-ai-search-optimization
    resource: https://developers.google.com/search/docs/fundamentals/ai-optimization-guide
    title: Optimizing for generative AI features on Google Search
    author: organization:google
  - id: bing-robots
    resource: https://www.bing.com/webmasters/help/robots-meta-tags-and-attributes-that-bing-supports-5198d240
    title: Robots meta tags and attributes that Bing supports
    author: organization:microsoft
  - id: ietf-markdown-media-type
    resource: https://www.rfc-editor.org/rfc/rfc7763.html
    title: The text/markdown Media Type
    author: organization:ietf
  - id: ietf-web-linking
    resource: https://www.rfc-editor.org/rfc/rfc8288.html
    title: Web Linking
    author: organization:ietf
  - id: llms-txt-proposal
    resource: https://llmstxt.org/
    title: The llms.txt file proposal
    author: human:jeremy-howard
  - id: marketing-skills-seo-audit
    resource: https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/seo-audit/SKILL.md
    title: Marketing Skills SEO audit
    author: human:corey-haines
  - id: marketing-skills-ai-seo
    resource: https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/ai-seo/SKILL.md
    title: Marketing Skills AI SEO
    author: human:corey-haines
  - id: marketing-skills-schema
    resource: https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/schema/SKILL.md
    title: Marketing Skills schema markup
    author: human:corey-haines
  - id: openai-publishers-developers
    resource: https://help.openai.com/en/articles/12627856-publishers-and-developers-faq
    title: Publishers and Developers FAQ
    author: organization:openai
---

# Search foundations

Search work must make useful public content easier to discover and understand without misleading users or crawlers. It governs content purpose, crawl and index controls, canonicalization, rendering, structured data, internal discovery, and migrations.

Search platform behavior changes frequently. Revalidate implementation details against current primary documentation before shipping.

## Rules

### SEO-FOUNDATIONS-001 — Give every indexable URL a distinct purpose

**Level:** required
**Applies when:** A URL is intended to appear in organic search.

Define the audience need, intended query or discovery context, and action or understanding the page supports. Provide substantive, accurate content not better represented by another canonical URL.

**Why:** Near-duplicate or empty pages consume crawl and maintenance effort while giving users no distinct destination.

**Verify:**

- Compare the page with other indexable URLs targeting the same need.
- Confirm the primary content answers the defined need without relying on hidden or unavailable material.

**Exceptions:** Locale and format variants can share purpose when their alternate and canonical relationships are intentional.

### SEO-FOUNDATIONS-002 — Make indexability intentional

**Level:** required  
**Applies when:** Publishing, staging, duplicating, migrating, personalizing, or retiring public content.

Set a deliberate combination of access control, HTTP status, robots directives, canonical target, sitemap inclusion, and internal links. Do not use crawl controls as access control or as the sole method for removing an indexed URL.

**Why:** Crawl, indexing, canonicalization, and authorization solve different problems and can produce contradictory signals.

**Verify:**

- Fetch the URL as a client and crawler where available, and inspect status, headers, HTML directives, canonical, links, and rendered content.
- Confirm staging and private material require real authorization.

**Exceptions:** Temporary emergency removal can use a platform removal tool while the durable status, directive, or access fix is deployed.

### SEO-FOUNDATIONS-003 — Return truthful HTTP status codes

**Level:** required  
**Applies when:** Content is missing, moved, unavailable, restricted, deleted, or temporarily offline.

Return the status that describes the resource and use a redirect only when an appropriate destination exists. Avoid soft 404s, redirect chains, loops, blanket redirects, and error pages returning success.

**Why:** Users, crawlers, caches, monitoring, and link checkers use status semantics to decide what happened and what to do next.

**Verify:**

- Inspect headers for representative success, redirect, missing, gone, restricted, throttled, and outage cases.
- Follow redirects to the final relevant destination and confirm the chain is intentional.

**Exceptions:** Security-sensitive resources can use a less revealing client response when required by policy, while internal monitoring records the actual condition.

### SEO-FOUNDATIONS-004 — Keep canonical signals consistent

**Level:** required  
**Applies when:** Multiple URLs can expose identical or near-identical content.

Choose the intended canonical URL and align redirects, canonical annotations, sitemap inclusion, internal links, alternate-language annotations, and structured data with it.

**Why:** Conflicting signals leave search platforms to choose a representative URL and can split reporting or discovery across variants.

**Verify:**

- Compare every duplicate or variant with the declared canonical map.
- Confirm canonical targets return an indexable success response and do not redirect elsewhere.

**Exceptions:** Syndicated or cross-domain content can follow an approved distribution policy when the preferred source cannot control every signal.

### SEO-FOUNDATIONS-005 — Deliver essential meaning without interaction

**Level:** required  
**Applies when:** A page is intended for search discovery, sharing previews, feeds, or agent consumption.

Include primary content, document title, description, canonical information, headings, links, and essential structured meaning in delivered HTML or a reliably rendered equivalent. Do not require a click, scroll, consent to nonessential tracking, or client-only state change to reveal the main subject.

**Why:** Crawlers and other consumers may not execute every interaction or client behavior a user can.

**Verify:**

- Inspect the initial response and rendered result with scripts delayed or unavailable.
- Confirm the visible primary content and machine-readable metadata describe the same page.

**Exceptions:** Authenticated application content is outside indexable scope unless an intentional public representation exists.

### SEO-FOUNDATIONS-006 — Mark up only visible, accurate content

**Level:** required  
**Applies when:** Publishing schema.org or search-platform structured data.

Use the most specific truthful type supported by the visible page. Keep names, prices, availability, dates, ratings, authorship, and relationships consistent with what users can verify.

**Why:** Hidden or exaggerated markup misleads machine consumers and can produce incorrect search features.

**Verify:**

- Compare every material structured property with visible content and source data.
- Run syntax and platform validation, then inspect the rendered page; validator success alone is insufficient.

**Exceptions:** Machine-readable identifiers and technical relationships can be non-visible when they accurately describe visible content and platform rules allow them.

### SEO-FOUNDATIONS-007 — Preserve discovery during migrations

**Level:** required  
**Applies when:** URLs, domains, protocols, paths, rendering systems, templates, or information architecture change.

Inventory valuable URLs, map equivalent destinations one to one, preserve important content and internal paths, update canonical and alternate signals, and monitor crawl, indexing, traffic, and errors after launch.

**Why:** A migration can remove valid entry points or redirect users to irrelevant destinations even when the new site works in isolation.

**Verify:**

- Compare prelaunch inventory with the redirect and content map.
- Crawl old and new URL sets, inspect representative rendered pages, and track postlaunch status and discovery changes.
- Assign an owner and duration for monitoring and redirect retention.

**Exceptions:** Retired content with no relevant replacement should return its truthful terminal status instead of redirecting to a generic page.

### SEO-FOUNDATIONS-008 — Make titles, descriptions, headings, and links descriptive

**Level:** required  
**Applies when:** Publishing an indexable page or a page that links to one.

Use a distinct descriptive document title, an accurate summary, one clear page topic, semantic heading structure, and link text that explains the destination. Keep important pages reachable through ordinary crawlable links.

**Why:** These elements help users and machines understand a page before and after navigation.

**Verify:**

- Scan titles, headings, summaries, and links without surrounding layout.
- Crawl from expected entry points and confirm important destinations are discoverable without internal search or scripted interaction.

**Exceptions:** Repeated navigation labels can rely on their shared navigation context when the destination remains clear.

### SEO-FOUNDATIONS-009 — Control URL proliferation

**Level:** required  
**Applies when:** Filters, sorting, search, tracking parameters, pagination, calendars, or generated combinations can create many URLs.

Define which combinations deserve stable indexable URLs and how all others are linked, canonicalized, redirected, or excluded from crawl and indexing. Keep parameter behavior deterministic.

**Why:** Unbounded URL spaces waste crawl effort, duplicate content, and make canonical signals harder to maintain.

**Verify:**

- Enumerate or sample parameter combinations and inspect their status, canonical, robots behavior, and links.
- Confirm application navigation does not continuously generate new crawlable states.

**Exceptions:** Large deliberate catalogs can expose many URLs when each satisfies a distinct need and crawl capacity is monitored.

### SEO-FOUNDATIONS-010 — Measure qualified discovery and user value

**Level:** required  
**Applies when:** Evaluating search work or declaring a search migration complete.

Use qualified organic outcomes and user value alongside crawl and indexing signals. Segment material sources of demand, annotate releases, and account for seasonality, reporting latency, and brand demand where relevant.

**Why:** Rankings or impressions alone can rise while useful visits, conversions, or retained discovery decline.

**Verify:**

- Record baseline, release date, measurement window, affected URL set, and known reporting limitations.
- Connect technical indicators with representative landing-page and outcome behavior.

**Exceptions:** A new property without a baseline can use indexed coverage and qualified landing behavior while a comparison period develops.

### SEO-FOUNDATIONS-011 — Publish for a real audience, not ranking manipulation

**Level:** required  
**Applies when:** Creating, generating, consolidating, or materially revising indexable content.

Publish content because it serves an identified audience and site purpose. Add original knowledge, evidence, experience, tools, or synthesis appropriate to the topic. Do not mass-produce, paraphrase, cloak, expire, or refresh content primarily to capture queries or manipulate ranking systems.

**Why:** Search-oriented volume without distinct user value creates misleading or duplicative destinations and can violate search-platform spam policies.

**Verify:**

- Identify the intended audience, owner, purpose, source evidence, and distinct value for the page or page family.
- Compare generated and templated pages for substantive differences beyond keywords, locations, or reordered source material.
- Confirm visible content and crawler-visible content have the same material meaning.

**Exceptions:** Programmatically generated pages are allowed when each one accurately presents distinct data or functionality that satisfies a real user need and has quality controls at scale.

### SEO-FOUNDATIONS-012 — Map multilingual and regional variants explicitly

**Level:** required  
**Applies when:** Equivalent or closely related pages target different languages, scripts, or regions.

Give each variant a stable URL, correct document language, locale-appropriate content, self-consistent canonical signals, and reciprocal alternate relationships. Provide a useful fallback for unmatched locales and do not redirect users solely from an inferred location or language without a choice.

**Why:** Language and regional variants can be mistaken for duplicates or send users to the wrong currency, terms, language, or availability when their relationships are incomplete.

**Verify:**

- Crawl every variant set and confirm reciprocal `hreflang` or equivalent annotations, valid language and region codes, success responses, and self-canonical behavior.
- Compare translated primary content, navigation, structured data, and locale-specific claims.
- Test direct visits, shared links, and locale switching without relying on prior cookies.

**Exceptions:** A single language-neutral selector can act as the fallback when it is accessible, indexable as intended, and does not replace substantive localized destinations.

### SEO-FOUNDATIONS-013 — Measure machine access at the request boundary

**Level:** required
**Applies when:** Evaluating whether crawlers, search tools, or agents request public content.

Use origin, reverse-proxy, content-delivery-network, or equivalent request records as the primary observation of machine requests. Do not treat browser analytics as proof that a crawler did or did not fetch a resource. Record the observed user agent, source, URL, response, time, and relevant cache layer, while treating self-declared crawler identity as unverified until corroborated.

**Why:** Many machine clients do not execute browser analytics, and caches can answer requests before the origin sees them. User-agent strings can also be absent, changed, or spoofed.

**Verify:**

- Query the request boundary that can observe the declared delivery path and time window.
- Compare representative requests across the content-delivery network, origin, analytics, and platform tools without forcing unlike populations to reconcile.
- Confirm the evidence record excludes secrets and personal data and follows the applicable retention policy.

**Exceptions:** When request logs are unavailable, record the evidence gap and use provider crawl or inspection evidence without claiming complete access measurement.

### SEO-FOUNDATIONS-014 — Publish an explicit machine-readable route index

**Level:** required
**Applies when:** A site publishes more than one public informational page.

Publish a concise `llms.txt` route index at the site root or the most specific governed path. Name the site or section, describe its scope, and link to a complete inventory of public informational pages and their Markdown representations. The inventory can be the file itself or an explicitly linked machine-readable catalog. Advertise the applicable index from every covered page with `rel="describedby"` so clients do not have to guess its URL. Keep access control and crawler policy in their governing mechanisms; `llms.txt` is a discovery aid, not authorization, confidentiality, or proof of indexing.

**Why:** A curated route index reduces ambiguous path inference while preserving the canonical source and its access boundary.

**Verify:**

- Fetch the file at its declared URL and follow every listed resource without authentication, redirect ambiguity, or guessed suffixes where public access is intended.
- Diff the published informational URL inventory against `llms.txt` and its linked catalog; record every excluded URL class and reason.
- Compare names, descriptions, URLs, locale and version scope, and lifecycle state with the canonical site navigation, sitemap, and current published content.
- Inspect representative covered pages for an HTML `<link>` element or HTTP `Link` header that identifies the applicable `llms.txt` resource with `rel="describedby"`.
- Confirm omission from `llms.txt` does not expose or protect content and that no ranking or citation claim relies on the file alone.

**Exceptions:** A single public informational page can advertise its Markdown alternate directly without a separate route index. Private, personalized, transactional, and binary resources stay outside the public inventory.

### SEO-FOUNDATIONS-015 — Offer equivalent Markdown representations explicitly

**Level:** required
**Applies when:** Publishing a public informational page whose essential meaning can be represented as text.

Serve an accurate Markdown representation of every applicable page at a stable, explicitly advertised URL or through HTTP content negotiation. Generate HTML and Markdown from one canonical content source or enforce bidirectional parity. Identify the Markdown resource from the HTML response with `rel="alternate"` and `type="text/markdown"`; identify the HTML canonical from a separately addressed Markdown response. When one URL varies by `Accept`, honor media-type quality values, return the selected `Content-Type`, send `Vary: Accept`, and preserve a stable canonical identity. Do not require clients to invent `.md`, `.txt`, query, or API paths.

**Why:** Explicit representations let tools request usable content without inventing `.md` paths or extracting it from presentation markup.

**Verify:**

- Build a page inventory from routes, content records, locales, versions, and generated page families; require one Markdown URL or negotiated representation for every applicable page.
- Request each representation directly and test `Accept: text/markdown`, `Accept: text/html`, weighted preferences, wildcards, unsupported media types, `HEAD`, conditional requests, and shared-cache reuse.
- Inspect `Content-Type`, Markdown `variant` when used, `Vary`, `Link`, canonical or `Content-Location`, `ETag` or modification metadata, cache, status, charset, language, and redirect behavior.
- Compare titles, headings, body meaning, links, claims, dates, prices, authorship, structured facts, qualifications, locale, version, and access boundaries across representations after a source change.
- Fail the release when an applicable page has no advertised Markdown route, returns stale or materially different content, or can only be found by guessing a suffix.

**Exceptions:** Private, personalized, transactional, binary, streaming, or interaction-only resources can omit Markdown when a text representation would be incomplete, unsafe, or misleading. Record each excluded route class and provide an accurate public summary or documented interface when practical. A large page count or JavaScript implementation is not an exception.

### SEO-FOUNDATIONS-016 — Make public widget meaning addressable without JavaScript

**Level:** required
**Applies when:** A JavaScript widget contains public facts, results, options, or navigation that a person or agent needs to evaluate or cite.

Expose the widget's essential inputs, outputs, states, and source basis through server-visible content, stable URLs, or a documented machine-readable interface. Keep the human and machine representations materially consistent. Do not serve richer or different claims only to crawlers.

**Why:** A client that cannot execute the widget otherwise receives an empty shell, cannot link to a result, or must guess an undocumented endpoint.

**Verify:**

- Inspect the initial response with scripts unavailable and exercise representative widget states with scripts enabled.
- Follow shared result URLs and documented interfaces from a new session without hidden client state.
- Compare visible and machine-readable claims, values, qualifications, and authorization behavior.

**Exceptions:** A widget can require JavaScript when interaction is the product and no meaningful static result exists, provided its purpose, requirements, and fallback are visible without executing it.

### SEO-FOUNDATIONS-017 — Preserve governance semantics in machine representations

**Level:** required
**Applies when:** A Markdown, structured-data, feed, API, or agent-oriented representation carries policy, standards, legal, safety, product, pricing, or other decision-governing content.

Preserve the metadata and relationships a reader needs to interpret authority and applicability. Include stable identifiers, document and rule status, requirement level, scope, conditions, dependencies, exceptions, review or effective dates, source provenance, and canonical identity where the source provides them. Do not flatten a governed document into prose that makes a draft appear active, a recommendation appear required, or an informative source appear normative.

**Why:** An agent can retrieve the correct words and still make the wrong decision when the alternate representation removes the metadata that controls how those words apply.

**Verify:**

- Compare each decision-bearing field and relationship across the canonical source, HTML, Markdown, structured data, catalogs, search indexes, and agent context.
- Ask representative readers and agents to identify the controlling document, rule ID, level, condition, dependency, exception path, review state, and citation from the machine representation alone.
- Confirm retired, superseded, draft, stale, and conflicting material cannot silently outrank current governing material.

**Exceptions:** A short discovery index can summarize content when it links to the governing source and clearly states that the summary does not replace it.

### SEO-FOUNDATIONS-018 — Test discovery through the intended decision

**Level:** required
**Applies when:** Machine-readable routes are published so an agent can answer, recommend, or act from the site's content.

Test the complete path from a realistic task to the correct source selection and bounded decision. Do not treat a successful fetch, valid `llms.txt`, parsed Markdown, or schema validation as proof that an agent can apply the content correctly. Include positive, negative, ambiguous, stale, conflicting, and out-of-scope tasks, and evaluate both required retrieval and harmful over-retrieval.

**Why:** Discovery infrastructure succeeds only when it helps the intended reader reach the correct decision without inventing authority, skipping dependencies, or using irrelevant material.

**Verify:**

- Start representative tasks with only the advertised route index and public representations available.
- Record selected files and rules, rejected alternatives, dependency traversal, citations, final answer or action, latency, request count, failures, and unsupported assumptions.
- Repeat variable agent trials under `FND-EVIDENCE-008` and validate judgment-based grading under `FND-EVIDENCE-010`.
- Retest after route, content, status, redirect, locale, version, or rendering changes.

**Exceptions:** A deterministic machine client can use one successful run when its routing and output are fully specified and determinism is verified.

### SEO-FOUNDATIONS-019 — Govern crawler purposes separately

**Level:** required
**Applies when:** A publisher changes crawler access, indexing, model-training, user-request, or agent-interaction policy.

Classify each documented client by purpose and current provider semantics before changing access. Decide search discovery, user-initiated retrieval, training, preview, and automated action independently where the provider exposes separate controls. Align `robots.txt`, page-level indexing directives, authentication, network controls, terms, privacy decisions, and monitoring with that policy. Do not infer a client's purpose from a brand name or copy one provider's user-agent rules to another.

**Why:** Providers can use different clients and controls for search, training, and user-directed access. A broad allow or block can create an unintended training, discovery, privacy, or availability outcome.

**Verify:**

- Record the provider, exact client identifier, documented purpose, governing source and review date, allowed paths, denied paths, network requirements, owner, and expected effect.
- Exercise allowed and denied requests at the content-delivery network and origin, then inspect page-level directives and provider tools where available.
- Reconcile observed request logs with the policy without treating a self-declared user agent as authenticated identity.
- Revalidate volatile provider semantics on the source register's schedule and after a provider announces a crawler or policy change.

**Exceptions:** Undocumented or unverifiable clients can use a conservative default under the site's security, privacy, and availability policy; record the uncertainty rather than attributing a purpose.

## Guidance

Design for users first, then expose the same truthful meaning to machines. Do not create pages solely to vary keywords, locations, or parameters when the underlying user need and content are unchanged.

Treat canonical annotations as consolidation signals, not redirects or access controls. Keep sitemaps limited to preferred indexable URLs. Use permanent redirects for durable moves and temporary redirects only for genuinely temporary destinations.

Serve `robots.txt` according to RFC 9309 and test its successful, unavailable, unreachable, and redirect behavior. A crawler directive is a request to conforming automated clients, not authorization or confidentiality.

Monitor by page type and URL cohort. Sitewide averages can hide a failed template, locale, directory, or migration segment.

For a separately addressed representation, use explicit links in both directions. A typical HTML response advertises both the Markdown alternate and the covering route index:

```http
Link: </guides/example.md>; rel="alternate"; type="text/markdown"
Link: </llms.txt>; rel="describedby"; type="text/markdown"
```

For same-URL negotiation, prefer HTML when a browser sends no useful preference and return Markdown only when `Accept` selects `text/markdown`. Send `Vary: Accept` so a shared cache does not serve Markdown to an HTML client or HTML to a Markdown client. Return `406 Not Acceptable` only when no available representation satisfies the request. Keep authorization, locale, and version selection independent and explicit; do not let a Markdown request bypass them.

Generate Markdown from the same content model as HTML. Preserve tables, code, equations, image alternatives, citations, warnings, and link destinations in a form that retains their meaning. Replace presentation-only controls with a short description, and link to the documented interface for interactive behavior. Do not flatten a page into text that removes a price condition, safety warning, legal qualification, source, or update date.

For a standards or policy library, optimize for correct application rather than maximum ingestion. The route index should teach the reader how to select a profile, load required dependencies, activate conditional routes, apply requirement levels, resolve conflicts, record exceptions, and cite stable rule IDs. A full-text export without those relationships is less useful than a smaller governed catalog that preserves them.

Treat third-party SEO and agent-discovery guidance as informative until its factual claims are supported by current primary evidence. Google states that `llms.txt`, Markdown alternatives, and special AI markup do not affect visibility or ranking in Google Search. A publisher can still use them for other agents and direct retrieval, but must measure that purpose separately and must not describe Google indexing as evidence that the convention works.

## Examples

### Retired page

Non-compliant: Every removed article redirects to the homepage and the homepage returns `200`.

Compliant: An article with a direct replacement redirects once to that replacement. An article with no relevant replacement returns `410` or `404` with useful navigation.

### Filtered URLs

Non-compliant: Every combination of color, size, sort order, tracking code, and view mode is crawlable and self-canonical.

Compliant: Only curated category combinations with distinct demand and content are indexable; sort and tracking variants resolve to the intended canonical state and are not linked as separate destinations.

## Sources

- Google, [Crawling and indexing](https://developers.google.com/search/docs/crawling-indexing), Search Central documentation. Last updated December 10, 2025; reviewed August 13, 2026.
- Google, [How to specify a canonical URL](https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls), Search Central documentation. Reviewed August 13, 2026.
- Google, [Redirects and Google Search](https://developers.google.com/search/docs/crawling-indexing/301-redirects), Search Central documentation. Reviewed August 13, 2026.
- Internet Engineering Task Force, [RFC 9110: HTTP Semantics](https://www.rfc-editor.org/rfc/rfc9110.html), June 2022. Reviewed August 13, 2026.
- Internet Engineering Task Force, [RFC 9309: Robots Exclusion Protocol](https://www.rfc-editor.org/rfc/rfc9309.html), September 2022. Reviewed August 13, 2026.
- Google, [Creating helpful, reliable, people-first content](https://developers.google.com/search/docs/fundamentals/creating-helpful-content), Search Central documentation. Reviewed August 13, 2026.
- Google, [Understand the JavaScript SEO basics](https://developers.google.com/search/docs/crawling-indexing/javascript/javascript-seo-basics), Search Central documentation. Reviewed August 13, 2026.
- Google, [Tell Google about localized versions of your page](https://developers.google.com/search/docs/specialty/international/localized-versions), Search Central documentation, last updated December 22, 2025. Reviewed August 13, 2026.
- Google, [Introduction to structured data markup in Google Search](https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data), Search Central documentation. Reviewed August 13, 2026.
- Google, [Optimizing for generative AI features on Google Search](https://developers.google.com/search/docs/fundamentals/ai-optimization-guide), Search Central documentation. Reviewed September 1, 2026. Google states that it ignores `llms.txt` for Search visibility and ranking.
- Microsoft, [Robots meta tags and attributes that Bing supports](https://www.bing.com/webmasters/help/robots-meta-tags-and-attributes-that-bing-supports-5198d240), Bing Webmaster Tools. Reviewed August 13, 2026.
- Internet Engineering Task Force, [RFC 7763: The `text/markdown` Media Type](https://www.rfc-editor.org/rfc/rfc7763.html), March 2016. Reviewed September 1, 2026.
- Internet Engineering Task Force, [RFC 8288: Web Linking](https://www.rfc-editor.org/rfc/rfc8288.html), October 2017. Reviewed September 1, 2026.
- Jeremy Howard, [The `llms.txt` file proposal](https://llmstxt.org/), version 2, modified August 10, 2026. Reviewed September 1, 2026. This is an emerging proposal, not a ratified web standard or ranking signal.
- Corey Haines and contributors, Marketing Skills [`seo-audit`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/seo-audit/SKILL.md) version 2.0.0, [`ai-seo`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/ai-seo/SKILL.md) version 2.2.0, and [`schema`](https://github.com/coreyhaines31/marketingskills/blob/e55de886fe7580ec75cdb7ded5092b33f7d4ed58/skills/schema/SKILL.md) version 2.0.0, commit `e55de886`, reviewed September 1, 2026. These MIT-licensed skills are informative audit procedures; primary platform and web specifications remain authoritative.
- OpenAI, [Publishers and Developers FAQ](https://help.openai.com/en/articles/12627856-publishers-and-developers-faq), reviewed September 1, 2026. OpenAI documents separate search-discovery and potential-training controls; apply this source only to OpenAI clients and revalidate current identifiers and semantics before use.
