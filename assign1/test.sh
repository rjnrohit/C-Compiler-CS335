#!/bin/bash

cd test/
for test in *
do
    fname=${test%.*}
    if [ $fname.c  = $test ]
    then
        python3 ../bin/lexer $test > ../output/$fname.txt
    else 
        continue
    fi
    
    if [ -f ../output/$fname\_output.txt ]
    then
        STATUS="$(cmp --silent ../output/$fname.txt ../output/$fname\_output.txt; echo $?)" 
        if [[ $STATUS -ne 0 ]]; 
        then
            echo "Test failed with file $test"
            exit 1
        else
            echo "Test Passed for file $test"
        fi
    else
        python3 ../bin/lexer $test > ../output/$fname\_output.txt
        echo "Please check the expected output text file for test $test"
    fi
done
cd ..