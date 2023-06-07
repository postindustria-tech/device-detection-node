param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName
)


./build-extension.ps1 -PackageName $RepoName

./node/run-integration-tests.ps1 -RepoName $RepoName

exit $LASTEXITCODE