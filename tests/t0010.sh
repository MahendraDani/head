#!/bin/sh

. ./lib.sh

echo "TEST (t0010): Test to handle incorrect --lines=ab13 options"

"$HEAD" --lines=ab13 "$DATA_TEST1" >/dev/null 2>&1
HEAD_EXIT_STATUS=$?

if [ "$HEAD_EXIT_STATUS" -ne 0 ]; then
  echo "SUCCESS (t0010): OK"
else
  echo "FAILED (t0010): NOT OK"
  exit 1
fi


