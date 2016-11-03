#!/bin/bash

# W34 -  3. Print the maximum value

min="0"
max="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do
   if [ ${count} -eq 0 ]; then
         max=${item}
   fi

   if [ ${item} -gt ${max} ]; then
      max=${item}
   fi

   let count++
done
echo "The maximum value is: ${max}"