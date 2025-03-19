#!/bin/sh

. ./lib.sh

echo "TEST (t0021): Test to head on multiple files with --bytes=4"

ACTUAL=$("$HEAD" --bytes=4 "$DATA_TEST1" "$DATA_TEST2") 
EXPECTED=$(head --bytes=4 "$DATA_TEST1" "$DATA_TEST2")  

echo "$ACTUAL" > actual_output.txt
echo "$EXPECTED" > expected_output.txt

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0021): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0021): OK"

