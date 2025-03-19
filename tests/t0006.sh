#!/bin/sh

. ./lib.sh

echo "TEST (t0006): Test to head -c x on single file"

ACTUAL=$("$HEAD" -c 4 "$DATA_TEST1") 
EXPECTED=$(head -c 4 "$DATA_TEST1")  

echo "$ACTUAL" > actual_output.txt
echo "$EXPECTED" > expected_output.txt

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0006): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0006): OK"

