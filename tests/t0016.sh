#!/bin/sh

. ./lib.sh

echo "TEST (t0016): Test to head on multiple files with -n4"

ACTUAL=$("$HEAD" -n4 "$DATA_TEST1" "$DATA_TEST2") 
EXPECTED=$(head -n4 "$DATA_TEST1" "$DATA_TEST2")  

echo "$ACTUAL" > actual_output.txt
echo "$EXPECTED" > expected_output.txt

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0016): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0016): OK"

