---
name: update-screenshots
description: >
  Audit workshop images and screenshots across the Fabric workshop modules and
  README. Use this skill whenever the user asks to check screenshots, audit
  images, validate image links, find broken Microsoft Learn media URLs, clean up
  unused graphics, review accessibility, or verify YouTube thumbnails — even if
  they do not mention this skill by name. Triggers: screenshot audit, image
  audit, broken images, missing alt text, orphaned graphics, stale Learn media,
  YouTube thumbnail check.
---

# Image and Screenshot Audit

This skill audits local and external images used by the workshop and reports
broken, missing, stale, unused, and non-compliant image references.

## When to Invoke

Run this skill:
- Periodically as part of workshop maintenance
- After Microsoft Learn reorganisations or content refreshes
- Before workshop delivery or publication
- When checking accessibility and presentation consistency
- When updating screenshots, thumbnails, or local graphics

## Scope

Scan:
- All module files under `fabricoverview/` (`00`-`09`)
- `README.md`
- Local image files under `graphics/`

Check image references from:
- Markdown image syntax: `![alt](url)`
- HTML image tags: `<img ... src="...">`
- Clickable thumbnails such as `<a href="...youtube..."><img src="..."></a>`

## What to Check

### 1. Broken external image URLs

Check every external image URL, including:
- `learn.microsoft.com`
- `github.com/.../assets/...`
- `raw.githubusercontent.com`
- `img.youtube.com`
- Other externally hosted screenshots or diagrams

Flag as:
- **BROKEN** when the image returns `404`, `410`, connection failure, or other
  clear failure to load
- **BROKEN** for `403` when the image is expected to be publicly renderable in a
  workshop and is no longer accessible
- Note unexpected redirects or rate-limited responses in the finding details so
  they can be reviewed during remediation

### 2. Orphaned local images

Find files under `graphics/` that are not referenced by any file in
`fabricoverview/` or `README.md`.

Flag each unused file as **ORPHANED**.

### 3. Missing local images

Resolve local references such as `../graphics/FILE` relative to the source file.
If the target file does not exist on disk, flag it as **MISSING**.

### 4. Stale Microsoft Learn images

Pay special attention to Microsoft Learn media URLs such as:
- `https://learn.microsoft.com/.../media/...`
- `https://learn.microsoft.com/en-us/.../media/...`
- `https://learn.microsoft.com/azure/.../media/...`
- `https://learn.microsoft.com/fabric/.../media/...`

These often break when articles move to new folders but the image path is not
updated. Treat moved or missing Learn media as **BROKEN** and note that the
source article may have been reorganised.

### 5. Missing alt text

For every image, check whether alt text is present and meaningful.

Flag as **ACCESSIBILITY** when:
- Markdown uses empty alt text for content images: `![](...)`
- HTML `<img>` is missing an `alt` attribute
- Alt text is only a filename or a generic label such as `image`, `screenshot`,
  or `thumbnail` with no descriptive value

Allow decorative icons to be empty only when they are clearly decorative and do
not carry workshop meaning.

### 6. Missing height attributes

Per repository convention, workshop images should include a `height` attribute.

Flag as **STYLE** when an HTML `<img>` tag or embedded thumbnail lacks a
`height` attribute. For Markdown image syntax, note that sizing cannot be set
there and recommend converting to HTML if consistent sizing is required.

### 7. YouTube thumbnail validity

Check YouTube thumbnail URLs such as:
- `https://img.youtube.com/vi/VIDEO_ID/0.jpg`

Also inspect the linked watch URL when present:
- `https://www.youtube.com/watch?v=VIDEO_ID`

Flag as **BROKEN** when:
- The thumbnail URL does not resolve
- The paired YouTube watch URL is invalid, unavailable, or clearly no longer
  public
- The thumbnail and watch URL use different video IDs

## Process

### Step 1: Inventory references

Read each module and `README.md`, then extract:
- Source file path and line number
- Image syntax type (Markdown or HTML)
- `src` or URL
- Alt text
- `height` attribute if present
- Whether the image is local, Microsoft Learn, GitHub-hosted, or YouTube

