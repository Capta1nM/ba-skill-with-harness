# install.ps1 - Cai ba-skill global cho Claude Code tren PowerShell
#
# Wraps:
#   1. npx skills add — register skills → ~/.agents/skills/
#   2. Copy project-template → both .agents/skills/ + .claude/skills/
#   3. KHONG copy agents/ — agents di per-engagement qua bootstrap
#
# Usage:
#   pwsh install.ps1
#   pwsh install.ps1 -WithCursor
#   pwsh install.ps1 -DryRun
#   pwsh install.ps1 -Uninstall

param(
    [switch]$DryRun,
    [switch]$Uninstall,
    [switch]$WithCursor,
    [switch]$Help
)

if ($Help) {
    Write-Output "Usage: pwsh install.ps1 [-DryRun] [-Uninstall] [-WithCursor]"
    Write-Output ""
    Write-Output "  -DryRun       preview without applying"
    Write-Output "  -Uninstall    remove ba-skill"
    Write-Output "  -WithCursor   also register for cursor"
    exit 0
}

$ScriptDir = $PSScriptRoot
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$ClaudeSkillsDir = Join-Path $ClaudeDir "skills"
$NpxSkillsDir = Join-Path $env:USERPROFILE ".agents\skills"
$TemplateDirNpx = Join-Path $NpxSkillsDir "project-template"
$TemplateDirClaude = Join-Path $ClaudeSkillsDir "project-template"

function Run-Cmd {
    param([scriptblock]$Block, [string]$Description)
    Write-Output "  $Description"
    if (-not $DryRun) {
        & $Block
    }
}

# Uninstall
if ($Uninstall) {
    Write-Output "Uninstalling ba-skill..."
    Get-ChildItem -Path $ScriptDir -Directory -Filter "ba-*" | ForEach-Object {
        $name = $_.Name
        $targetNpx = Join-Path $NpxSkillsDir $name
        $targetClaude = Join-Path $ClaudeSkillsDir $name
        Run-Cmd {
            Remove-Item -Recurse -Force $targetNpx -ErrorAction SilentlyContinue
            Remove-Item -Recurse -Force $targetClaude -ErrorAction SilentlyContinue
        } "remove $name"
    }
    Run-Cmd {
        Remove-Item -Recurse -Force $TemplateDirNpx -ErrorAction SilentlyContinue
        Remove-Item -Recurse -Force $TemplateDirClaude -ErrorAction SilentlyContinue
    } "remove templates"
    Write-Output "Uninstalled."
    exit 0
}

# Install
Write-Output "Installing ba-skill global..."
Write-Output "   Source: $ScriptDir"
Write-Output "   Target (npx): $NpxSkillsDir"
Write-Output "   Target (claude): $ClaudeSkillsDir"
Write-Output ""

# Step 1: try npx skills add, fallback to manual copy
Write-Output "[1/2] Skills (ba-architecture + ba-*) -> $NpxSkillsDir\"

$NpxAgents = "-a", "claude-code"
if ($WithCursor) { $NpxAgents += @("-a", "cursor") }

$npxAvailable = $null -ne (Get-Command npx -ErrorAction SilentlyContinue)

if ($npxAvailable) {
    if (-not $DryRun) {
        Push-Location $ScriptDir
        try {
            & npx skills add . --all @NpxAgents -g
        } finally {
            Pop-Location
        }
    } else {
        Write-Output "    [dry-run] npx skills add . --all $($NpxAgents -join ' ') -g"
    }
} else {
    Write-Output "    npx not found — fallback to manual copy"
    Run-Cmd {
        New-Item -ItemType Directory -Path $NpxSkillsDir -Force | Out-Null
        New-Item -ItemType Directory -Path $ClaudeSkillsDir -Force | Out-Null
    } "mkdir skills dirs"

    Get-ChildItem -Path $ScriptDir -Directory -Filter "ba-*" | ForEach-Object {
        $name = $_.Name
        $src = $_.FullName
        $dstNpx = Join-Path $NpxSkillsDir $name
        $dstClaude = Join-Path $ClaudeSkillsDir $name
        Run-Cmd {
            Remove-Item -Recurse -Force $dstNpx -ErrorAction SilentlyContinue
            Remove-Item -Recurse -Force $dstClaude -ErrorAction SilentlyContinue
            Copy-Item -Recurse -Force $src $dstNpx
            Copy-Item -Recurse -Force $src $dstClaude
        } "copy $name"
    }
}
Write-Output ""

# Step 2: project template - copy vao CA 2 location
Write-Output "[2/2] Project template -> ca 2 location"
$ptSrc = Join-Path $ScriptDir "project-template"
Run-Cmd {
    New-Item -ItemType Directory -Path $NpxSkillsDir -Force | Out-Null
    New-Item -ItemType Directory -Path $ClaudeSkillsDir -Force | Out-Null
    Remove-Item -Recurse -Force $TemplateDirNpx -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force $TemplateDirClaude -ErrorAction SilentlyContinue
    Copy-Item -Recurse -Force $ptSrc $TemplateDirNpx
    Copy-Item -Recurse -Force $ptSrc $TemplateDirClaude
} "copy project-template"
Write-Output "   -> $TemplateDirNpx"
Write-Output "   -> $TemplateDirClaude"
Write-Output ""

if (-not $DryRun) {
    Write-Output "Installed:"
    Get-ChildItem -Path $NpxSkillsDir -Directory -Filter "ba-*" -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Output "   - $($_.Name)"
    }
    Write-Output "   - template in $TemplateDirNpx"
    Write-Output "   - template in $TemplateDirClaude"
    Write-Output ""
    Write-Output "Next: bootstrap an engagement ->"
    Write-Output "   pwsh $TemplateDirClaude\bootstrap.ps1 -EngagementPath C:\path\to\your-engagement"
} else {
    Write-Output "Dry run complete. Re-run without -DryRun to apply."
}
