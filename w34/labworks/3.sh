#!/bin/bash

mynumber="4 3 4 5 7 5 4 9"

sum="0"
count="0"
for item in `echo ${mynumber}`; do
    echo ${item}
    let sum+=${item}   # let sum=sum+${item}
    let count++
done

echo "My sum in: ${sum}"
echo "My number of items: ${count}"
echo "My Average is: `echo "${sum} / ${count}" | bc`"


min="0"
max="0"
count="0"
for item in `echo ${mynumber}`; do

   if [ ${count} -eq 0 ]; then
      min=${item}
      max=${item}
   fi

   if [ ${item} -lt ${min} ]; then
      min=${item}
   fi

   if [ ${item} -gt ${max} ]; then
      max=${item}
   fi

   let count++
done
echo "My minimum is: ${min}"
echo "My maximum is: ${max}"
