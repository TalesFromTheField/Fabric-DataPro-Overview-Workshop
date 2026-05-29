---
name: check-flow
description: >
  Audit the workshop content structure against the documented methodology.
  Use this skill when a user says "check flow", "check structure",
  "audit modules", "validate content", "content audit", "check numbering",
  "check headings", or when reviewing content for consistency before publishing.
---

# Check Flow

This skill validates that all workshop modules follow the content methodology
documented in `.github/copilot-instructions.md`. It checks structural
consistency, numbering, heading format, required sections, and icon usage.

## Scope

All Markdown files under `fabricoverview/` (modules 00–09).

## Checks

### 1. Module Structure

Every module file must contain these five parts in order:

1. **Header block**
   - `![](../graphics/microsoftlogo.png)` (Microsoft logo)
   - `# Workshop: Microsoft Fabric Overview for the Data Professional`
   - `#### <i>A Microsoft Workshop</i>`
   - Grey separator line

2. **Module overview**
   - `<h2>` heading with `textbubble.png` icon
   - Module number in the heading must match the filename number
     (e.g., file `09 - ...` must NOT have `<h2>06 - ...`)
   - Table of contents as `<dl>`/`<dt>` definition list with anchor links
   - Grey separator line

3. **Sections** (one or more)
   - See Section Structure checks below

4. **"For Further Study"**
   - `owl.png` icon present
   - `<b>For Further Study</b>` heading
   - `<ul>`/`<li>` list of reference links

5. **Module closing**
   - Congratulations message
   - Next-module link (or workshop-completion message for the final module)

**Flag**: Missing required parts, parts out of order, wrong module number.

### 2. Section Structure

Each numbered section must follow this pattern:

1. **Section heading** — `<h2>` tag with:
   - An `id` attribute matching the section number
   - The `pencil2.png` icon image
   - Section number in `{module}.{section}` format

2. **Content** — text, images, code blocks, etc.

3. **Activities** (zero or more) with:
   - `point1.png` icon
   - `<b>Activity: Title</b>` or `<b>Self-Guided Activity: Title</b>`
   - `checkmark.png` icon with `<b>Steps</b>` marker

4. **Separator** — `<p style="border-bottom: 1px solid lightgrey;"></p>`

**Flag**: Sections using Markdown `##` instead of HTML `<h2>`, missing icons,
missing separators between sections, activities without Steps markers.

### 3. Section Numbering

- Sections must use `{module}.{section}` numbering (e.g., `3.1`, `3.2`).
- Section numbers must be sequential with no gaps (e.g., `2.7` then `2.9`
  with no `2.8` is an error).
- The module number in the section prefix must match the module file number.
- The heading `id` attribute must match the section number.

**Flag**: Gaps in numbering, mismatched module prefixes, id/text mismatches.

### 4. TOC-to-Heading Alignment

- Every entry in the module's `<dl>` table of contents must have a
  corresponding `<h2>` heading with a matching anchor `id`.
- Every numbered `<h2>` heading must appear in the TOC.
- Section titles in the TOC and the heading should match (minor wording
  differences are OK, but the section number must match exactly).

**Flag**: TOC entries without matching headings, headings not in the TOC,
mismatched section numbers.

### 5. Heading Format Consistency

All section headings must use HTML `<h2>` tags with the `pencil2.png` icon,
**not** Markdown `##` or `#` syntax. This is the established convention per
the content methodology.

Acceptable:
```html
<h2 id="3.1"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">3.1 Section Title</h2>
```

Not acceptable:
```markdown
## 3.1 Section Title
# 03.1 - Section Title
```

**Flag**: Any section heading using Markdown heading syntax instead of `<h2>`.

### 6. Icon Usage

Verify each icon is used only in its designated context:

| Icon | Expected context |
|------|-----------------|
| `microsoftlogo.png` | Header block only |
| `textbubble.png` | Module overview heading only |
| `pencil2.png` | Section headings only |
| `point1.png` | Activity headings only |
| `checkmark.png` | Steps markers within activities only |
| `owl.png` | "For Further Study" section only |

**Flag**: Icons used outside their expected context, or expected icons missing
from their required context.

### 7. Cross-Module Consistency

- Module filenames follow `XX - Title.md` with sequential numbering 00–09.
- Each module (except 00 and the final one) ends with a link to the next
  module.
- The next-module link points to the correct file.

## Process

### Step 1: Parse

Read each module file and extract:
- Header block elements
- Module overview heading and TOC entries
- All `<h2>` headings with their IDs, icons, and text
- Activity blocks with their icons and Steps markers
- "For Further Study" section
- Closing section with next-module link
- All icon `src` references

### Step 2: Validate

Run each check category above, collecting issues as:
- **Error**: Violates the methodology (wrong numbering, missing required
  section, wrong icon).
- **Warning**: Minor inconsistency (slight title mismatch between TOC and
  heading, missing optional element).

### Step 3: Report

Present findings organised by module:
```
Module 02 - Desktop Tools:
  ERROR   Section numbering gap: 2.7 → 2.9 (2.8 missing)
  ERROR   Heading id="2.9" but TOC lists "2.8"
  WARNING TOC title "Using Storage Explorer" vs heading "Using Azure Storage Explorer"

Module 07 - Copilots & AI Skills:
  ERROR   Section 7.1 uses Markdown # instead of HTML <h2>

Module 09 - Bonus:
  ERROR   Module heading says "06" but file is module 09
```

Followed by a summary:
- Total modules checked
- Total errors and warnings
- Modules with no issues

### Step 4: Fix (if requested)

If the user asks to fix the issues:
- Renumber sections to fill gaps.
- Convert Markdown headings to HTML `<h2>` with proper icons and IDs.
- Correct module numbers in headings.
- Align TOC entries with headings.
- Add missing required sections or icons.

Always confirm structural changes with the user before applying, since
renumbering sections may affect cross-references from other modules or
external links.

## Output

A structured report listing all issues found, categorised by severity and
module. If fixes were applied, include a summary of changes made.
