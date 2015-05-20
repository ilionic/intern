#!/bin/bash

# Kill the selenium process
if [ -f "$TMPDIR/selenium-standalone.pid" ]; then
  kill -9 `cat $TMPDIR/selenium-standalone.pid`
fi
