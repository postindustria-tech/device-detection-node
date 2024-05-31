param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName
)

Write-Output "::notice title=Hello from better main!::run-unit-tests successfully un-hardcoded main."

./node/run-unit-tests.ps1 -RepoName $RepoName
