#!/bin/bash

ajv compile -s module.json -r creatures.json -r creature.json

ajv test -s creature.json -d test-files/valid-single-creature.json --valid
ajv test -s creature.json -d test-files/valid-with-dice.json --valid
ajv test -s creatures.json -r creature.json -d test-files/valid-multiple-creatures.json --valid

echo ""
echo "TESTING ACTUAL MODULES"
echo ""
ajv test -s module.json -r creatures.json -r creature.json -d modules/test_module.json --valid --verbose
ajv test -s module.json -r creatures.json -r creature.json -d modules/cc_creatures.json --valid --verbose
ajv test -s module.json -r creatures.json -r creature.json -d modules/tob_creatures.json --valid --verbose
ajv test -s module.json -r creatures.json -r creature.json -d modules/srd_creatures.json --valid --verbose