---
name: generate-module
description: >
  Scaffold a new workshop module that follows this repository's Microsoft Fabric
  workshop methodology exactly. Use this skill when a user asks to create,
  scaffold, draft, or add a new module under `fabricoverview/`, or when they
  provide a module number, module title, and section list for new workshop
  content.
---

# Generate Workshop Module

This skill scaffolds a new module file under `fabricoverview/` using the exact
hybrid HTML/Markdown structure used by this repository.

## When to invoke

Invoke `generate-module` when the user asks to:

- create a new workshop module
- scaffold a new module in `fabricoverview/`
- add a numbered module such as `10 - New Topic.md`
- generate a starter module from a title and section outline
- insert a new module and update the surrounding navigation

## Required inputs

Provide these parameters before generating the module:

- `module_number` — two-digit module number for the file and overview heading
  (for example, `10`)
- `module_title` — full module title
- `section_titles` — ordered list of section titles

## Optional inputs

- `module_description` — brief introductory paragraph for the module overview
- `activity_descriptions` — optional activity details keyed to each section;
  each activity should include:
  - `activity_type` — `Activity` or `Self-Guided Activity`
  - `activity_title`
  - `activity_description`
  - `steps` — ordered or unordered step text
- `further_study_links` — optional list of Microsoft Learn links for the
  "For Further Study" section
- `next_module_link` — optional closing link if the next module already exists

## Generation rules

1. Create the file at:
   - `fabricoverview/{{MODULE_NUMBER}} - {{MODULE_TITLE}}.md`
2. Preserve the repository's hybrid HTML/Markdown style.
3. Use HTML `<h2>` headings for the module overview and numbered sections.
4. Use the repository icons exactly as shown in the template.
5. Number sections as `{module}.{section}` such as `10.1`, `10.2`, `10.3`.
6. Use `<dl>` / `<dt>` entries in the overview as the section table of contents.
7. Keep separator lines exactly as:
   - `<p style="border-bottom: 1px solid lightgrey;"></p>`
8. Prefer `learn.microsoft.com` links for all reference material.
9. Keep image references relative to the module file, using `../graphics/...`
   for local assets.
10. Give content images explicit `height` attributes, following the repository's
    established style.
11. Include both activity styles when requested:
    - `Activity:` for in-class exercises
    - `Self-Guided Activity:` for post-workshop exercises

## Procedure

### Step 1: Gather and normalize inputs

- Confirm the module number is two digits.
- Preserve the exact module title supplied by the user.
- Number the sections sequentially in the order provided.
- If activity details are missing, leave clear placeholders rather than
  inventing workshop steps.

### Step 2: Create the module file

Use the complete template below and replace every placeholder.

## Complete module template

```md
![](../graphics/microsoftlogo.png)

# Workshop: Microsoft Fabric Overview for the Data Professional

#### <i>A Microsoft Workshop</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2 id="{{MODULE_NUMBER}}"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/textbubble.png">{{MODULE_NUMBER}} - {{MODULE_TITLE}}</h2>

{{MODULE_DESCRIPTION}}

(<a href="https://github.com/sqlballs/MicrosoftFabricPre-Con/blob/main/fabricoverview/00%20-%20Pre-Requisites.md">Make sure you check out the <b>Pre-Requisites</b> page before you start</a>. You'll need all of the items loaded there before you can proceed with the workshop.)

You'll cover these topics in this module:

<dl>
  {{TOC_ENTRIES}}
</dl>

<p style="border-bottom: 1px solid lightgrey;"></p>

{{SECTION_BLOCKS}}

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/owl.png"><b>For Further Study</b></p>
<ul>
  {{FURTHER_STUDY_LINKS}}
</ul>

<p style="border-bottom: 1px solid lightgrey;"></p>

Congratulations! You have completed this Module. If you understand the concepts here and have completed all of the Activities, you can [proceed to the next Module]({{NEXT_MODULE_LINK}}).
```

## TOC entry template

