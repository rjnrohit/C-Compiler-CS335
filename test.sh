#!/bin/bash
rm -rf output/*
source install.sh
for file in test/*
do
    fname=${file##*/}
    fname=${fname%.*}
    # echo $fname
    if [ test/$fname.c  = $file ]
    then
        arcx86 test/$fname.c
        ./a.out < input/$fname.in > output/$fname.txt
    else 
        continue
    fi
    
done

