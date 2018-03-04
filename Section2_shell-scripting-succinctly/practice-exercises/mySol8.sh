#!/bin/bash
#!/bin/bash

for FILE in $@
do
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
done