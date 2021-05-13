#!/bin/bash
# ./test.sh
source install.sh
rm -rf output
mkdir output

for file in test/*
do
    fname=${file##*/}
    fname=${fname%.*}
    # echo $fname
    if [ test/$fname.c  = $file ]
    then
        echo "executing... $fname"
        arcx86 test/$fname.c -o output/$fname -f output/$fname -c -d -a -s -t -l $*
        if [ -e input/$fname.in ]
        then
            ./output/$fname < input/$fname.in > output/$fname.txt
        else
            ./output/$fname > output/$fname.txt
        fi
    else 
        continue
    fi
    
done

