param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName,
    [Parameter(Mandatory=$true)]
    [string]$Version
)

$packages = "fiftyone.devicedetection", "fiftyone.devicedetection.cloud", "fiftyone.devicedetection.onpremise", "fiftyone.devicedetection.shared"

$noRemote = ""

Copy-Item -Path "./package-files/package_Ubuntu_Node_16/package-files" -Destination "$RepoName/fiftyone.devicedetection.onpremise/build" -Recurse

Get-ChildItem -Path "$RepoName/fiftyone.devicedetection.onpremise/build"

./node/build-package-npm.ps1 -RepoName $RepoName -Packages $packages -NoRemote $noRemote -Version $Version


exit $LASTEXITCODE