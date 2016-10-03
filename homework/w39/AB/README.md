# Homework - Week 39

## Task 1

### 1. Create a symbolic link to matrix.txt. Call the symbolic link as supermatrix.txt

`ln -s matrix.txt supermatrix.txt`

'ln -s' is the command to create a soft-link, followed by the source (real) file and the destination (symlink)

### 2. Print the sum of all values

`grep -o '[[:digit:]]' matrix.txt | awk '{ sum += $1 } END { print "The sum of the matrix values are: " sum }'`

First we need to get the numbers out of matrix.txt in a list format, 'grep -o' matches only what we specify, nothing else. '[[:digit:]]' matches only numbers. The two combined spit out a list of all the numbers without the semicolon.

We now pipe the output of this command into awk. 'sum' is a variable that we have created, its value is increased by the value from each line of our grep output. 'END' stops this process when all input has been read (namely the last line of the grep output). The variable 'sum' is then printed, prepended by the specified text from task1.sh.
