---
name: setup-mcp-env
description: >
  Set up environment variables and authentication for the MCP servers configured
  in this repository. Use this skill when a user asks to configure, set up, or
  troubleshoot MCP server authentication, environment variables, API keys,
  tokens, or login credentials for this project. Also use when a user says
  "setup MCP", "configure MCP", "MCP not working", or "authenticate for Fabric".
---

# MCP Server Environment Setup

This skill walks the user through setting up authentication and environment
variables required by the MCP servers configured in this repository.

## Configured MCP Servers

This repository configures the following MCP servers (see `.vscode/mcp.json`
and `.github/mcp.json`):

### Author-focused servers

| Server                | Purpose                                           | Auth Required                         |
|-----------------------|---------------------------------------------------|---------------------------------------|
| **GitHub**            | Manage PRs, issues, repo operations               | GitHub Copilot auth (VS Code) or `gh auth login` (CLI) |
| **Markdown Tools**    | TOC generation, linting, formatting, word stats   | None                                  |

### Fabric servers

| Server                | Purpose                                           | Auth Required                         |
|-----------------------|---------------------------------------------------|---------------------------------------|
| **Fabric Local**      | API specs, item schemas, best-practice guidance (no live connection) | None                |
| **Fabric Core**       | Live interaction with Fabric workspaces, items, permissions, capacities | Microsoft Entra ID (browser OAuth flow) |

### Azure & reference servers

| Server                | Purpose                                           | Auth Required                         |
|-----------------------|---------------------------------------------------|---------------------------------------|
| **Azure**             | Manage Azure subscriptions, resources, storage    | Azure CLI (`az login`)                |
| **Microsoft Learn**   | Search official docs, fetch articles, code samples | None                                 |
| **Fetch**             | Retrieve any web page or documentation URL        | None                                  |

## Setup Steps

Walk the user through each step below. **Run the verification commands yourself**
and check the output before proceeding. If a step fails, help the user fix it
before moving on.

### Step 1: Verify Prerequisites

Check that the following tools are installed:

```
node --version    # Requires Node.js 20 LTS or later
npm --version     # Comes with Node.js
az --version      # Azure CLI
gh --version      # GitHub CLI (for Copilot CLI GitHub MCP)
```

If any tool is missing, guide the user to install it:
- **Node.js 20 LTS+**: https://nodejs.org/
- **Azure CLI**: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
- **GitHub CLI**: https://cli.github.com/

### Step 2: Azure Authentication (for Azure MCP & Fabric Core MCP)

The **Azure MCP** server and the **Fabric Core MCP** server both require an
authenticated Azure identity.

#### 2a. Azure CLI login

```bash
az login
```

Verify the correct subscription is active:

```bash
az account show --query "{name:name, id:id, tenantId:tenantId}" -o table
```

If the wrong subscription is active:

```bash
az account set --subscription "<subscription-name-or-id>"
```

#### 2b. Fabric Core MCP — Entra ID consent

The Fabric Core remote MCP server (`https://api.fabric.microsoft.com/v1/mcp/core`)
authenticates via a browser-based Microsoft Entra ID OAuth flow. On first use
the user will be prompted to sign in and consent.

**Requirements for Fabric Core access:**
- The signed-in user must have a **Power BI / Fabric Pro or Premium Per User**
  license (or access to a Fabric capacity).
- The user must have appropriate **Fabric workspace roles** (Admin, Member, or
  Contributor) for the workspaces they want to interact with.
- If the organization restricts API access, an Entra ID admin may need to grant
  consent for the MCP application.

### Step 3: GitHub Authentication (for GitHub MCP)

**In VS Code**: The GitHub MCP server at `https://api.githubcopilot.com/mcp`
uses your existing GitHub Copilot authentication. Ensure you are signed into
GitHub in VS Code — no additional setup is needed.

**In Copilot CLI**: The GitHub MCP server is built-in. Verify login:

```bash
gh auth status
```

If not logged in:

```bash
gh auth login
```

### Step 4: Optional Environment Variables

Create a `.env` file in the project root for any optional overrides. This file
is already in `.gitignore` and must **NEVER** be committed.

```env
# ── Optional overrides ──────────────────────────────────────────
# Force a specific Azure subscription for the Azure MCP server
# AZURE_SUBSCRIPTION_ID=your-subscription-id

# Fabric bearer token for direct REST API calls (advanced usage)
# FABRIC_API_TOKEN=your-fabric-bearer-token

# GitHub personal access token (if gh CLI auth is not available)
# GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Remind the user: **never commit `.env` files or tokens to source control.**

### Step 5: Verify MCP Servers Are Working

**In VS Code**:
1. Open the Command Palette (`Ctrl+Shift+P`)
2. Run `MCP: List Servers`
3. Verify all 7 servers are listed
4. Start any servers that show as stopped
5. Open Copilot Chat and check the tools list to confirm Fabric, Azure, and
   Markdown tools appear

**In Copilot CLI**:
1. Run `/mcp` to see configured MCP servers
2. Run `/env` to verify servers are loaded
3. Test a simple query: ask Copilot to "list my Fabric workspaces" or
   "search Microsoft Learn for Lakehouse documentation"

### Troubleshooting

| Symptom | Fix |
|---------|-----|
| Server fails to start | Check Node.js version is 20+ LTS (`node --version`) |
| `npx` hangs or errors | Check network — `npx` downloads packages on first run. Try `npm cache clean --force` then retry |
| Azure MCP returns 401 | Run `az login` to refresh credentials, then restart the server |
| Fabric Core returns 403 | Verify Fabric Pro/PPU license and workspace role. Check Entra ID consent |
| GitHub MCP unavailable in CLI | Verify `gh auth status` shows a valid login |
| Markdown Tools not found | Run `npx @rog0x/mcp-markdown-tools@latest --help` to verify the package resolves |
| Microsoft Learn returns errors | Verify network access to `https://learn.microsoft.com/api/mcp` |
| VS Code doesn't show servers | Reload window (`Ctrl+Shift+P` → `Developer: Reload Window`) |
| Copilot CLI doesn't show servers | Run `/mcp` then select a server to restart it, or exit and re-enter `copilot` |
