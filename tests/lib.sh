#!/bin/sh

HEAD=../cchead
DATA_TEST1=../data/text.txt
DATA_TEST2=../data/text2.txt

test_program_exists(){
  if ! test -f "$CAT"; then
  echo "ERROR: head executable not found, please build the program"
  exit 1
  fi
}