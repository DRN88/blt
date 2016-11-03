#! /bin/bash

MAX="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do

   if [ ${count} -eq 0 ]; then
        MAX=${item}
   fi

   if [ ${item} -gt ${MAX} ]; then
        MAX=${item}
   fi

   let count++
done

echo "The maximum value is: ${MAX}"



