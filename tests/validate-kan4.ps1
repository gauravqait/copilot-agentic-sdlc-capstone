param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$statePath = Join-Path $RepositoryRoot 'docs/pipeline-state.json'

if (-not (Test-Path $statePath)) { throw "Missing pipeline state: $statePath" }

$state = Get-Content -Raw $statePath | ConvertFrom-Json
if ($state.storyId -ne 'KAN-4') { throw 'Unexpected story ID.' }
if ($state.currentStage -notin @('01', '02', '03', '04', '05', '06', '07', '08')) { throw 'Invalid current stage.' }

$expectedStages = @('01', '02', '03', '04', '05', '06', '07', '08')
$actualStages = @($state.history | ForEach-Object { $_.stage })
if (($actualStages -join ',') -ne ($expectedStages -join ',')) { throw 'Pipeline history is not ordered 01 through 08.' }

$historyStatus = @($state.history | Where-Object { $_.stage -ne '08' })
if ($historyStatus | Where-Object { $_.status -ne 'approved' }) { throw 'A non-final stage is not approved.' }
if (($state.history | Where-Object { $_.stage -eq '08' }).status -ne 'complete') { throw 'Final stage is not complete.' }

$currentHistory = $state.history | Where-Object { $_.stage -eq $state.currentStage }
if ($currentHistory.artifact -ne $state.artifact) { throw 'Current artifact does not match state history.' }

foreach ($entry in $state.history) {
    $artifactPath = Join-Path $RepositoryRoot $entry.artifact
    if (-not (Test-Path $artifactPath)) { throw "Missing artifact: $($entry.artifact)" }
}

Write-Output 'KAN-4 workflow validation passed.'