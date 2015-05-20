#!/bin/bash

set -e

# Check if the Solano CI cached version is present
if [ ! -d node_modules ]; then
  npm install
  cd node_modules/intern
  npm install chai
  npm install dojo
  cd $TDDIUM_REPO_ROOT
fi

node_modules/selenium-standalone/bin/selenium-standalone install
nohup node_modules/selenium-standalone/bin/selenium-standalone start > selenium-standalone.log 2>&1&
echo $! > $TMPDIR/selenium-standalone.pid
