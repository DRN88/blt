#!/bin/bash

### Tasks

### 1. Download evilcorp_users1.csv using wget or curl.
# Only keep one instance of evilcorp_users1.csv if I rerun task2.sh
# https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv
wget -4 https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv

### 2. Count the cities. Print the results in the following format:
### <city> found <count> times. Sort by the count Ascending. Display only the
### first 20 results.
cut -d ',' -f 8 evilcorp_users1.csv | uniq -c | sort -bn | uniq | head -n20 | awk '{print $2 "Found " $1 " Times"}'



### 3. A company called 'Gosport' has been sold to 'Gigazoom'. Please update
### their company name
sed -ir 's/,Gosport,/,Gigazoom,/' evilcorp_users1.csv


### 4. All 'Sales Associate'-s been sacked. Please delete them.
sed -ir 's/,Sales Associate,/ d' evilcorp_users1.csv


### 5. Female 'Research Nurse'-ses got a promotion. They are now 'Senior Research Nurse'
sed -ir ' /,Female,/ s/,Research Nurse,/,Senior Research Nurse,/' evilcorp_users1.csv



### 6. Women lie about their age. Set all females birth date to 01/01/1988 who
### is older than 1988.
sed -ir '/,Female,/ s/,[0-9]{2}\/[0-9]{2}\/19[0-7][0-9],/,1\/01\/1988,/' evilcorp_users1.csv


### 7. Remove all 'Graphic Designer'-s ip address
sed -ir '/,Graphic Designer,/ s/,[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$//' evilcorp_users1.csv



### 8. There has been an error with our data. Rename all 'David'-s to 'Danielle'
### who are female
sed -ir '/,Female,/ s/,David,/,Danielle,/' evilcorp_users1.csv


### 9. Restructure our CSV to the following:
### firstname,lastname,city,gender
 cat evilcorp_users1.csv | awk -F ',' '{print $2","$3","$8","$4}' > evilcorp_users1.csv














#
