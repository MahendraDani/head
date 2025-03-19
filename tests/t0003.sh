#!/bin/sh

. ./lib.sh

echo "TEST (t0003): Test to head -nx on single file"

ACTUAL=$("$HEAD" -n4 "$DATA_TEST1") 
EXPECTED=$(head -n4 "$DATA_TEST1")  

echo "$ACTUAL" > actual_output.txt
echo "$EXPECTED" > expected_output.txt

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0003): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0003): OK"

