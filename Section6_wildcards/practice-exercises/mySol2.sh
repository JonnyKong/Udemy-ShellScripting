#!/bin/bash

DATE=$(date "+%Y-%m-%d")

# Prompt the user for file extension and prepend
read -p "Input extension:" EXTENSION
read -p "Input prepend (Press ENTER for ${DATE}):" PREPEND
if [ -z ${PREPEND} ]
then
    PREPEND=${DATE}
fi

# Rename files
for FILE in *.${EXTENSION}
do
    NEWFILE=${PREPEND}-${FILE}
    mv ${FILE} ${NEWFILE}
    echo "Renaming ${FILE} to ${NEWFILE}"
done