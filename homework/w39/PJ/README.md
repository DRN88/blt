# H1  Week 39 Homework

## Task 1

## teststring##

1. Create a symbolic link to matrix.txt
` ln -L matrix.txt linktomatrix `  ln creates links, `-s` flag creates a symbolic link.



2. Sum the values in matrix.txt

` SUM=0 `  Sets the reference value to 0

` for item in `cat matrix.txt | tr ';' ' '`; do ` Replaces ; with a space so that the for loop will recognise the values. 
``` let SUM=SUM+${item}
done ``` adds the value of $item to the running total from the last cycle.
` echo "The sum of the matrix values are: ${SUM}" ` prints the sum, which is 68.

3. Print the maximum value.

``` MAX=0
for item in `cat matrix.txt | tr ';' ' '`; do ```
Same as above but adding if statement.
``` if [ ${item} -gt ${MAX} ]
then
MAX=${item}
fi ```
Which tests $item against the value of $MAX and updates it if $item is larger.

```done  
echo "The maximum value is: ${MAX}"```  
Close loop and print result. 


4. Print the minimum value.

``` MIN=99
for item in `cat matrix.txt | tr ';' ' '`; do
if [ ${item} -lt ${MIN} ]
then
MIN=${item}
fi
done
echo "The minimum value is: ${MIN}" ```
Same as above but replacing $MAX vairable for $MIN and the logic test is for 'less than' instead of 'greater than'.

` MIN=99 ` Is key as for this to work the reference value for $MIN must start higher than any of the matrix values.   As all these vlaues are single digits using a double digit number ensures the starting value will always be higher.

5. Use 'seq' to print all odd numbers from 1 to 100

``` seq -f "My odd number is $g" 1 2 100 ``` 
Seq will print a sequence of numbers with the defined format string separating them with the -f flag. The trainling numbers are the delimiters. 1 is the starting value, 2 is the increment (skips the evens 1+2 = 3 etc.) 100 is the upper limit.


## Task 2

1. Download evilcorp_users1.csv using wget or curl. Only keep one instance of evilcorp_users1.csv if I rerun task2.sh

``` wget -4 https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv ```

wget will download the specified URL. -4 tells it to use IPv4 (my home network runs IPv6 too). By defauly wget will overwrite a file of the same name if it exists.


2. List all Males where their firstname starts with 'C'.

``` egrep "^[[:alnum:]]*,C" evilcorp_users1.csv | grep ",Male,"``` 
First part uses egrep to match any alphanum characters in the first field followed by a C in the following field. It then puts the output back into egrep to filter out just the Males.

3. List all Females from London or Peterborough who born between 1980-1989.

``` egrep ",Female,[0-9]{2}/[0-9]{2}/198[0-9]," evilcorp_users1.csv | egrep "(,London,|,Peterborough,)" ```

The first part matches the Gender and Date fields that contain Female followed by a date ending in 198{_something_} which matches all femails borin in the 80s. It then pipes back to grep to filter out those that have a City of "london" or "peterborough".

4. List all Doctors who works for Yotz or Devcast or Aimbu

``` egrep "(,Yotz,|,Devcast,|,Aimbu,)" evilcorp_users1.csv | egrep "^Dr," ```

First part matches the Ccompany field containing _Yotz_ *or* _Devcast_ *or* _Aimbu_. The second part takes that output and looks for "Dr" in the first field to find the doctors.


5. List all Females who born in Q2 and Q4.

``` egrep ",Female,[0-9]{2}/(0[456]|1[012])/[0-9]{4}," evilcorp_users1.csv ```

This matches the Gender and date field where the Gender is Female and the date has the months 04,05,06 (Q2) or 10,11,12 (Q4).

6. List all Doctors who are Males and every octet in their IP address has only one digit, ie: n.n.n.n.

``` egrep ",[0-9]\.[0-9]\.[0-9]\.[0-9]$" evilcorp_users1.csv | egrep "^Dr" ```