Repeat once for each section title:

```html
<dt><a href="#{{MODULE_NUMBER_NO_PAD}}.{{SECTION_INDEX}}">{{MODULE_NUMBER_NO_PAD}}.{{SECTION_INDEX}} - {{SECTION_TITLE}}</a></dt>
```

## Section block template

Repeat once for each section title, in order:

```html
<h2 id="{{MODULE_NUMBER_NO_PAD}}.{{SECTION_INDEX}}"><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/pencil2.png">{{MODULE_NUMBER_NO_PAD}}.{{SECTION_INDEX}} {{SECTION_TITLE}}</h2>

{{SECTION_CONTENT}}

{{OPTIONAL_ACTIVITY_BLOCKS}}

<p style="border-bottom: 1px solid lightgrey;"></p>
```

## Activity block template

Use this block for in-class activities:

```html
<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: {{ACTIVITY_TITLE}}</b></p>

{{ACTIVITY_DESCRIPTION}}

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- {{STEP_1}}
- {{STEP_2}}
```

Use this block for post-workshop activities:

```html
<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: {{ACTIVITY_TITLE}}</b></p>

{{ACTIVITY_DESCRIPTION}}

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- {{STEP_1}}
- {{STEP_2}}
```

## Further study link template

Prefer Microsoft Learn links:

```html
<li><a href="{{LEARN_URL}}">{{LINK_TEXT}}</a></li>
```

## Placeholder reference

- `{{MODULE_NUMBER}}` — two-digit number used in the filename and module title
- `{{MODULE_NUMBER_NO_PAD}}` — number used in section anchors and numbering
- `{{MODULE_TITLE}}` — full module title
- `{{MODULE_DESCRIPTION}}` — overview paragraph
- `{{TOC_ENTRIES}}` — all generated `<dt>` items
- `{{SECTION_BLOCKS}}` — all generated section blocks
- `{{SECTION_INDEX}}` — section number within the module
- `{{SECTION_TITLE}}` — section heading text
- `{{SECTION_CONTENT}}` — explanatory text, images with `height` attributes,
  tables, or code blocks
- `{{OPTIONAL_ACTIVITY_BLOCKS}}` — zero or more activity blocks for the section
- `{{FURTHER_STUDY_LINKS}}` — one or more `<li>` entries
- `{{NEXT_MODULE_LINK}}` — link to the next module file

## Post-generation updates

After creating the new module file, update the surrounding workshop navigation.

### 1. Update `README.md`

Edit the workshop module table so it includes the new module:

- add a new row for `{{MODULE_NUMBER}} - {{MODULE_TITLE}}`
- use the repository's existing table style
- link to the new `fabricoverview/{{MODULE_NUMBER}} - {{MODULE_TITLE}}.md` file
- place the row in numeric order

### 2. Update the previous module's closing link

If this is not the first module in the sequence:

- open the previous module file
- replace its closing next-module link so it points to the new module
- if the new module is being inserted between two existing modules, set the new
  module's closing link to the formerly next module
- if the new module is now the final module, replace the closing text with a
  workshop-completion message instead of a next-module link

### 3. Review numbering and anchors

- verify the module filename number, overview heading number, TOC entries, and
  section IDs all match
- verify each TOC entry points to a matching section anchor

## Validation

After generation:

1. Run `/check-flow` to validate the structure.
2. If you added or changed links, run `/validate-links`.
3. If you added substantial prose, optionally run `/check-spelling` and then
   `/check-grammar`.
4. Fix any structural issues before considering the module complete.

## Output expectations

A completed run of this skill should leave the repository with:

- a new module file under `fabricoverview/`
- an updated `README.md` module table entry
- an updated closing link in the previous module when applicable
- a structure that passes the repository's flow checks

## Related skills

- Use `/check-flow` after scaffolding to validate methodology compliance.
- Use `/validate-links` after adding Learn references.
- Use `/check-spelling` and `/check-grammar` to polish newly added prose.
