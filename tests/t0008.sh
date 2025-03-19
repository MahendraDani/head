#!/bin/sh

. ./lib.sh

echo "TEST (t0008): Test head for stdin"

head > actual_output.txt << EOF
"line 1"
"line 2"
"line 3"
"line 4"
"line 5"
"line 6"
"line 7"
"line 8"
"line 9"
"line 10"
EOF

$HEAD > expected_output.txt << EOF
"line 1"
"line 2"
"line 3"
"line 4"
"line 5"
"line 6"
"line 7"
"line 8"
"line 9"
"line 10"
EOF

if ! diff actual_output.txt expected_output.txt > /dev/null; then
  echo "FAILED (t0008): NOT OK"
  rm -f actual_output.txt expected_output.txt
  exit 1
fi

rm -f actual_output.txt expected_output.txt

echo "SUCCESS (t0008): OK"