param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$statePath = Join-Path $RepositoryRoot 'docs/pipeline-state.json'
$artifactPath = Join-Path $RepositoryRoot 'docs/KAN-4/05-implementation-summary.md'

if (-not (Test-Path $statePath)) { throw "Missing pipeline state: $statePath" }
if (-not (Test-Path $artifactPath)) { throw "Missing implementation artifact: $artifactPath" }

$state = Get-Content -Raw $statePath | ConvertFrom-Json
if ($state.storyId -ne 'KAN-4') { throw 'Unexpected story ID.' }
if ($state.currentStage -ne '05') { throw 'Current stage is not 05.' }
if ($state.status -ne 'approved') { throw 'Pipeline status is not approved.' }
if ($state.artifact -ne 'docs/KAN-4/05-implementation-summary.md') { throw 'Unexpected current artifact.' }

$expectedHistory = @('01', '02', '03', '04', '05')
$actualHistory = @($state.history | ForEach-Object { $_.stage })
if (($actualHistory -join ',') -ne ($expectedHistory -join ',')) { throw 'Pipeline history is not ordered 01 through 05.' }
if (($state.history | Where-Object { $_.stage -eq '05' }).status -ne 'approved') { throw 'Stage 05 history is not approved.' }

$artifact = Get-Content -Raw $artifactPath
if (($artifact -split "`r?`n" | Where-Object { $_ -match '^# ' }) -join "`n" -ne "# Work Completed`n# Deliverables`n# Approval") {
    throw 'Implementation summary headings do not match the required contract.'
}
if ($artifact -notmatch 'KAN-4' -or $artifact -notmatch 'approved') { throw 'Implementation summary lacks story or approval evidence.' }

Write-Output 'KAN-4 implementation validation passed.'