#!/bin/bash

count="0"
sum="0"
for item in `seq 1 10`; do
    # tasks to do. core of the loop
    echo ${item}
    let sum+=${item}   # sum=sum+${item}
    let count++        # count=count+1
done

echo "Number of items: ${count}"
echo "My sum is: ${sum}"
echo "My avg is: `echo "${sum} / ${count}" | bc`"
