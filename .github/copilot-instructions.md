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
.github/skills/          Copilot skills (setup-mcp-env)
.github/hooks/           Session-start prereq check scripts
.github/copilot-instructions.md   This file
```

## Content Conventions

Workshop modules follow a consistent structure. Preserve these patterns when
editing or creating content:

- **Header**: Each module starts with the Microsoft logo
  (`![](../graphics/microsoftlogo.png)`), a title, and the workshop subtitle.
- **Sections**: Use HTML `<h2>` tags with anchor IDs and an icon image
  (e.g., `<img ... src="../graphics/pencil2.png">`), not plain Markdown `##`.
- **Navigation**: Each module links to the Pre-Requisites page and ends with
  a "Next Steps" link to the following module.
- **Table of contents**: Use HTML `<dl>`/`<dt>` definition lists with anchor
  links at the top of each module.
- **Activities**: Prefixed with `<b>Activity:</b>` and the `point1.png` icon.
  Steps use `checkmark.png`.
- **Separators**: Use `<p style="border-bottom: 1px solid lightgrey;"></p>`
  between sections.
- **Images**: Referenced from `../graphics/` using relative paths. External
  images from GitHub use full URLs.
- **Numbering**: Modules are numbered `00` through `09`. Sections within a
  module use `X.1`, `X.2`, etc.
- **Links**: External references point to Microsoft Learn (`learn.microsoft.com`)
  whenever possible.
- **Inline HTML**: The modules mix Markdown with inline HTML (bold, italic,
  tables, images). Maintain this hybrid style — do not convert to pure Markdown.

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
