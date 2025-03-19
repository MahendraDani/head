#!/bin/sh

. ./lib.sh

echo "TEST (t0012): Test to handle incorrect -cab13 options"

"$HEAD" -cab13 "$DATA_TEST1" >/dev/null 2>&1
HEAD_EXIT_STATUS=$?

if [ "$HEAD_EXIT_STATUS" -ne 0 ]; then
  echo "SUCCESS (t0012): OK"
else
  echo "FAILED (t0012): NOT OK"
  exit 1
fi


