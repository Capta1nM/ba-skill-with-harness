# bootstrap.ps1 - Scaffold BA engagement tu ba-skill tren PowerShell
#
# Usage:
#   pwsh bootstrap.ps1 -EngagementPath C:\path\to\engagement `
#                      [-EngagementName <name>] `
#                      [-Methodology <undecided|srs-only|prd-stories|stories-only>] `
#                      [-DryRun]

param(
    [Parameter(Mandatory=$true)]
    [string]$EngagementPath,

    [string]$EngagementName = "",

    [ValidateSet("undecided", "srs-only", "prd-stories", "stories-only")]
    [string]$Methodology = "undecided",

    [switch]$DryRun
)

$ScriptDir = $PSScriptRoot

# Default engagement name from path basename
if ([string]::IsNullOrEmpty($EngagementName)) {
    $EngagementName = Split-Path $EngagementPath -Leaf
}

$BootstrapDate = Get-Date -Format "yyyy-MM-dd"

# Resolve agents source — try npx skills first, then claude native, then sibling
$AgentsCandidates = @(
    (Join-Path $env:USERPROFILE ".agents\skills\ba-skill\agents"),
    (Join-Path $env:USERPROFILE ".claude\skills\ba-skill\agents"),
    (Join-Path $ScriptDir "..\agents")
)
$AgentsSrc = $null
foreach ($cand in $AgentsCandidates) {
    if (Test-Path $cand) {
        $AgentsSrc = $cand
        break
    }
}

if (-not $AgentsSrc) {
    Write-Error "Cannot find agents/ source. Have you run install.ps1?"
    Write-Error "  Checked: $($AgentsCandidates -join '; ')"
    exit 1
}

Write-Output "Bootstrapping engagement..."
Write-Output "   Target: $EngagementPath"
Write-Output "   Engagement name: $EngagementName"
Write-Output "   Methodology: $Methodology"
Write-Output "   Bootstrap date: $BootstrapDate"
Write-Output "   Agents source: $AgentsSrc"
Write-Output ""

# Safety check
$ConfigFile = Join-Path $EngagementPath ".project-config.yml"
if (Test-Path $ConfigFile) {
    Write-Error "Already bootstrapped: $EngagementPath has .project-config.yml"
    exit 1
}

function Run-Cmd {
    param([scriptblock]$Block, [string]$Description)
    Write-Output "  $Description"
    if (-not $DryRun) {
        & $Block
    }
}

# Step 1: project-root
Write-Output "[1/3] Copy _project-root\* -> $EngagementPath\"
Run-Cmd {
    New-Item -ItemType Directory -Path $EngagementPath -Force | Out-Null
    Copy-Item -Path (Join-Path $ScriptDir "_project-root\*") -Destination $EngagementPath -Recurse -Force
} "copy _project-root"

# Step 2: docs
Write-Output "[2/3] Copy docs\* -> $EngagementPath\docs\"
$DocsTarget = Join-Path $EngagementPath "docs"
Run-Cmd {
    New-Item -ItemType Directory -Path $DocsTarget -Force | Out-Null
    Copy-Item -Path (Join-Path $ScriptDir "docs\*") -Destination $DocsTarget -Recurse -Force
} "copy docs"

# Step 3: agents
Write-Output "[3/3] Copy agents\*.md -> $EngagementPath\.claude\agents\"
$AgentsTarget = Join-Path $EngagementPath ".claude\agents"
Run-Cmd {
    New-Item -ItemType Directory -Path $AgentsTarget -Force | Out-Null
    Get-ChildItem -Path $AgentsSrc -Filter "*.md" | Copy-Item -Destination $AgentsTarget -Force
} "copy agents"

Write-Output ""

# Substitute placeholders
Write-Output "Substituting placeholders..."
if (-not $DryRun) {
    Get-ChildItem -Path $EngagementPath -Recurse -Include "*.md","*.yml","*.yaml" | ForEach-Object {
        $content = Get-Content $_.FullName -Raw -Encoding UTF8
        $content = $content -replace '\{ENGAGEMENT_NAME\}', $EngagementName `
                            -replace '\{METHODOLOGY\}', $Methodology `
                            -replace '\{BOOTSTRAP_DATE\}', $BootstrapDate
        Set-Content $_.FullName -Value $content -NoNewline -Encoding UTF8
    }
}
Write-Output ""

if (-not $DryRun) {
    Write-Output "Bootstrap done."
    Write-Output ""
    Write-Output "Engagement structure:"
    Write-Output "   $EngagementPath\AGENTS.md"
    Write-Output "   $EngagementPath\CLAUDE.md"
    Write-Output "   $EngagementPath\.project-config.yml"
    $agentCount = (Get-ChildItem -Path $AgentsTarget -Filter "*.md" -ErrorAction SilentlyContinue).Count
    Write-Output "   $EngagementPath\.claude\agents\ ($agentCount agents)"
    $mdCount = (Get-ChildItem -Path $DocsTarget -Recurse -Filter "*.md" -ErrorAction SilentlyContinue).Count
    Write-Output "   $EngagementPath\docs\ ($mdCount markdown files)"
    Write-Output ""
    Write-Output "Next steps:"
    Write-Output "   1. cd $EngagementPath"
    Write-Output "   2. Open Claude Code in this folder"
    Write-Output "   3. Paste content of docs\prompt\ba\template\00-kickoff.md with your engagement brief"
} else {
    Write-Output "Dry run complete. Re-run without -DryRun to apply."
}
