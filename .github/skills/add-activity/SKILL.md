---
name: add-activity
description: >
  Add a properly formatted in-class or self-guided activity to an existing
  workshop module section, or convert existing notes into a workshop activity.
  Use this skill when a user asks to add an activity, insert exercise steps,
  turn notes into an activity, or standardise activity formatting in
  `fabricoverview/`.
---

# Add Activity

This skill adds a correctly formatted activity to an existing workshop section
in `fabricoverview/`. Use it for both net-new activities and for converting
existing notes or loose instructions into a structured workshop activity block.

## When to Invoke

Use this skill when the user asks to:
- Add a new activity to a workshop module section
- Add an in-class activity
- Add a self-guided activity
- Convert notes, bullets, or tutorial references into a formal activity block
- Standardise the formatting of an activity so it matches the rest of the module

## Parameters

Provide these parameters:

| Parameter | Required | Description |
|---|---|---|
| `module_number` | Yes | The two-digit module number that maps to a file in `fabricoverview/` (for example `03`). |
| `section_number` | Yes | The target section number within the module (for example `3.2`). |
| `activity_type` | Yes | Either `in-class` or `self-guided`. |
| `activity_title` | Yes | The activity title shown in the bold heading. |
| `description` | Yes | A short paragraph explaining what the student will do. |
| `steps` | Yes | The step list to include under the **Steps** marker. |
| `video_url` | No | Optional YouTube URL to embed after the steps. |
| `tutorial_url` | No | Optional Microsoft Learn or tutorial URL to use as the lead step reference. |

## Templates

Use the exact activity heading and steps marker format shown below. Replace the sample title, description, links, and steps with the supplied parameter values.

### In-class Activity

```html
<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Activity: Activity Title</b></p>

Activity description paragraph explaining what the student will do.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- Open the following reference in another tab, [Tutorial Title](https://learn.microsoft.com/...)
  - Complete all steps on this page of the tutorial.
```

### Self-Guided Activity

```html
<p><img style="float: left; margin: 0px 15px 15px 0px;" src="../graphics/point1.png"><b>Self-Guided Activity: Activity Title</b></p>

Activity description paragraph.

<p><img style="margin: 0px 15px 15px 0px;" src="../graphics/checkmark.png"><b>Steps</b></p>

- Step instructions...
```

### Optional video embed

If `video_url` is provided, add this block after the steps:

```html
You can also right-click this link to open it in another tab and review this video that introduces you to these concepts:

<p><a href="https://www.youtube.com/watch?v=VIDEO_ID"><img src="https://img.youtube.com/vi/VIDEO_ID/0.jpg" height = 200></a>
```

Replace `VIDEO_ID` with the ID parsed from `video_url`.

## Placement Rules

- Locate the module file in `fabricoverview/` that matches `module_number`.
- Find the target section by its `<h2 id="X.Y">` heading using `section_number`.
- Add the activity after the section's explanatory content.
- Insert the activity before the section separator:

```html
<p style="border-bottom: 1px solid lightgrey;"></p>
```

- If the section already contains activities, append the new activity after the
  existing activity block(s) in that section unless the user requests a
  different order.

## Formatting Rules

- Preserve the repository's hybrid Markdown + HTML style. Do not convert the
  activity block to pure Markdown headings.
- Keep the icon paths exactly as `../graphics/point1.png` and
  `../graphics/checkmark.png`.
- Maintain blank lines between the heading, description, steps marker, steps,
  and optional video block.
- If `tutorial_url` is provided, use the tutorial-reference lead step pattern.
  If it is not provided, use the supplied `steps` as the full step list.
- When converting notes into an activity, rewrite them into one short
  description paragraph plus a clean, scannable step list.

## Consistency Warning

Before finalising the edit, inspect other activities in the same module and keep
formatting consistent with them. Match the surrounding conventions for spacing,
intro sentence style, bullet indentation, link phrasing, and optional video
wording unless the user explicitly asks to standardise the module.

## Process

1. Identify the module file from `module_number`.
2. Confirm the target `section_number` exists in that file.
3. Review nearby activities in the same section or module for formatting cues.
4. Build the activity block using the correct template for `activity_type`.
5. Insert it after the section content and before the separator.
6. Save the file.
7. Run `check-flow` after adding the activity to verify the section structure is
   still correct.

## Validation

After making the change, run `check-flow` to confirm:
- The activity remains inside the intended section
- The section still ends with the required separator
- The activity includes the correct heading format and **Steps** marker
- Section flow and numbering remain valid
