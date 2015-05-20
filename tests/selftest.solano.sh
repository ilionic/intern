#!/usr/bin/env bash
set -e

# Start selenium-standalone
nohup node_modules/selenium-standalone/bin/selenium-standalone start > selenium-standalone.log 2>&1&
echo $! > $TMPDIR/selenium-standalone.pid

# Let selenium start
sleep 5

# Run tests
node_modules/.bin/intern-runner config=tests/selftest.solano.intern reporters=junit reporters=combined selftest=true selftest2 selftest3=a selftest3=b selftest3=c $@
TEST_EXIT_CODE=$?

# Stop selenium-standalone
if [ -f "$TMPDIR/selenium-standalone.pid" ]; then
  kill -9 `cat $TMPDIR/selenium-standalone.pid`
fi

exit $TEST_EXIT_CODE
