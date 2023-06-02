param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName
)

$env:RESOURCE_KEY = $Options.Keys.TestResourceKey
$env:TEST_SUPER_RESOURCE_KEY = $Options.Keys.TestSuperResourceKey
$env:TEST_PLATFORM_RESOURCE_KEY = $Options.Keys.TestPlatformResourceKey
$env:TEST_HARDWARE_RESOURCE_KEY = $Options.Keys.TestHardwareResourceKey
$env:TEST_BROWSER_RESOURCE_KEY = $Options.Keys.TestBrowserResourceKey
$env:TEST_NO_SETHEADER_RESOURCE_KEY = $Options.Keys.TestNoSetHeaderResourceKey
$env:TEST_LICENSE_KEY = $Options.Keys.TestLicenseKey

./node/run-unit-tests.ps1 -RepoName $RepoName

exit $LASTEXITCODE