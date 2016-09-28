#!/bin/bash

# Create 1 file and 1 folder if they don't exiist
# set the permission of the file to: 754
# set the folder permission to 750
# 
# work with ifs
#
# Filename:  mytestfile1.txt
# Foldername: myfolder1
#
F="mytestfile1.txt"
D="myfolder1"

if [ ! -d ${D} ]; then
    mkdir -m 0750 ${D}
fi

if [ ! -f ${F} ]; then
    touch ${F}; chmod 0754 ${F}
fi
