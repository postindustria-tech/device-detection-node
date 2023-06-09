param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName,
    [Parameter(Mandatory=$true)]
    [string]$Version
)

$packages = "fiftyone.devicedetection", "fiftyone.devicedetection.cloud", "fiftyone.devicedetection.onpremise", "fiftyone.devicedetection.shared"

$noRemote = ""

Push-Location $RepoName

try {
    foreach ($package in $Packages) {
        $path = Join-Path . $package
        Push-Location $path
        Write-Output "Removing example folders for $package"

        # We need to remove examples folder, because of current CI architecture
        # We dont need to test integrations tests from example folder
        Remove-Item -Path ./examples -Recurse -Force

        Pop-Location
    }
} finally {
    Pop-Location
}

./node/build-package-npm.ps1 -RepoName $RepoName -Packages $packages -NoRemote $noRemote -Version $Version


exit $LASTEXITCODE