#!/bin/bash

FILE="/etc/shadow"

if [ -e ${FILE} ]
then
    echo "Shadow passwords are enabled."
fi

if [ -w ${FILE} ]
then
    echo "You have permissions to edit /etc/shadow."
else
    echo "You do NOT have permissions to edit /etc/shadow."
fi