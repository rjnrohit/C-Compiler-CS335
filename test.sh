#!/bin/bash
rm -rf output/*
make clean;
make
cd test/
for test in *
do
    fname=${test%.*}
    echo $fname
    if [ $fname.c  = $test ]
    then
        python3 ../bin/lexer $test > ../output/$fname.txt
        python3 ../bin/parser $test -f ../output/$fname.png -o ../output/$fname.dot -d ../output/$fname.csv
    else 
        continue
    fi
    
done
cd ..
