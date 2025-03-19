#!/bin/sh

. ./lib.sh

echo "TEST (t0009): Test to handle incorrect -nab13 options"

"$HEAD" -nab13 "$DATA_TEST1" >/dev/null 2>&1
HEAD_EXIT_STATUS=$?

if [ "$HEAD_EXIT_STATUS" -ne 0 ]; then
  echo "SUCCESS (t0009): OK"
else
  echo "FAILED (t0009): NOT OK"
  exit 1
fi


