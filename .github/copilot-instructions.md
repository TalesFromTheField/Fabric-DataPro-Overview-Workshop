# Copilot Instructions for Fabric Data Pro Overview Workshop

## About This Repository

This is a **Microsoft Fabric workshop** for data professionals, published by
Microsoft's Azure Data and FastTrack teams. The content teaches how to design,
implement, use, and manage Microsoft Fabric analytics solutions covering
OneLake, Data Factory, Synapse, Power BI, Lakehouses, Data Warehouses,
Real-Time Intelligence, Mirroring, Copilots & AI Skills, and OLTP databases.

Licensed under Creative Commons Attribution 4.0 (documentation) and MIT (code).

## Repository Structure

```
fabricoverview/          Workshop modules (numbered 00–09 Markdown files)
graphics/                Images referenced by the modules (PNG, GIF)
LICENSES/                License files (CC BY 4.0 + MIT)
.vscode/mcp.json         MCP server config for VS Code
.github/mcp.json         MCP server config for Copilot CLI
.github/skills/          Copilot skills (setup-mcp-env, validate-links, check-flow, check-spelling, check-grammar)
.github/hooks/           Session-start prereq check scripts
.github/copilot-instructions.md   This file
```

## Content Methodology

### Module Structure

Each module file (`XX - Title.md`) follows this top-to-bottom structure:

1. **Header block** (required)
   - Microsoft logo: `![](../graphics/microsoftlogo.png)`
   - Workshop title: `# Workshop: Microsoft Fabric Overview for the Data Professional`
   - Workshop subtitle: `#### <i>A Microsoft Workshop</i>`
   - Grey separator line

2. **Module overview** (required)
   - Module title using `textbubble.png` icon with `<h2>` tag
   - Brief description of what the module covers
   - Link to the Pre-Requisites page (`00 - Pre-Requisites.md`)
   - Table of contents as an HTML `<dl>`/`<dt>` definition list with anchor
     links to each section (e.g., `<dt><a href="#3.1">3.1 - Section Title</a></dt>`)
   - Grey separator line

3. **Sections** (one or more, the body of the module)
   - Each section follows the pattern described below under "Section Structure"
   - Sections are separated by grey separator lines

4. **"For Further Study"** (required)
   - Owl icon: `<img ... src="../graphics/owl.png">`
   - Heading: `<b>For Further Study</b>`
   - Unordered list (`<ul>`/`<li>`) of links to Microsoft Learn documentation
     and other references for deeper exploration of the module's topics

5. **Module closing** (required)
   - Congratulations message: `Congratulations! You have completed this Module.`
   - Conditional next-module link: `If you understand the concepts here and
     have completed all of the Activities, you can [proceed to the next Module](link)`
   - The final module (08) uses a workshop-completion message instead

### Section Structure

Each section within a module follows this pattern:

1. **Section heading**
   - Uses `<h2>` with an anchor ID and the `pencil2.png` icon
   - Format: `<h2 id="X.Y"><img ... src="../graphics/pencil2.png">X.Y Section Title</h2>`
   - Numbering: `{module}.{section}` (e.g., `3.1`, `3.2`, `4.1`)

2. **Content**
   - Explanatory text about the topic (concepts, architecture, features)
   - May include sub-sections using `<h3>` tags
   - Images from Microsoft Learn docs or GitHub assets with `height` attributes
   - Bullet lists for feature descriptions or comparisons
   - Code blocks (T-SQL, PySpark, etc.) where relevant
   - Links to Microsoft Learn for deeper reading inline with the text

3. **Activity** (zero or more per section)
   There are two types of activities:

   **In-class Activity** — completed during the workshop:
   - Icon: `<img ... src="../graphics/point1.png">`
   - Heading: `<b>Activity: Title</b>`
   - Brief description of what the student will do
   - Steps marker: `<img ... src="../graphics/checkmark.png"><b>Steps</b>`
   - Step-by-step instructions, typically linking to a Microsoft Learn tutorial
   - Optional: embedded YouTube video thumbnail as a clickable link

   **Self-Guided Activity** — completed after the workshop:
   - Same format as above but heading uses `<b>Self-Guided Activity: Title</b>`
   - These are for independent study and exploration

4. **Section separator**
   - Grey separator: `<p style="border-bottom: 1px solid lightgrey;"></p>`

### HTML/Markdown Conventions

- **Hybrid style**: Modules mix Markdown with inline HTML. Maintain this — do
  not convert to pure Markdown.
- **Section headers**: Use HTML `<h2>` tags with anchor IDs and icon images,
  not plain Markdown `##`.
