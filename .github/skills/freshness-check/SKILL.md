---
name: freshness-check
description: >
  Check whether workshop content is still current against Microsoft Learn
  documentation. Use this skill when a user says "check freshness", "is this
  up to date", "content freshness check", "before workshop delivery",
  "quarterly review", or after Microsoft announces Fabric updates.
---

# Content Freshness Check

This skill audits the Microsoft Fabric workshop content against current
Microsoft Learn documentation to identify stale claims, renamed services,
preview/GA drift, deprecated guidance, and newly available capabilities.

## Scope

All module Markdown files under `fabricoverview/` (modules 00–09).

## When to Invoke

- When asked to check whether content is up to date
- Before each workshop delivery
- As part of a quarterly maintenance review
- After Microsoft announces Fabric updates, renames, GA releases, previews,
  or retirements

## Procedure

### Step 1: Extract Microsoft Learn links

For each module file:

- Extract all `learn.microsoft.com` links from Markdown links, HTML `href`
  attributes, and the "For Further Study" section.
- Record: module, section heading, line number, link text, and URL.
- Keep inline references and activity/tutorial links separate so broken lab
  instructions are easy to spot.

### Step 2: Check each linked page

Fetch every linked Microsoft Learn page and verify:

- Does the page still exist and return **HTTP 200**?
- Does the page show a **retired**, **deprecated**, or **preview** banner?
- What is the current article title?
- What is the article's **last-modified** date?
- How does that last-modified date compare with the module's **last git commit
  date**?
- Has the page topic shifted enough that the module's reference now points to
  a different concept, workflow, or product area?

If the URL redirects, record the final canonical URL and decide whether the
module should be updated even if the destination still works.

### Step 3: Extract key Fabric feature claims from the module

Read the module content and extract specific claims that may age quickly, such
as:

- Statements that a feature is in **preview** or **generally available**
- Statements about what a workload supports, does not support, or integrates
  with
- Service names, capability names, SKU/licensing references, and setup flows
- Lists of supported sources, targets, databases, connectors, or experiences
- Architecture guidance that depends on current product naming or positioning

Record each claim with its module and section so it can be verified later.

### Step 4: Cross-reference claims against current Microsoft Learn content

Search current Microsoft Fabric documentation on Microsoft Learn and verify:

- Features described as **preview** that are now **GA** (or vice versa)
- Capabilities that have been **renamed**
  (for example, **Synapse Real-Time Analytics** → **Real-Time Intelligence**)
- **New features or capabilities** that are now important but not yet covered
- **Deprecated or retired features** that the workshop still presents as current

Prefer Microsoft Learn as the source of truth. Do not mark a claim as stale
based only on an older URL — verify whether the actual product guidance has
changed.

### Step 5: Check for outdated terminology

Scan the modules for outdated product naming, including at minimum:

- `Synapse Real-Time Analytics` → `Real-Time Intelligence`
- `Power BI datasets` → `semantic models`
- `Dataflow Gen1` vs `Dataflow Gen2`
- Other known Microsoft Fabric or Power BI rebranding found in current Learn
  documentation

Flag old terminology even when the surrounding explanation is still broadly
correct.

## Known Fabric Evolution Patterns

| Old Term | Current Term | When Changed |
|----------|--------------|--------------|
| Synapse Real-Time Analytics | Real-Time Intelligence | 2024 |
| Power BI datasets | Semantic models | 2023 |
| Dataflow Gen1 | Dataflow Gen1 (deprecated path) | 2024 |
| Azure Synapse Link for Cosmos DB | Mirroring for Cosmos DB | 2024 |

Use this table as a starting point, not a substitute for checking current
Microsoft Learn documentation.

## Report Format

Present results **module by module**. Use these severities:

- **STALE** — content contradicts current Microsoft Learn documentation
- **OUTDATED TERM** — old naming or terminology is used
- **AGING** — linked article or related Learn guidance was updated after the
  module's last git update, suggesting the module should be reviewed
- **INFO** — new features, capabilities, or guidance are available but the
  existing content is not necessarily wrong

For each finding, include:

- **Module**
- **Section**
- **Severity**
- **Specific claim** or referenced link
- **Current state** from Microsoft Learn
- **Recommended update**

Example format:

```
Module 06 - Real-Time Intelligence:
  OUTDATED TERM  Section 6.1
    Specific claim: "Synapse Real-Time Analytics provides..."
    Current state: Microsoft Learn now uses "Real-Time Intelligence"
    Recommended update: Rename the workload throughout the section and verify
    screenshots/tutorial wording.

  AGING  Section 6.3
    Specific claim: Link to Learn article updated 2025-02-14, module last
    changed 2024-09-08
    Current state: Article includes new eventstream guidance not covered here
    Recommended update: Review this section before delivery.
```

## Tools to Use

- **Microsoft Learn MCP server** — search current Fabric documentation and read
  authoritative Microsoft Learn articles
- **Fetch MCP server** — verify linked pages, redirects, page availability, and
  visible banners/metadata
- **GitHub MCP server** — inspect module history and compare article freshness
  against the module's last git commit date

## Recommended Cadence

Run this check before each workshop delivery and at least quarterly for ongoing
maintenance.
