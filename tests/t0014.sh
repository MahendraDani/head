#!/bin/sh

. ./lib.sh

echo "TEST (t0014): Test to handle incorrect --bytes=ab13 options"

"$HEAD" --bytes=ab13 "$DATA_TEST1" >/dev/null 2>&1
HEAD_EXIT_STATUS=$?

if [ "$HEAD_EXIT_STATUS" -ne 0 ]; then
  echo "SUCCESS (t0014): OK"
else
  echo "FAILED (t0014): NOT OK"
  exit 1
fi


