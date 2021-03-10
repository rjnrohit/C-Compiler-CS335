#!/bin/bash

cd test/
for test in *
do
    fname=${test%.*}
    if [ $fname.c  = $test ]
    then
        python3 ../bin/lexer $test > ../output/$fname.txt
        python3 ../bin/parser $test -p -f ../output/$fname.png > ../output/$fname.dot
    else 
        continue
    fi
    
done
cd ..
