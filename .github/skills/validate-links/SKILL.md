---
name: validate-links
description: >
  Scan all workshop content for broken, malformed, or outdated links and fix
  them. Use this skill when a user says "check links", "validate links",
  "broken links", "fix links", "link audit", "dead links", or when updating
  content after Microsoft reorganises their documentation.
---

# Validate Links

This skill audits every link in the workshop content, identifies broken ones,
researches correct replacements, verifies them, and applies fixes.

## Scope

Scan all Markdown files under `fabricoverview/` and `README.md`.

## Link Types to Check

### 1. External URLs (http/https)

- Fetch each URL and record the HTTP status code (follow redirects).
- **Broken**: 404, 410, or connection failures.
- **Blocked**: 403 — may be geo-restricted or removed; flag for manual review.
- **Malformed**: Bad URL schemes (`hhttps://`), truncated URLs, double slashes
  in paths, or obviously incomplete URLs.
- **Redirected**: 301/302 — note the final destination; update the link to the
  canonical URL so readers don't go through redirect chains.

### 2. Local file references (relative paths)

- Resolve relative to the file that contains the link.
- Verify the target file or image exists on disk.
- Common pattern: `../graphics/*.png` for images.

### 3. Anchor links (starting with `#`)

- Note them but do not HTTP-check them.
- Optionally verify that the target anchor ID exists in the same file.

## Process

### Step 1: Extract

Read each file and extract every link from:
- Markdown links: `[text](url)`
- HTML href attributes: `href="url"`
- HTML src attributes: `src="url"`

Record: source file, line number, link text, URL, link type.

### Step 2: Check

- **External URLs**: Use `curl` (or equivalent) with a 10-second timeout,
  following redirects, to get the final HTTP status code. Run in batches to
  avoid rate limiting.
- **Local paths**: Check if the file exists relative to the source file.
- **Anchors**: Optionally verify the `id` attribute exists in the same file.

### Step 3: Report

Present a summary organised by source file:
- Each broken/malformed link with its status code or error.
- Total links checked, broken count, redirect count.
- Categorise: Microsoft Learn 404s, blog 403s, malformed URLs, missing local
  files.

### Step 4: Research replacements

For each broken Microsoft Learn link:

1. **Check for redirects first** — fetch the old URL without following
   redirects to see if Microsoft set up a redirect header. If so, use the
   redirect target.
2. **Search for the new URL** — use web search with the page topic and
   `site:learn.microsoft.com` to find the replacement page.
3. **Verify the replacement** — fetch the candidate URL and confirm it returns
   HTTP 200.
4. **Confirm content match** — fetch the page title and verify it covers the
   same topic as the original link text. Do not assume a URL is correct just
   because it returns 200.

For non-Microsoft links (blogs, third-party), flag them for the author to
decide whether to find a replacement, remove the link, or add an archive.org
fallback.

### Step 5: Apply fixes

- Replace broken URLs with verified replacements in the source files.
- Fix malformed URLs (typos, truncations, merged table rows).
- Update redirected URLs to their final canonical form.

### Step 6: Verify

Re-run the link check on modified files to confirm all fixes are valid.

## Common Microsoft Learn URL Migrations

Based on past experience with this repository, Microsoft has reorganised:

| Old path pattern | New path pattern |
|---|---|
| `fabric/data-warehouse/mirroring-*` | `fabric/mirroring/*` |
| `fabric/database/troubleshoot-mirroring-*` | `fabric/mirroring/*-troubleshoot` |
| `fabric/database/faq-*` | `fabric/mirroring/*-mirroring-faq` |
| `fabric/get-started/copilot-*` | `fabric/real-time-intelligence/copilot-*` |
| `fabric/enterprise/metrics-app-*-page` | `fabric/enterprise/metrics-app-*` (renamed) |

These patterns are a starting point — always verify rather than blindly
applying them.

## Output

Commit fixes with a message summarising:
- How many links were checked and how many were broken.
- Which files were modified.
- That all replacement URLs were verified with HTTP 200 and content-matched.
