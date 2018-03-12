#!/bin/bash

DATE=$(date "+%Y-%m-%d")

for FILE in *.jpg
do
    mv ${FILE} ${DATE}-${FILE}
done