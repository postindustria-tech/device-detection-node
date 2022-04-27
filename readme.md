![51Degrees](https://51degrees.com/img/logo.png?utm_source=github&utm_medium=repository&utm_content=readme_main&utm_campaign=node-open-source "Data rewards the curious") **Node Device Detection**

[Developer Documentation](https://51degrees.com/device-detection-node/index.html?utm_source=github&utm_medium=repository&utm_content=documentation&utm_campaign=node-open-source "developer documentation")

## Introduction
This project contains 51Degrees Device Detection engines that can be used with the [Pipeline API](https://github.com/51Degrees/pipeline-node).

The Pipeline is a generic web request intelligence and data processing solution with the ability to add a range of 51Degrees and/or custom plug ins (Engines) 

## Device detection

Device detection can be performed 'on-premise' using a local data file or via the 51Degrees cloud service. 

These options all use the same evidence and property names so can be swapped out as needed.

### Packages
- **fiftyone.devicedetection.cloud** - A Node.js engine which retrieves engine results by consuming data from the 51Degrees cloud service. A cloud builder is also included to build a pipeline for device detection cloud engine.
- **fiftyone.devicedetection.onpremise** - A Node.js engine which retrieves engine results by consuming data from the 51Degrees data file. A on-premise builder is also included to build a pipeline for device detection on-premise engine.
- **fiftyone.devicedetection.shared** - A Node.js module which contains shared functionality to build cloud and on-premise engines.
- **fiftyone.devicedetection** - A Node.js pipeline builder which build pipeline for either cloud or on-premise engine based on the input.

### Installation

Using NPM call:

`npm install fiftyone.devicedetection`

`npm install fiftyone.devicedetection.cloud`

`npm install fiftyone.devicedetection.onpremise`

Or to install from this repository run:

`npm install fiftyone.devicedetection/`

`npm install fiftyone.devicedetection.cloud/`

`npm install fiftyone.devicedetection.onpremise/`

To install `fiftyone.devicedetection` and `fiftyone.devicedetection.onpremise` from this repository, you need to build the native binaries first. The step is described in **On-Premise** section.

### On-Premise
When running on-premise, a local Hash V4.1 data file is required.

[**Hash**](https://51degrees.com/documentation/_device_detection__hash.html): A large binary file populated with User-Agent signatures allowing very fast detection speeds.

51Degrees provides [multiple options](https://51degrees.com/Licencing-Pricing/On-Premise), some of which support automatic updates through the Pipeline API.

If the module is installed directly from Git then the binaries are also required. These binaries are native module which contains the core engine of device detection. Below are the steps to build these binaries:
- Pre-requisites
  - Install Node.js.
  - Install node-gyp by running.
    - `npm install node-gyp --global`  
  - Install C build tools:
    - Windows:
      - You will need either Visual Studio 2019 or the [C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/) installed.
        - Minimum platform toolset version is `v142`
        - Minimum Windows SDK version is `10.0.18362.0`

If you have Visual Studio Code, you'll still need to install the build tools from the link above.
    - Linux/MacOS:
      - You will need a C++ compiler which supports C++11. The compiler will and other build tools will be selected by CMake automatically based on your environment.
- Build steps:
  - Navigate to fiftyone.devicedetection.onpremise.
  - Rename the `binding.51d` to `binding.gyp`
  - Run `npm install`
    - Alternatively this step can be replaced by the followings:
      - Create a folder named `build`.
      - Run `node-gyp configure`
      - Run `node-gyp build`
    - Platform specific:
      - Windows
        - By default this will look for Visual Studio 2019 and a minimum Windows SDK version `10.0.18362.0`.
        - This can be overwritten by include `--msvs_version=[VS version]` and `--msvs_target_platform_version=[Windows SDK Version]` as part of the `npm install` command.
          - **NOTE**: This is not recommended. Also, some time the latest SDK version is selected instead, as observed in environment with multiple SDK versions installed. Thus, only install the correct Visual Studio version and the minimum required Windows SDK version as recommended.
  - This will build the `FiftyOneDeviceDetectionHashV4.node` under `build/Release` folder.
  - Copy the `FiftyOneDeviceDetectionHashV4.node` to `build` directory (which is one level up) and rename it using the following convention.
    - Windows:
      - FiftyOneDeviceDetectionHashV4-win32-[ Node version ].node
        - e.g. FiftyOneDeviceDetectionHashV4-win32-10.node for Node 10.
    - Linux:
      - FiftyOneDeviceDetectionHashV4-linux-[ Node version ].node
        - e.g. FiftyOneDeviceDetectionHashV4-linux-10.node for Node 10.
    - MacOS:
      - FiftyOneDeviceDetectionHashV4-darwin-[ Node version ].node
        - e.g. FiftyOneDeviceDetectionHashV4-darwin-10.node for Node 10.
    - Please see the [tested versions page](https://51degrees.com/documentation/_info__tested_versions.html) for Node versions that we currently test against.
    - At this point, other build files and folders can be removed apart from the binaries file *.node.

If this module is installed as a package from `npm` and is intended to be used on Windows, make sure to install the `C++ Redistributable latest 14.2* version or above`.

### Cloud

The device detection cloud engine makes use of the 51Degrees cloud API. As such there is no data file to maintain, processing will always be performed using the latest data available.

### Examples

For details of how to run the examples, please refer to [run examples](run_examples.md).

#### Cloud

| Example                                | Revamped           | Description |
|----------------------------------------|--------------------|-------------|
| gettingstarted-console                 | &check;            | How to use the 51Degrees Cloud service to determine details about a device based on its User-Agent and User-Agent Client Hints HTTP header values. |
| gettingstarted-web                     | &check;            | How to use the 51Degrees Cloud service to determine details about a device as part of a simple web server. |
| metadata-console                       |                    | How to access the meta-data that relates to the device detection algorithm. |
| useragentclienthints-web               |                    | This is now deprecated. Kept for testing purposes. Please see **gettingstarted-web** instead.
| taclookup-console                      |                    | How to get device details from a TAC (Type Allocation Code) using the 51Degrees cloud service. |
| nativemodellookup-console              |                    | How to get device details from a native model name using the 51Degrees cloud service. |

#### On-Premise

| Example                                | Revamped           | Description |
|----------------------------------------|--------------------|-------------|
| gettingstarted-console                 | &check;            | How to use the 51Degrees on-premise device detection API to determine details about a device based on its User-Agent and User-Agent Client Hints HTTP header values. |
| gettingstarted-web                     | &check;            | How to use the 51Degrees Cloud service to determine details about a device as part of a simple web server. |
| matchmetrics-console                   |                    | How to view metrics associated with the results of processing with a Device Detection engine. |
| metadata-console                       |                    | How to access the meta-data that relates to the device detection algorithm. |
| offlineprocessing-console              |                    | How to process data for later viewing using a Device Detection Hash data file. |
| performance-console                    |                    | How to configure the various performance options and run a simple performance test. |
| useragentclienthints-web               |                    | This is now deprecated. Kept for testing purposes. Please see **gettingstarted-web** instead. |
| automaticupdates/dataFileSystemWatcher.js |                    | How to configure automatic updates using the file system watcher to monitor for changes to the data file. |
| automaticupdates/updateOnStartUp.js    |                    | How to configure the Pipeline to automatically update the device detection data file on startup. |
| automaticupdates/updatePollingInterval.js |                    | Ho to configure and verify the various automatic data file update settings. |

## Tests

In this repository, there are tests for the examples. 
You will need to install jest to run them:

`npm install jest --global`

You will also need to install any required packages for the examples in the **Examples** section.

Add a 51Degrees cloud resource key in the fiftyone.devicedetection/package.json file for cloud tests. You can obtain a resource key from the [51Degrees Cloud Configurator](https://configure.51degrees.com/) and assign it to the environment variable `RESOURCE_KEY` in your test environment.

There are other environment variables that you will also need to set in your test environment before running all tests:
- `TEST_SUPER_RESOURCE_KEY`: This key contains all `SetHeader*` properties.
- `TEST_PLATFORM_RESOURCE_KEY`: This key contains only the `SetHeaderPlatform*` property but no other `SetHeader` properties.
- `TEST_HARDWARE_RESOURCE_KEY`: This key contains only the `SetHeaderHardware*` property but no other `SetHeader` properties.
- `TEST_BROWSER_RESOURCE_KEY`: This key contains only the `SetHeaderBrowser*` property but no other `SetHeader` properties.
- `TEST_NO_SETHEADER_RESOURCE_KEY`: This key contains no `SetHeader` properties.

To run the tests, execute the following command in the root directory or a sub-module directory:

`npm test`

## Native code updates

Process for rebuilding SWIG interfaces following an update to the device detection cxx code (This is only intended to be run by 51Degrees developers internally):

1. Ensure Swig is installed.
   1. At the time when this README was updated, the current stable version of Swig did not support new changes in Node 12 and above.
   2. The Swig version being used is built from the following branch.
      1. https://github.com/yegorich/swig/tree/pr/new-node-fixes.
      2. There had been an active Pull Request created to merge the changes to the main Swig master branch.
      3. Once the Pull Request is completed, the consequent Swig releases should be used.
2. Update the device-detection-cxx submodule to reference the relevant commit.
3. From terminal, navigate to fiftyone.pipeline.devicedetection and run:
    a) swig -c++ -javascript -node hash_node.i
4. Commit changes to repository.
5. Run the 'Build Device Detection Binaries for Node.js' Azure CI Pipeline.
6. Copy the produced artifacts into the fiftyone.pipeline.devicedetection/build directory.
7. Commit changes to repository.
