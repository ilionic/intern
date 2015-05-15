#!/usr/bin/env bash
set -e
cd "$(dirname $0)/.."
node_modules/.bin/intern-runner config=tests/selftest.solano.intern reporters=junit reporters=combined selftest=true selftest2 selftest3=a selftest3=b selftest3=c $@
