# Homework - Week 39

## Task 1

### 1. Create a symbolic link to matrix.txt. Call the symbolic link as supermatrix.txt

`ln -s matrix.txt supermatrix.txt`

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

`seq 100 | egrep "[1-9][13579]" | awk '{print "My odd number is " $1}'`

First we generate the full list of numbers from 1 to 100 using 'sed 100'

Next we filter out all the even numbers using egrep where [1-9] is the first digit and [13579] is the second, all numbers ending in 1, 3, 5, 7, or 9 are odd.

Finally we prepend "My odd number is" to the beginning of every line using awk.

## Task 2

### 1. Download evilcorp_users1.csv using wget or curl.

`wget -N https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv`

Using wget with the '-N' flag will not re-retrieve files unless they are newer than the local one, thereby ensuring there is only ever one instance of the .csv

### 2. List all Males where their firstname starts with 'C'

`egrep ",Male," evilcorp_users1.csv | egrep "^[[:alnum:]]*,C[[:alpha:]]*,"`

First we use egrep to find all the Males, then pipe the output to egrep again to find the first names starting with 'C'.

'^' denotes the beginning of the line, it's a good starting place as the first name is only in the second column of the .csv. We don't care what's in the first column so [[:alnum:]]* matches all alphnumeric characters in that field. C[[:alpha:]]* then matches all alphabetical names starting with 'C' in the second column.

### 3. List all Females from London or Peterborough who born between 1980-1989

`egrep ",Female,[0-9]{2}/[0-9]{2}/198[0-9]," evilcorp_users1.csv | egrep ",(London|Peterborough),"`

The date of birth field is right next to the gender field. If a date format is dd/mm/yyyy use egrep to show any two ({2}) numbers for dd or mm, then any year beginning with 198.

An 'or' statement can be created by putting the options in brackets and separating each possible option with a pipe '|'.

### 4. List all Doctors who works for Yotz or Devcast or Aimbu


