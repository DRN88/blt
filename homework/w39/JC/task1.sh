#!/bin/bash

echo '4;2;6;4
2;4;6;7
3;6;5;9
3;1;4;2' > matrix.txt

### Tasks

### 1. Create a symbolic link to matrix.txt. Call the symbolic link as supermatrix.txt
# 
ln -s matrix.txt supermatrix.txt
  


### 2. Print the sum of all values
# 
SUM="0"

for item in `cat matrix.txt | tr ';' ' '`; do

      let SUM+=${item}
done
echo "The sum of the matrix values are: ${SUM}"


### 3. Print the maximum value
# 
MAX="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do

   if [ ${count} -eq 0 ]; then
      max=${item}
   fi

      if [ ${item} -gt ${MAX} ]; then
      MAX=${item}
   fi

   let count++
done
echo "The maximum value is: ${MAX}"



### 4. Print the minimum value
#
MIN="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do

   if [ ${count} -eq 0 ]; then
      min=${item}
   fi

      if [ ${item} -lt ${MIN} ]; then
      MIN=${item}
   fi

   let count++
done
echo "The minimum value is: ${MIN}"


### 5. Use seq to print all odd numbers from 1 to 100
# Output should be in this format: "My odd number is ${NUMBER}"
# Use for, seq, echo and a NUMBER variable
# BONUS: Use only seq (no for, etc)
# 
seq 1 2 100

for item in `seq 1 2 100`; do
echo "My Odd number is ${item}"
done

