#!/bin/bash

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
#seq 1 2 100