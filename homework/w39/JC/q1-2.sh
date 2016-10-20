#!/bin/bash

counter="0"
SUM="0"

for item in `cat matrix.txt | tr ';' ' '`; do

      let SUM+=${item}
      let counter++;
done
	  
echo "The sum of the matrix values are: ${SUM}"


