param (
    [Parameter(Mandatory=$true)]
    [string]$RepoName
)

Push-Location $RepoName

$packageJSON = @"
{
  "name": "device-detection-node",
  "version": "1.0.0",
  "description": "Temporary package to allow all tests to run using the local code as dependencies",
  "main": "index.js",
  "directories": {
    "test": "tests"
  },
  "scripts": {
     "unit-test": "jest --ci --reporters=jest-junit --reporters=default --coverage --coverageReporters=cobertura --testPathIgnorePatterns '(deviceDetectionCloud.test.js | keyUtils.test.js | performance.test.js)'",
     "integration-test": "jest --ci --reporters=jest-junit --reporters=default --coverage --coverageReporters=cobertura --testPathPattern='tacLookup.test.js | configurator.test.js | gettingStarted.test.js | metaData.test.js | nativeModelLookup.test.js | userAgentClientHints.test.js | deviceDetectionCloud.test.js'",
     "performance-test": "jest --ci --reporters=jest-junit --reporters=default --coverage --coverageReporters=cobertura --testPathPattern=performance.test.js"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/51Degrees/device-detection-node"
  },
  "jest-junit": {
    "outputName": "test_results.xml"
  },
  "author": "51Degrees",
  "contributors": [
    "Filip Hnízdo <filip@octophin.com> (https://octophindigital.com/)",
    "Steve Ballantine <stephen@51degrees.com> (https://51degrees.com)",
    "Ben Shilito <ben@51degrees.com> (https://51degrees.com)",
    "Joseph Dix <joseph@51degrees.com> (https://51degrees.com)",
    "Tung Pham <tung@51degrees.com> (https://51degrees.com)"
  ],
  "dependencies": {
    "fiftyone.pipeline.cloudrequestengine": "^4.4.7",
    "fiftyone.pipeline.core": "^4.4.7",
    "fiftyone.pipeline.engines": "^4.4.7",
    "fiftyone.pipeline.engines.fiftyone": "^4.4.7",
    "js-yaml": "^4.1.0",
    "n-readlines": "^1.0.1",
    "pug": "^3.0.2",
    "supertest": "^6.1.6"
  },
  "devDependencies": {
    "eslint": "^8.16.0",
    "eslint-config-standard": "^17.0.0",
    "eslint-plugin-import": "^2.26.0",
    "eslint-plugin-jest": "^26.2.2",
    "eslint-plugin-jsdoc": "^38.1.6",
    "eslint-plugin-node": "^11.1.0",
    "eslint-plugin-promise": "^6.0.0",
    "eslint-plugin-n": "^15.0.0",
    "jest": "^28.1.0",
    "jest-junit": "^13.2.0"
  },
  "license": "EUPL-1.2",
  "bugs": {
    "url": "https://github.com/51Degrees/device-detection-node/issues"
  },
  "files": [
    "*.js"
  ],
  "jest": {
    "testRunner": "jest-circus",
    "setupFilesAfterEnv": [
      "./setup.js"
    ]
  }
}
"@

New-Item -ItemType File -Path "package.json" -Force | Out-Null
Set-Content -Path "package.json" -Value $packageJSON
Write-Output "Package configuration file created successfully."

Pop-Location

./node/setup-environment.ps1 -RepoName $RepoName

if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}