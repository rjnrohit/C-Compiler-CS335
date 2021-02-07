#!/bin/bash

cd tests/
for test in *
do
    fname=${test%.*}
    if [ $fname.c  = test ]
    then
        ../bin/clexer $fname > $fname.txt
    else 
        continue
    fi
    if [ -f $fname\_ouput.txt ]
    then
        STATUS="$(cmp --silent $fname.txt $fname\_ouput.txt; echo $?)" 
        if [[ $STATUS -ne 0 ]]; 
        then
            echo "Test failed with file $test"
            exit 1
        else
            echo "Test Passed"
        fi
    else
        echo "Please add expected output text file for test $test"
    fi
done
cd ..