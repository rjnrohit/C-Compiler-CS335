#!/bin/bash
# ./test.sh [flags] (eg. ./test.sh -t -n)
source install.sh
rm -rf output
mkdir output

cd test/
for test in *
do
    fname=${test%.*}
    echo $fname
    if [ $fname.c  = $test ]
    then
        arcx86 $test -o ../output/$fname.o -f ../output/$fname $*
    else 
        continue
    fi
    
done
cd ..
