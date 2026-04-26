param(
  [Parameter(Mandatory = $true, Position = 0)]
  [string]$TargetRepoPath
)

$ErrorActionPreference = "Stop"

$target = (Resolve-Path -LiteralPath $TargetRepoPath).Path
$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$source = Join-Path $scriptRoot "ao3-guide"
$dest = Join-Path $target "docs\ao3"

if (-not (Test-Path -LiteralPath $source -PathType Container)) {
  throw "Source folder not found: $source"
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item -Path (Join-Path $source "*") -Destination $dest -Recurse -Force

$start = "<!-- AO3-GUIDE:START -->"
$end = "<!-- AO3-GUIDE:END -->"

function Set-ManagedBlock {
  param(
    [Parameter(Mandatory = $true)][string]$Path,
    [Parameter(Mandatory = $true)][string]$Block
  )

  $dir = Split-Path -Parent $Path
  if ($dir) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }

  $normalizedBlock = ($Block -replace "`r?`n", "`r`n").Trim()
  $managed = "$start`r`n$normalizedBlock`r`n$end"
  if (Test-Path -LiteralPath $Path) {
    $existing = Get-Content -Raw -LiteralPath $Path
    $pattern = [regex]::Escape($start) + "(?s).*?" + [regex]::Escape($end) + "(`r?`n)*"
    if ([regex]::IsMatch($existing, $pattern)) {
      $updated = [regex]::Replace($existing, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $managed + "`r`n" }, 1)
    } else {
      $updated = $existing.TrimEnd() + "`r`n`r`n" + $managed + "`r`n"
    }
  } else {
    $updated = $managed + "`r`n"
  }

  [System.IO.File]::WriteAllText($Path, $updated, [System.Text.UTF8Encoding]::new($false))
}

$sharedIntro = @"
## AO3 Guide Routing

AO3 reference docs live in `docs/ao3/`. Start with `docs/ao3/agent-routing.md` and load only task-relevant docs.

Rule type meanings:
- HARD RULE: AO3 enforces this through sanitizer, parser, runtime, or config.
- BASELINE: AO3 currently ships this style, DOM, class, or behavior; useful to match or override, not a requirement.
- RECOMMENDATION: Safer authoring or userscript practice; valid alternatives may exist.
- REFERENCE: Lookup data for selectors, tokens, constants, sprites, or routing.

Use `docs/ao3/ao3-guide.json` as machine-readable routing metadata.
"@

$claudeBlock = @"
$sharedIntro
Read routing first: @docs/ao3/agent-routing.md

Common high-value imports:
- CSS/site skins: @docs/ao3/css-rules.md @docs/ao3/class-system.md @docs/ao3/stylesheet-cascade.md
- Userscripts: @docs/ao3/dom-patterns.md @docs/ao3/js-patterns.md @docs/ao3/js-api.md
- Work skins: @docs/ao3/work-skin-classes.md
"@

$codexBlock = @"
$sharedIntro
For AO3 skin/userscript work, inspect `docs/ao3/agent-routing.md` before planning or editing. Do not treat BASELINE values as constraints. Do treat HARD RULE sections as implementation constraints.
"@

$copilotBlock = @"
# AO3 Guide Routing

$sharedIntro
When answering AO3 skin or userscript questions, consult `docs/ao3/agent-routing.md` and the listed task-specific docs. Keep responses clear about HARD RULE vs BASELINE vs RECOMMENDATION.
"@

Set-ManagedBlock -Path (Join-Path $target "CLAUDE.md") -Block $claudeBlock.Trim()
Set-ManagedBlock -Path (Join-Path $target "AGENTS.md") -Block $codexBlock.Trim()
Set-ManagedBlock -Path (Join-Path $target ".github\copilot-instructions.md") -Block $copilotBlock.Trim()

Write-Host "Copied AO3 guide files to $dest"
Write-Host "Updated managed AO3 guide blocks in:"
Write-Host "  CLAUDE.md"
Write-Host "  AGENTS.md"
Write-Host "  .github/copilot-instructions.md"


