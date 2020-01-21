#!/bin/bash
export PATH=$PATH:/usr/local/bin

npm install ajv

echo ""
echo "COMPILING MODULE SCHEMA"
echo ""
ajv compile -s module.json -r creatures.json -r creature.json -r spells.json

echo ""
echo "TESTING SCHEMA AGAINST TEST DATA"
echo ""
ajv test -s module.json -r spells.json -r creatures.json -r creature.json -d test-files/simple-module.json --valid
ajv test -s creature.json -d test-files/valid-single-creature.json --valid
ajv test -s creature.json -d test-files/valid-spellcasting-creature.json --valid
ajv test -s spells.json -d test-files/valid-spell.json --valid
ajv test -s creature.json -d test-files/valid-with-dice.json --valid
ajv test -s creatures.json -r creature.json -d test-files/valid-multiple-creatures.json --valid

echo ""
echo "TESTING ACTUAL MODULES"
echo ""
ajv test -s module.json -r spells.json -r creatures.json -r creature.json -d modules/test_module.json --valid --verbose
ajv test -s module.json -r spells.json -r creatures.json -r creature.json -d modules/srd.json --valid --verbose