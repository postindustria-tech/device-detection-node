/* *********************************************************************
 * This Original Work is copyright of 51 Degrees Mobile Experts Limited.
 * Copyright 2022 51 Degrees Mobile Experts Limited, Davidson House,
 * Forbury Square, Reading, Berkshire, United Kingdom RG1 3EU.
 *
 * This Original Work is licensed under the European Union Public Licence
 * (EUPL) v.1.2 and is subject to its terms as set out below.
 *
 * If a copy of the EUPL was not distributed with this file, You can obtain
 * one at https://opensource.org/licenses/EUPL-1.2.
 *
 * The 'Compatible Licences' set out in the Appendix to the EUPL (as may be
 * amended by the European Commission) shall be deemed incompatible for
 * the purposes of the Work and the provisions of the compatibility
 * clause in Article 5 of the EUPL shall not apply.
 * 
 * If using the Work as, or as part of, a network application, by 
 * including the attribution notice(s) required under Article 5 of the EUPL
 * in the end user terms of the application under an appropriate heading, 
 * such notice(s) shall fulfill the requirements of that article.
 * ********************************************************************* */

const fs = require('fs');

const example = require((__dirname) + '/gettingStarted.js');

// Test constants
const tc = require('fiftyone.devicedetection.shared').testConstants;

const OptionsExtension =
  require('fiftyone.devicedetection.shared').optionsExtension;

describe('Examples', () => {
  test('cloud getting started', async () => {
    // Load the configuration from a config file to a JSON object.
    const options = JSON.parse(fs.readFileSync((__dirname) + '/51d.json'), 'utf8');
    OptionsExtension.updateElementPath(options, __dirname);
    OptionsExtension.setResourceKey(
      options, process.env[tc.envVars.superResourceKeyEnvVar]);
    await example.run(options, process.stdout);
    expect(true);
  });
});
