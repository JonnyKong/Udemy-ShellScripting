#!/bin/bash

FILE=$1

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