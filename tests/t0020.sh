#!/bin/sh

. ./lib.sh

echo "TEST (t0020): Test to head on multiple files with -c 4"

ACTUAL=$("$HEAD" -c 4 "$DATA_TEST1" "$DATA_TEST2") 
EXPECTED=$(head -c 4 "$DATA_TEST1" "$DATA_TEST2")  

echo "$ACTUAL" > actual_output.txt
echo "$EXPECTED" > expected_output.txt

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0020): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0020): OK"

