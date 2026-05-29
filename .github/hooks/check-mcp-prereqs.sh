#!/usr/bin/env bash
# Hook: check-mcp-prereqs
# Runs at session start to verify that prerequisites for the configured
# MCP servers are installed and authenticated.
#
# Exit 0 = all good (silent). Non-zero output = printed as a warning.

set -euo pipefail

warnings=""

# ── Node.js ──────────────────────────────────────────────────────
if ! command -v node &>/dev/null; then
  warnings+="⚠  Node.js is not installed (required for Fabric, Azure, Markdown, and Fetch MCP servers).\n"
  warnings+="   Install from: https://nodejs.org/\n\n"
else
  NODE_MAJOR=$(node -v | sed 's/v\([0-9]*\).*/\1/')
  if [ "$NODE_MAJOR" -lt 20 ]; then
    warnings+="⚠  Node.js $(node -v) detected — version 20 LTS or later is required.\n"
    warnings+="   Update from: https://nodejs.org/\n\n"
  fi
fi

# ── Azure CLI ────────────────────────────────────────────────────
if ! command -v az &>/dev/null; then
  warnings+="⚠  Azure CLI is not installed (required for Azure MCP and Fabric Core MCP).\n"
  warnings+="   Install from: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli\n\n"
else
  if ! az account show &>/dev/null 2>&1; then
    warnings+="⚠  Azure CLI is installed but you are not logged in.\n"
    warnings+="   Run: az login\n\n"
  fi
fi

# ── GitHub CLI ───────────────────────────────────────────────────
if ! command -v gh &>/dev/null; then
  warnings+="⚠  GitHub CLI is not installed (needed for GitHub MCP in Copilot CLI).\n"
  warnings+="   Install from: https://cli.github.com/\n\n"
else
  if ! gh auth status &>/dev/null 2>&1; then
    warnings+="⚠  GitHub CLI is installed but you are not logged in.\n"
    warnings+="   Run: gh auth login\n\n"
  fi
fi

# ── Report ───────────────────────────────────────────────────────
if [ -n "$warnings" ]; then
  echo ""
  echo "━━━ MCP Server Prerequisites Check ━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
  echo -e "$warnings"
  echo "Run the /setup-mcp-env skill for guided setup assistance."
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
fi
