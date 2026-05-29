# Copilot Instructions for Fabric Data Pro Overview Workshop

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

## Repository Context

This is a Microsoft Fabric workshop for data professionals. Content is
authored in Markdown files under `fabricoverview/`. When helping authors
edit workshop content, use the Markdown Tools MCP server for linting and
formatting. When helping students with Fabric questions, use the Fabric
Local MCP server for API guidance and the Microsoft Learn MCP server for
official documentation references.
