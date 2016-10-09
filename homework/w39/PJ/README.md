# H1  Week 39 Homework

## Task 1


1. Create a symbolic link to matrix.txt
` ln -L matrix.txt linktomatrix `  ln creates links, -L flag creates a 'logical' or symbolic link.



2. Sum the values in matrix.txt

``` SUM=0 ```  Sets the reference value to 0

``` for item in `cat matrix.txt | tr ';' ' '`; do ``` Replaces ; with a space so that the for loop will recognise the values. 
``` let SUM=SUM+${item}
done ``` adds the value of $item to the running total from the last cycle.
```
echo "The sum of the matrix values are: ${SUM}"
``` prints the sum, which is 68.

3. Print the maximum value.

```
 MAX=0
for item in `cat matrix.txt | tr ';' ' '`; do
```
Same as above but adding if statement.
```
if [ ${item} -gt ${MAX} ]
then
MAX=${item}
fi
```
Which tests $item against the value of $MAX and updates it if $item is larger.

```
done
echo "The maximum value is: ${MAX}"
```
Close loop and print result. 
```The maximum value is: 9```


4. Print the minimum value.

```
MIN=99
for item in `cat matrix.txt | tr ';' ' '`; do
if [ ${item} -lt ${MIN} ]
then
MIN=${item}
fi
done
echo "The minimum value is: ${MIN}"
```
Same as above but replacing $MAX vairable for $MIN and the logic test is for 'less than' instead of 'greater than'.

``` MIN=99 ```
Is key as for this to work the reference value for $MIN must start higher than any of the matrix values. As all these vlaues are single digits using a double digit number ensures the starting value will always be higher.

5. Use 'seq' to print all odd numbers from 1 to 100

``` seq -f "My odd number is $g" 1 2 100 ``` 
Seq will print a sequence of numbers with the defined format string separating them with the -f flag. The trainling numbers are the delimiters. 1 is the starting value, 2 is the increment (skips the evens 1+2 = 3 etc.) 100 is the upper limit.

