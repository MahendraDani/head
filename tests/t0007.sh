#!/bin/sh

. ./lib.sh

echo "TEST (t0007): Test to head --bytes=x on single file"

ACTUAL=$("$HEAD" --bytes=4 "$DATA_TEST1") 
EXPECTED=$(head --bytes=4 "$DATA_TEST1")  

echo "$ACTUAL" > actual_output.txt
echo "$EXPECTED" > expected_output.txt

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0007): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0007): OK"

