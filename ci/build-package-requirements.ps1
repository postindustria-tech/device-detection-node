param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName
)

Push-Location "$RepoName/fiftyone.devicedetection.onpremise";

Write-Output "Building extension for $package"

# Installing binary builder
npm install node-gyp --global || $(throw "ERROR: Failed to install node-gyp")

# Determine the operating system
if ($IsMacOS) {
    $os = "darwin"
} elseif ($IsLinux) {
    $os = "linux"
sudo apt-get install g++ make libatomic1
} elseif ($IsWindows) {
    $os = "win32"
} else {
    $os = "unknown"
}


# Creating folder for future build
New-Item -ItemType Directory -Path build | Out-Null

# Renaming buiding config file
Rename-Item -Path binding.51d -NewName binding.gyp


# Run configuration
node-gyp configure || $(throw "ERROR: Failed to configure node-gyp")

# Build configuration
node-gyp build || $(throw "ERROR: Failed build with node-gyp")

# Getting major node version
$nodeVersion = node --version  || $(throw "ERROR: Failed to get node version")
$nodeMajorVersion = $nodeVersion.TrimStart('v').Split('.')[0]

# Renaming building config file
$fileName = "FiftyOneDeviceDetectionHashV4-$os-$nodeMajorVersion.node"

Rename-Item -Path "./build/Release/FiftyOneDeviceDetectionHashV4.node" -NewName $fileName

# Replace "destination_folder\" with the path of the destination folder.
$destinationFolder = "C:\path\to\destination_folder\"

# Check if the destination folder exists; if not, create it.
if (-Not (Test-Path "../../package-files" -PathType Container)) {
    New-Item -ItemType Directory -Path "../../package-files" | Out-Null
}

# Move build result from release folder to lower level (build folder)
Move-Item -Path "./build/Release/$fileName" -Destination "../../package-files"

$items = Get-ChildItem -Path "../../package-files"

# Use the $items variable as needed in your script.
# For example, you can iterate through the items, log them to a file, or perform additional actions.
foreach ($item in $items) {
    Write-Host "LOGGER:"
    Write-Host $item.FullName
}


# Installing package for some examples
npm install n-readlines || $(throw "ERROR: Failed to install n-readlines")

Pop-Location