#!/bin/bash

# W34 -  2. Print the sum of all values

sum="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do
    let sum+=${item}   # let sum=sum+${item}
done
echo "The sum of the matrix values are: ${sum}"