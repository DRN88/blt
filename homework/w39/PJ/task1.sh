#!/bin/bash

echo '4;2;6;4
2;4;6;7
3;6;5;9
3;1;4;2' > matrix.txt

### Tasks

### 1. Create a symbolic link to matrix.txt. Call the symbolic link as supermatrix.txt
#
ln -L matrix.txt linktomatrix
ls
linktomatrix  matrix.txt
cat linktomatrix
4;2;6;4
2;4;6;7
3;6;5;9
3;1;4;2
root@ubuntu-srv-01:~#



### 2. Print the sum of all values
#
SUM=0
for item in `cat matrix.txt | tr ';' ' '`; do
let SUM=SUM+${item}
done
echo "The sum of the matrix values are: ${SUM}"
The sum of the matrix values are: 68

### 3. Print the maximum value
# 
MAX=0
for item in `cat matrix.txt | tr ';' ' '`; do
if [ ${item} -gt ${MAX} ]
then
MAX=${item}
fi
done
echo "The maximum value is: ${MAX}"
The maximum value is: 9




### 4. Print the minimum value
MIN=99
for item in `cat matrix.txt | tr ';' ' '`; do
if [ ${item} -lt ${MIN} ]
then
MIN=${item}
fi
done
echo "The minimum value is: ${MIN}"
The minimum value is: 1


### 5. Use seq to print all odd numbers from 1 to 100
# Output should be in this format: "My odd number is ${NUMBER}"
# Use for, seq, echo and a NUMBER variable
# BONUS: Use only seq (no for, etc)
seq -f "My odd number is $g" 1 2 100
