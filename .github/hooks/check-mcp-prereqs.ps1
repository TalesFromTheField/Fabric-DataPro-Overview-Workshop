# Hook: check-mcp-prereqs
# Runs at session start to verify that prerequisites for the configured
# MCP servers are installed and authenticated.

$warnings = @()

# -- Node.js --
$nodePath = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodePath) {
    $warnings += "  Node.js is not installed (required for Fabric, Azure, Markdown, and Fetch MCP servers)."
    $warnings += "   Install from: https://nodejs.org/"
    $warnings += ""
} else {
    $nodeVersion = (node -v) -replace 'v(\d+)\..*', '$1'
    if ([int]$nodeVersion -lt 20) {
        $warnings += "  Node.js v$nodeVersion detected - version 20 LTS or later is required."
        $warnings += "   Update from: https://nodejs.org/"
        $warnings += ""
    }
}

# -- Azure CLI --
$azPath = Get-Command az -ErrorAction SilentlyContinue
if (-not $azPath) {
    $warnings += "  Azure CLI is not installed (required for Azure MCP and Fabric Core MCP)."
    $warnings += "   Install from: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli"
    $warnings += ""
} else {
    $azAccount = az account show 2>&1
    if ($LASTEXITCODE -ne 0) {
        $warnings += "  Azure CLI is installed but you are not logged in."
        $warnings += "   Run: az login"
        $warnings += ""
    }
}

# -- GitHub CLI --
$ghPath = Get-Command gh -ErrorAction SilentlyContinue
if (-not $ghPath) {
    $warnings += "  GitHub CLI is not installed (needed for GitHub MCP in Copilot CLI)."
    $warnings += "   Install from: https://cli.github.com/"
    $warnings += ""
} else {
    $ghStatus = gh auth status 2>&1
    if ($LASTEXITCODE -ne 0) {
        $warnings += "  GitHub CLI is installed but you are not logged in."
        $warnings += "   Run: gh auth login"
        $warnings += ""
    }
}

# -- Report --
if ($warnings.Count -gt 0) {
    Write-Host ""
    Write-Host ([char]0x2501) * 54 " MCP Server Prerequisites Check " -NoNewline
    Write-Host ""
    Write-Host ""
    foreach ($w in $warnings) { Write-Host $w }
    Write-Host "Run the /setup-mcp-env skill for guided setup assistance."
    Write-Host ([char]0x2501) * 54
    Write-Host ""
}
