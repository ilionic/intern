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

# Install selenium's chromedriver
if [ ! -f node_modules/selenium-standalone/.selenium/chromedriver/2.15-x64-chromedriver ]; then
  node_modules/selenium-standalone/bin/selenium-standalone install
fi
