param (
    [Parameter(Mandatory=$true)]
    [string]$PackageName
)

Write-Output "Building extension for $package"

# Installing binary builder
npm install node-gyp --global || $(throw "ERROR: Failed to install node-gyp")

sudo apt-get install g++ make libatomic1

git submodule update --init --recursive

# Creating folder for future build
New-Item -ItemType Directory -Path build | Out-Null

# Renaming buiding config file
Rename-Item -Path binding.51d -NewName binding.gyp

# Run configuration
node-gyp configure || $(throw "ERROR: Failed to configure node-gyp")

# Build configuration
node-gyp build || $(throw "ERROR: Failed build with node-gyp")

# Move build result from release folder to lower level (build folder)
Move-Item -Path ./build/Release/FiftyOneDeviceDetectionHashV4.node -Destination ./build/

# Getting major node version
$nodeVersion = node --version  || $(throw "ERROR: Failed to get node version")
$nodeMajorVersion = $nodeVersion.TrimStart('v').Split('.')[0]

# Renaming buiding config file
Rename-Item -Path ./build/FiftyOneDeviceDetectionHashV4.node -NewName FiftyOneDeviceDetectionHashV4-linux-$nodeMajorVersion.node

# Installing package for some examples
npm install n-readlines || $(throw "ERROR: Failed to install n-readlines")