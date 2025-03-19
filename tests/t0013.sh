#!/bin/sh

. ./lib.sh

echo "TEST (t0013): Test to handle incorrect -c ab13 options"

"$HEAD" -c ab13 "$DATA_TEST1" >/dev/null 2>&1
HEAD_EXIT_STATUS=$?

if [ "$HEAD_EXIT_STATUS" -ne 0 ]; then
  echo "SUCCESS (t0013): OK"
else
  echo "FAILED (t0013): NOT OK"
  exit 1
fi


