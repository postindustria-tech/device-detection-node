param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName,
    [Parameter(Mandatory=$true)]
    [string]$Name
)

Push-Location $RepoName

$perfSummary = New-Item -ItemType directory -Path $RepoName/test-results/performance-summary -Force

try
{
    Write-Output "Running performance tests"
    $env:JEST_JUNIT_OUTPUT_DIR = 'test-results/performance'
    npm run performance-test || $($testsFailed = $true)

    Get-Content -Path performance_test_summary.json
    Move-Item -Path performance_test_summary.json -Destination $perfSummary/results_$Name.json || $(throw "failed to move summary")
    Write-Output "OK"

} finally {
    Pop-Location
}

