#!/bin/bash

read -p "Input file or directory: " FILENAME

if [ -f ${FILENAME} ]
then
    echo "${FILENAME} is a regular file"
    exit 0
elif [ -d ${FILENAME} ]
then
    echo "${FILENAME} is a directory"
    exit 1
else
    echo "${FILENAME} is not a file nor a directory"
    exit 2
fi
