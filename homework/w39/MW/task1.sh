#!/bin/bash

echo '4;2;6;4
2;4;6;7
3;6;5;9
3;1;4;2' > matrix.txt

### Tasks

### 1. Create a symbolic link to matrix.txt. Call the symbolic link as supermatrix.txt
ln -s matrix.txt ./supermatrix.txt


### 2. Print the sum of all values
sum="0"
count="0"
for item in `cat matrix.txt | tr ';' ' '`; do
    let sum+=${item}   # let sum=sum+${item}
done
echo "The sum of the matrix values are: ${sum}"



### 3. Print the maximum value
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



### 4. Print the minimum value
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


### 5. Use seq to print all odd numbers from 1 to 100
# Output should be in this format: "My odd number is ${NUMBER}"
# Use for, seq, echo and a NUMBER variable
# BONUS: Use only seq (no for, etc)
# print odd numbers 
for item in `seq 1 2 100`; 
do
echo	"My odd number is ${item}"
done


#Simple ODD Number Output
seq 1 2 100



