#!/bin/bash
cd final_test/
for test in *
do
    fname=${test%.*}
    echo $fname
    touch $fname.in
    
done
cd ..