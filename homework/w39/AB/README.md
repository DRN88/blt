# Homework - Week 39

## Task 1

### 1. Create a symbolic link to matrix.txt. Call the symbolic link as supermatrix.txt

```
ln -s matrix.txt supermatrix.txt
```

'ln -s' is the command to create a soft-link, followed by the source (real) file and the destination (symlink)

### 2. Print the sum of all values

```
SUM="$(grep -o '[[:digit:]]' matrix.txt | awk '{ sum += $1 } END { print sum }')"
echo "The sum of the matrix values are: ${SUM}"
```

First we need to get the numbers out of matrix.txt in a list format, 'grep -o' matches only what we specify, nothing else. '[[:digit:]]' matches only numbers. The two combined spit out a list of all the numbers without the semicolon.

We now pipe the output of this command into awk. 'sum' is a variable that we have created, its value is increased by the value from each line of our grep output. 'END' stops this process when all input has been read (namely the last line of the grep output). The variable 'sum' is then printed, prepended by the specified text from task1.sh.

### 3. Print the maximum value

```
MAX="$(grep -o '[[:digit:]]' matrix.txt | sort | tail -n 1)"
echo "The maximum value is: ${MAX}"
```

We get the list of numbers like we did before but then sort them into ascending order, then show the last number in the list which will always be the largest.

### 4. Print the minimum value

```
MIN="$(grep -o '[[:digit:]]' matrix.txt | sort | head -n 1)"
echo "The minimum value is: ${MIN}"
```

Same as the command before, except we show the first number in the list which will always be the smallest.

### 5. Use seq to print all odd numbers from 1 to 100

```
seq 1 2 99
```

From 'man seq' *seq [OPTION]... FIRST INCREMENT LAST* So we start at '1', increment by '2' to skip all even numbers, and finish at '99' which is the last odd number in the range.

## Task 2

### 1. Download evilcorp_users1.csv using wget or curl.

```
wget -N https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv
```

Using wget with the '-N' flag will not re-retrieve files unless they are newer than the local one, thereby ensuring there is only ever one instance of the .csv

### 2. List all Males where their firstname starts with 'C'

```
egrep ",Male," evilcorp_users1.csv | egrep "^[[:alnum:]]*,C[[:alpha:]]*,"
```

First we use egrep to find all the Males, then pipe the output to egrep again to find the first names starting with 'C'.

'^' denotes the beginning of the line, it's a good starting place as the first name is only in the second column of the .csv. We don't care what's in the first column so [[:alnum:]]* matches all alphnumeric characters in that field. C[[:alpha:]]* then matches all alphabetical names starting with 'C' in the second column.

### 3. List all Females from London or Peterborough who born between 1980-1989

```
egrep ",Female,[0-9]{2}/[0-9]{2}/198[0-9]," evilcorp_users1.csv | egrep ",(London|Peterborough),"
```

The date of birth field is right next to the gender field. If a date format is dd/mm/yyyy use egrep to show any two ({2}) numbers for dd or mm, then any year beginning with 198.

An 'or' statement can be created by putting the options in brackets and separating each possible option with a pipe '|'.

### 4. List all Doctors who works for Yotz or Devcast or Aimbu

```
egrep "^Dr," evilcorp_users1.csv | egrep ",(Yotz|Devcast|Aimbu),"
```

Using again what we learned in the previous two tasks

### 5. List all Females who born in Q2 and Q4

```
egrep ",Female,[0-9]{2}/(0[4-6]|1[0-2])/[0-9]{4}," evilcorp_users1.csv
```

The different part here is the month field, 0[4-6] means we can have the fourth, fifth or sixth month. We then have a pipe '|' (or) we can have the tenth, eleventh or twelvth month as denoted by 1[0-2]. In both cases the first number is the first character and the part in brackets is the small range the second number is allowed to be.

### 6. List all Doctors who are Males and every octet in their IP address has only one digit, ie: n.n.n.n

This is a trick question! There are no users with IP addresses with only one digit in each octet! However, as an example, the following will show the same thing but for users with two digits in each octet:

```
egrep "^Dr," evilcorp_users1.csv | egrep ",Male," | egrep ",[1-9]{2}\.[0-9]{2}\.[0-9]{2}\.[0-9]{2}$"
```

### 7. List all the doctor males who has 7 or shorter local-part in their email address. (the field until the '@' sign) and their email ends with '.com'

