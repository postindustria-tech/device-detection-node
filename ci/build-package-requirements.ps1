param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName
)

$packageWithExtenssions = "fiftyone.devicedetection.onpremise";

Push-Location $RepoName
Push-Location $packageWithExtenssions

./node/build-extension.ps1 -PackageName $packageWithExtenssions