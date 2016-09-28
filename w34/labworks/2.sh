#!/bin/bash

echo '2,3,7
4,7,9
2,1,7' > matrix.dat

# 0,1,2
# 3,4,5
# 6,7,8

counter="0"
sum="0"
sum2="0"
for item in `cat matrix.dat | tr ',' ' '`; do

  if [ ${counter} -eq 3 ]; then
    let sum=sum+${item}
  fi

  if [ ${counter} -eq 4 ]; then
    let sum=sum+${item}
  fi

  if [ ${counter} -eq 5 ]; then
    let sum=sum+${item}
  fi

  [ ${counter} -eq 0 -o ${counter} -eq 4 -o ${counter} -eq 8 ] && let sum2=sum2+${item}

  let counter++;
done
echo "Results: ${sum}"
echo "Results: ${sum2}"

