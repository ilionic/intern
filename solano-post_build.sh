#!/bin/bash

# Kill the selenium process
kill -9 `cat $TMPDIR/selenium-standalone.pid`
