#!/bin/bash

cd test/
for test in *
do
    fname=${test%.*}
    if [ $fname.c  = $test ]
    then
        python3 ../bin/lexer $test > $fname.txt
    else 
        continue
    fi
    
    if [ -f $fname\_output.txt ]
    then
        STATUS="$(cmp --silent $fname.txt $fname\_output.txt; echo $?)" 
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