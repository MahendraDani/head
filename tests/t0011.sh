#!/bin/sh

. ./lib.sh

echo "TEST (t0011): Test to handle incorrect -n ab13 options"

"$HEAD" -n ab13 "$DATA_TEST1" >/dev/null 2>&1
HEAD_EXIT_STATUS=$?

if [ "$HEAD_EXIT_STATUS" -ne 0 ]; then
  echo "SUCCESS (t0011): OK"
else
  echo "FAILED (t0011): NOT OK"
  exit 1
fi


