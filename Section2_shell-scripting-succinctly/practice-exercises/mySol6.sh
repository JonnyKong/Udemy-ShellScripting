#!/bin/bash

read -p "Input file/directory name: " FILE

if [ -e ${FILE} ] 
then
    if [ -d ${FILE} ] 
    then
        echo "${FILE} is a directory"
    elif [ -f ${FILE} ] 
    then
        echo "${FILE} is a regular file"
    else
        echo "${FILE} belongs to other files"
    fi
else
    echo "${FILE} does not exist"
fi