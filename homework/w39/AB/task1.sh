#!/bin/bash

echo '4;2;6;4
2;4;6;7
3;6;5;9
3;1;4;2' > matrix.txt

### Tasks

### 1. Create a symbolic link to matrix.txt. Call the symbolic link as supermatrix.txt
# ln -s matrix.txt supermatrix.txt


### 2. Print the sum of all values
SUM="$(grep -o '[[:digit:]]' matrix.txt | awk '{ sum += $1 } END { print sum }')"
echo "The sum of the matrix values are: ${SUM}"


### 3. Print the maximum value
MAX="$(grep -o '[[:digit:]]' matrix.txt | sort | tail -n 1)"
echo "The maximum value is: ${MAX}"



### 4. Print the minimum value
MIN="$(grep -o '[[:digit:]]' matrix.txt | sort | head -n 1)"
echo "The minimum value is: ${MIN}"


### 5. Use seq to print all odd numbers from 1 to 100
# Output should be in this format: "My odd number is ${NUMBER}"
# Use for, seq, echo and a NUMBER variable
# BONUS: Use only seq (no for, etc)
seq -f "My odd number is %g" 1 2 99 
