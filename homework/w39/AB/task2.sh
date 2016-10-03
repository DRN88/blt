#!/bin/bash

### Tasks

### 1. Download evilcorp_users1.csv using wget or curl.
# Only keep one instance of evilcorp_users1.csv if I rerun task2.sh
# https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv
wget -N https://raw.githubusercontent.com/DRN88/blt/master/w37/evilcorp_users1.csv

### 2. List all Males where their firstname starts with 'C'
egrep ",Male," evilcorp_users1.csv | egrep "^[[:alnum:]]*,C[[:alpha:]]*,"


### 3. List all Females from London or Peterborough who born between 1980-1989
egrep ",Female,[0-9]{2}/[0-9]{2}/198[0-9]," evilcorp_users1.csv | egrep ",(London|Peterborough),"


### 4. List all Doctors who works for Yotz or Devcast or Aimbu
egrep "^Dr," evilcorp_users1.csv | egrep ",(Yotz|Devcast|Aimbu),"


### 5. List all Females who born in Q2 and Q4
egrep ",Female,[0-9]{2}/(0[4-6]|1[0-2])/[0-9]{4}," evilcorp_users1.csv


### 6. List all Doctors who are Males and every octet in their IP address has
### only one digit, ie: n.n.n.n
egrep "^Dr," evilcorp_users1.csv | egrep ",Male," | egrep ",[1-9]{2}\.[0-9]{2}\.[0-9]{2}\.[0-9]{2}$"


### 7. List all the doctor males who has 7 or shorter local-part in their email address.
### (the field until the '@' sign) and their email ends with '.com'
egrep "^Dr," evilcorp_users1.csv | egrep ",Male," | egrep ",[[:alpha:]]{0,7}@[[:alpha:]]*.com"