- **Images**: Local images use relative paths (`../graphics/`). External images
  from Microsoft Learn or GitHub use full URLs. Always include a `height`
  attribute for sizing.
- **Videos**: Embedded as clickable YouTube thumbnail images:
  `<a href="https://www.youtube.com/watch?v=ID"><img src="https://img.youtube.com/vi/ID/0.jpg" height=200></a>`
- **Separators**: `<p style="border-bottom: 1px solid lightgrey;"></p>`
- **Module numbering**: Files are numbered `00` through `09`. Sections use
  `X.1`, `X.2`, etc.
- **Links**: Prefer Microsoft Learn (`learn.microsoft.com`) for all external
  references.

### Icon Reference

| Icon file | Usage |
|-----------|-------|
| `microsoftlogo.png` | Top of every module (header) |
| `textbubble.png` | Module title/overview heading |
| `pencil2.png` | Section headings |
| `point1.png` | Activity headings (in-class and self-guided) |
| `checkmark.png` | Steps marker within activities |
| `owl.png` | "For Further Study" section |
| `listcheck.png` | "Technologies" section (README) |
| `bulletlist.png` | "Setup" section (README) |
| `pinmap.png` | "Related Workshops" section (README) |
| `bookpencil.png` | "Workshop Modules" section (README) |
| `geopin.png` | "Next Steps" section (README) |

## Personas

Two types of users work with this repo:

1. **Authors** — workshop maintainers who write and edit module content, manage
   the repo, and update activities. They use the GitHub, Markdown Tools, Fabric
   Local, Azure, and Microsoft Learn MCP servers.

2. **Students** — data professionals taking the workshop. They follow activities,
   ask questions about Fabric concepts, and build solutions in their own Fabric
   workspaces. They use the Fabric Local, Fabric Core, Azure, Microsoft Learn,
   and Fetch MCP servers.

When helping an author, focus on content quality, formatting consistency, link
accuracy, and the conventions listed above.

When helping a student, focus on clear explanations, step-by-step guidance,
and references to official Microsoft Learn documentation.

## Content Quality Skills

This repository includes skills for maintaining content quality:

- **`/validate-links`** — Scan all content for broken, malformed, or outdated
  links. Researches correct replacements on Microsoft Learn, verifies them, and
  applies fixes. Run this periodically since Microsoft frequently reorganises
  their documentation URLs.

- **`/check-flow`** — Audit module structure against the content methodology
  documented above. Checks section numbering, heading format consistency,
  required sections, TOC alignment, and icon usage. Run this after adding or
  reorganising content.

- **`/check-spelling`** — Scan all content for spelling errors, typos, and
  inconsistent product terminology (e.g., "CoPilot" vs "Copilot", "Mirroing"
  vs "Mirroring"). Understands Microsoft Fabric technical vocabulary and won't
  flag legitimate product names or acronyms.

- **`/check-grammar`** — Review content for grammar errors, awkward phrasing,
  passive voice, style inconsistencies, and readability issues. Distinguishes
  between clear errors and stylistic suggestions. Run after `/check-spelling`.

**Recommended quality workflow**: `/check-spelling` → `/check-grammar` →
`/check-flow` → `/validate-links`

If a user asks to "check links", "audit content", "validate the structure", or
reports broken links, suggest the appropriate skill.

## MCP Server Setup

This repository has MCP servers configured in `.vscode/mcp.json` and
`.github/mcp.json`. Several servers require authentication before they will
work:

- **Azure MCP** and **Fabric Core MCP** require `az login`
- **GitHub MCP** requires GitHub authentication
- **Fabric Core MCP** requires a Fabric Pro/PPU license and workspace roles

**If a user reports MCP server errors, authentication failures, missing tools,
or asks how to get started with this repository**, proactively suggest running
the `/setup-mcp-env` skill to walk them through the full setup process.

**If a user's first message is a greeting or they seem new to the repo**, mention
that they can run `/setup-mcp-env` to configure their environment for the
workshop's MCP servers.

## Tone and Style

- Use a professional but approachable tone appropriate for data professionals.
- Be precise with Microsoft Fabric terminology (e.g., "Lakehouse" not
  "lakehouse", "OneLake" not "one lake", "Data Warehouse" not "data warehouse"
  when referring to the Fabric service).
- When referencing workshop modules, use the full numbered title
  (e.g., "Module 03 - Data Warehouse and Data Integration").
- Prefer linking to Microsoft Learn for deeper reading rather than reproducing
  lengthy documentation inline.
