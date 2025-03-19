#!/bin/sh

. ./lib.sh

echo "TEST (t0015): Test to head on multiple files without any options"

ACTUAL=$("$HEAD" "$DATA_TEST1" "$DATA_TEST2") 
EXPECTED=$(head "$DATA_TEST1" "$DATA_TEST2")  

echo "$ACTUAL" > actual_output.txt
echo "$EXPECTED" > expected_output.txt

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0015): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0015): OK"