This matches the last field in the line where there are only 4 numeric characters separated by periods. The second part filters that output for titles of "Dr" in the first field.

7. List all the doctor males who has 7 or shorter local-part in their email address.(the field until the '@' sign) and their email ends with '.com'

``` egrep "^Dr" evilcorp_users1.csv | egrep ",Male,"| egrep ",.{1,7}@.*\.com," ```

This first matches all Doctors, then filters that list for Males, and then for addresses with any character in positions 1-7 followed by an '@', followed by any characters with the field ending in '.com'.


## Task 3

1. Download evilcorp_users1.csv using wget or curl. Only keep one instance of evilcorp_users1.csv if I rerun task2.sh

``` wget -4 https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv ```

Same as in task 2

2. Count the cities. Print the results in the following format: <city> found <count> times. Sort by the count Ascending. Display only the first 20 results.

``` cut -d ',' -f 8 evilcorp_users1.csv | uniq -c | sort -bn | uniq | head -n20 | awk '{print $2 "Found " $1 " Times"}' ```

Cut selects the 8th field to get the Cities, then pipe to uniq with -c to get a count of the instances, sort numerically ignoring any leading whitespace. For some reason Uniq didn't remove duplicates so had pipe it back to uniq to get rid of the duplicates, the use head to select only the first 20 rows. Those 20 rows are piped to awk to print the fields in the reverse order with added strings.


3. A company called 'Gosport' has been sold to 'Gigazoom'. Please update their company name

``` sed -ir 's/,Gosport,/,Gigazoom,/' evilcorp_users1.csv ```

Use sed in insert mode (-i) and extended regex mode (-r). Match expression matches fields containing Gosport and replaces it with Gigazoom.

4. All 'Sales Associate'-s been sacked. Please delete them.

``` sed -ir 's/,Sales Associate,/ d/' evilcorp_users1.csv ```

The same as 3  but instead of replacing with a string  " d/" deletes the whole line.

5. Female 'Research Nurse'-ses got a promotion. They are now 'Senior Research Nurse'

``` sed -ir ' /,Female,/ s/,Research Nurse,/,Senior Research Nurse,/' evilcorp_users1.csv ```

Same as 3 but with added match expression before the command to select only the Females.

6. Women lie about their age. Set all females birth date to 01/01/1988 who is older than 1988.

``` sed -ir '/,Female,/ s/,[0-9]{2}\/[0-9]{2}\/19[0-7][0-9],/,1\/01\/1988,/' evilcorp_users1.csv ```

Matches Females with a birthdate in 1900 to 1979 range and replaces with 01/01/1988.  This should have worked according to previous examples and internet research shows syntax is correct. For some reason this ran with no errors but didn't update anything. Ran Grep for the match portion afterwards and got 468 hits still.


7. Remove all 'Graphic Designer'-s ip address

``` sed -ir '/,Graphic Designer,/ s/,[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$//' evilcorp_users1.csv ```

Same as 5 but replace string is blank and matches 1-3 digit long numeric strings separated by '.' and anchored to the end of the line.  Again.... this should work but didn't do anything when I ran grep after. No idea why. Internet searches and comparing to previous lesson solutions this syntax should work!

8. There has been an error with our data. Rename all 'David'-s to 'Danielle' who are female

``` sed -ir '/,Female,/ s/,David,/,Danielle,/' evilcorp_users1.csv ```

Same as 5 but this one matches and replaces the name field containing David. This uses the same syntax as 7 but this one works and 7 didn't... even more confused.


### 9. Restructure our CSV to the following: firstname,lastname,city,gender
``` cat evilcorp_users1.csv | awk -F ',' '{print $2","$3","$8","$4}' > evilcorp_users1.csv ```

cat streams out the contents of the current CSV and pipes it to awk which prints the selected fields in the correct order separated by commas, the ouputs it to overwrite the csv with the new format.


