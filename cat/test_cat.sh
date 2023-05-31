#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
TEST_FILE="test.txt"


for var in -b -e -n -s -t -v -E -T --number-nonblank --number --squeeze-blank
do
          TEST1="$var $TEST_FILE"
          ./cat $TEST1 > 1cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s 1cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files 1cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "SUCCESS: cat $TEST1"
            else
              (( COUNTER_FAIL++ ))
              echo "FAIL: cat $TEST1"
          fi
          rm 1cat.txt cat.txt
done

for var in -b -e -n -s -t -v -E -T --number-nonblank --number --squeeze-blank
do
  for var2 in -b -e -n -s -t -v -E -T --number-nonblank --number --squeeze-blank
  do
        if [ $var != $var2 ]
        then
          TEST1="$var $var2 $TEST_FILE"
          ./cat $TEST1 > 1cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s 1cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files 1cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "SUCCESS: cat $TEST1"
            else
              (( COUNTER_FAIL++ ))
              echo "FAIL: cat $TEST1"
          fi
          rm 1cat.txt cat.txt
        fi
  done
done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"