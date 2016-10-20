#! /bin/bash

### 4. Print the minimum value
#
MIN="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do

   if [ ${count} -eq 0 ]; then
         MIN=${item}
	 fi

   if [ ${item} -lt ${MIN} ]; then
         MIN=${item}
	 fi

   let count++
done

echo "The minimum value is: ${MIN}"