```
egrep "^Dr," evilcorp_users1.csv | egrep ",Male," | egrep ",[[:alpha:]]{0,7}@[[:alpha:]]*.com"
```

To break down the egrep command for the email address: [[:alpha:]]{0,7}@ refers to there being between zero and seven alphanumeric characters before the @ sign. [[:alpha:]]*.com refers to there being any amount of alphanumeric characters after the @ sign as long as they are appended with a .com.

## Task 3

### 1. Download evilcorp_users1.csv using wget or curl.

Repeat of Task 2 #1? The answer is the same at least:

```
wget -N https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv
```

### 2. Count the cities. Print the results in the following format: <city> found <count> times. Sort by the count Ascending. Display only the first 20 results.

```
tail -n +2 evilcorp_users1.csv | awk -F "," '{ print $8 }' | sort | uniq -c | sort -n | awk '{print $2" found "$1" times."}' | head -n 2
```

This one was fun... First we output the contents of the .csv cutting off the first row with the column descriptions in it: (tail -n +2 evilcorp_users1.csv)

Next we use awk to list out everything in the eighth column (city): (awk -F "," '{ print $8 }')

Now we sort everything alphabetically, it will group all the cities together (sort)

We use uniq -c to count all the cities, the format will have the number of times that value occurs, followed by a space, then the city name.

We now sort again using the -n flag to sort by the numeric values we gained with uniq. The default sort is ascending. We need this for the final step.

Using awk, we print the data as per the task requirements, uniq put the values in the wrong order so we print the 2nd ($2) followed by the 1st ($1).

Finally we print the first 20 results, they're already in ascending order thanks to the previous 'sort -n'

### 3. A company called 'Gosport' has been sold to 'Gigazoom'. Please update their company name

```
sed -r -i -e 's/,Gosport,/,Gigazoom,/' evilcorp_users1.csv
```

-r is for regex, -i is to edit the file in place, -e is the command we want to run, s/what we we to replace/what we're replacing it with/

### 4. All 'Sales Associate'-s been sacked. Please delete them.

```
sed -r -i -e '/Sales Associate,/ d' evilcorp_users1.csv
```

When specifying 'd' after the string, all matching lines are deleted.

### 5. Female 'Research Nurse'-ses got a promotion. They are now 'Senior Research Nurse'

```
sed -r -i -e 's/,Research Nurse,/,Senior Research Nurse,/' evilcorp_users1.csv
```

Same process as 3.

### 6. Women lie about their age. Set all females birth date to 01/01/1988 who is older than 1988.

```
sed -r -i -e 's/,[0-9]{2}\/[0-9]{2}\/(196[0-9]|197[0-9]|198[0-7]),/,01\/01\/1988,/' evilcorp_users1.csv 
```

There might be a neater way of denoting all dates before 1988, as it is I have matched all dates in the 1960's and 1970's and all dates from 1980 to 1987 in the first part of the sed command. The second half simply replaces everything matched in the date field with 01/01/1988. Beware matching fields containing forward slashes using sed! You need to prepend each one with a backslash.

### 7. Remove all 'Graphic Designer'-s ip address

```
sed -r -i -e '/,Graphic Designer,/ s/,[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$//' evilcorp_users1.csv
```

This one is a bit different, first we match what targets to modify but we then modify a completely different field. Note, we pick out 'Graphic Designer' before running the s/ part of sed. And opposed to replacing what we match (the IP address), because there is nothing between the last two forward slashes, nothing is what replaces the IP address.

### 8. There has been an error with our data. Rename all 'David'-s to 'Danielle' who are female

```
sed -r -i -e '/,Female,/ s/,David/,Danielle/' evilcorp_users1.csv
```

Just like the previous task. Filter, find and replace all using sed.

### 9. Restructure our CSV to the following: firstname,lastname,city,gender

awk can output the contents of the csv file as required but cannot overwrite the contents:

```
awk -F "," '{print $2","$3","$8","$4}' evilcorp_users1.csv
```

I'm sure there must be a way to achieve this using sed but I haven't got a clue how to do it. So, enjoy my amazing ghetto workaround!

```
awk -F "," '{print $2","$3","$8","$4}' evilcorp_users1.csv > evilcorp_users1_temp && rm evilcorp_users1.csv && mv evilcorp_users1_temp evilcorp_users1.csv
```


~FIN
