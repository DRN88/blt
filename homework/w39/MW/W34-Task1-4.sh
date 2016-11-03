#!/bin/bash

# W34 -  4. Print the minimum value

min="0"
max="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do
   if [ ${count} -eq 0 ]; then
      min=${item}
   fi

   if [ ${item} -lt ${min} ]; then
      min=${item}

   fi

   let count++
done
echo "The minimum value is: ${min}"