### Step 2: Validate local images

- Resolve every `../graphics/...` path relative to its source file
- Confirm the target file exists
- Build a set of all referenced local images
- Compare that set against the files present in `graphics/`

Report:
- Missing referenced files as **MISSING**
- Unreferenced files as **ORPHANED**

### Step 3: Validate external images

- Fetch external image URLs with redirects enabled
- Record final URL, HTTP status, and any redirect chain
- Treat `404`, `410`, DNS failures, TLS failures, and inaccessible `403`
  responses as **BROKEN**
- For Microsoft Learn `.../media/...` URLs, note when the failure pattern
  suggests documentation reorganisation

### Step 4: Check accessibility and style

For each image reference:
- Verify meaningful alt text exists unless the image is purely decorative
- Verify `height` is present where the repo convention expects it
- Flag missing or weak accessibility metadata as **ACCESSIBILITY**
- Flag missing sizing metadata as **STYLE**

### Step 5: Check YouTube thumbnails

- Extract the video ID from both thumbnail and watch URLs
- Verify the IDs match
- Confirm the thumbnail URL resolves
- If possible, verify the watch URL still resolves to a public video page

### Step 6: Visually verify high-risk findings

If Playwright MCP is available, use it for visual spot checks on:
- Microsoft Learn pages where the image may have moved
- GitHub asset URLs that technically load but may render an error page
- Workshop pages after image replacements

Use visual verification for ambiguous cases; use HTTP checks for the main audit.

### Step 7: Remediate and re-check

After updating references or removing unused files:
- Re-run the audit on changed files
- Confirm each previous finding is resolved
- Confirm no new missing or orphaned images were introduced

## Report Format

Present findings grouped by source file, using these severity levels:

```text
README.md
  BROKEN        Line 42   https://learn.microsoft.com/.../media/diagram.png
                Returns 404 after redirect; likely moved during Learn reorganisation.

fabricoverview/03 - Data Warehouse and Data Integration.md
  MISSING       Line 118  ../graphics/pipeline-overview.png
                Referenced file does not exist.

fabricoverview/05 - Introduction to Mirroring in Fabric.md
  ACCESSIBILITY Line 77   Missing meaningful alt text for Microsoft Learn screenshot.
  STYLE         Line 77   <img> tag is missing a height attribute.

graphics/
  ORPHANED              old-warehouse-diagram.png
                File is not referenced by any module or the README.
```

Finish with a summary:
- Total files scanned
- Total image references checked
- BROKEN count
- MISSING count
- ORPHANED count
- ACCESSIBILITY count
- STYLE count
- Files with no issues

## Known Microsoft Learn Image Patterns That Tend to Break

Watch closely for these patterns during Microsoft Learn reorganisations:

| Pattern | Risk |
|---|---|
| `learn.microsoft.com/.../media/<file>` | Article folder moved but media path left behind |
| `learn.microsoft.com/en-us/fabric/.../media/<file>` | Fabric article renamed or relocated |
| `learn.microsoft.com/en-us/azure/.../media/<file>` | Azure article split or moved to a new product area |
| `learn.microsoft.com/.../articles/.../media/<file>` | Legacy article path replaced by a shorter route |
| `learn.microsoft.com/.../get-started/.../media/<file>` | Introductory content reorganised under a different learning path |

Do not assume a nearby article is the correct replacement image. Verify the
image actually renders and still matches the workshop content.

## Cleanup Instructions for Orphaned Images

When removing orphaned files:

1. Re-run the reference search to confirm the file is truly unused.
2. Check `README.md` and all module files, not just the module you edited.
3. Remove only files with zero legitimate references.
4. If unsure whether an image is intentionally staged for future content, leave
   it in place and report it for author review instead of deleting it.
5. After deletion, re-run the orphaned-image check to confirm the `graphics/`
   folder is clean.

## Output

Provide:
- A file-by-file findings report using the severity labels above
- A short summary of the most urgent image issues
- Recommended fixes for stale Learn media, missing local files, and orphaned
  graphics
- If changes were applied, a note confirming the audit was re-run successfully
