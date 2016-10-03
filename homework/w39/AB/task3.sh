#!/bin/bash

### Tasks

### 1. Download evilcorp_users1.csv using wget or curl.
# Only keep one instance of evilcorp_users1.csv if I rerun task2.sh
# https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv
wget -N https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv

### 2. Count the cities. Print the results in the following format:
### <city> found <count> times. Sort by the count Ascending. Display only the
### first 20 results.
tail -n +2 evilcorp_users1.csv | awk -F "," '{ print $8 }' | sort | uniq -c | sort -n | awk '{print $2" ""found"" "$1" ""times""."}' | head -n 20


### 3. A company called 'Gosport' has been sold to 'Gigazoom'. Please update
### their company name
sed -r -i -e 's/,Gosport,/,Gigazoom,/' evilcorp_users1.csv


### 4. All 'Sales Associate'-s been sacked. Please delete them.
sed -r -i -e '/Sales Associate,/ d' evilcorp_users1.csv


### 5. Female 'Research Nurse'-ses got a promotion. They are now 'Senior Research Nurse'
sed -r -i -e 's/,Research Nurse,/,Senior Research Nurse,/' evilcorp_users1.csv


### 6. Women lie about their age. Set all females birth date to 01/01/1988 who
### is older than 1988.
sed -r -i -e 's/,[0-9]{2}\/[0-9]{2}\/(196[0-9]|197[0-9]|198[0-7]),/,01\/01\/1988,/' evilcorp_users1.csv


### 7. Remove all 'Graphic Designer'-s ip address
sed -r -i -e '/,Graphic Designer,/ s/,[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$//' evilcorp_users1.csv


### 8. There has been an error with our data. Rename all 'David'-s to 'Danielle'
### who are female
sed -r -i -e '/,Female,/ s/,David/,Danielle/' evilcorp_users1.csv


### 9. Restructure our CSV to the following:
### firstname,lastname,city,gender
awk -F "," '{print $2","$3","$8","$4}' evilcorp_users1.csv > evilcorp_users1_temp && rm evilcorp_users1.csv && mv evilcorp_users1_temp evilcorp_users1.csv
