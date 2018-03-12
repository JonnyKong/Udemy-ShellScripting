#!/bin/bash

read -p "Numbers of lines to read:" LINES_TO_READ

LINE_NUM=1
while read LINE
do
  echo "${LINE_NUM}: ${LINE}"
  if [ ${LINE_NUM} = ${LINES_TO_READ} ]
  then
    break
  fi
  ((LINE_NUM++))
done < /etc/passwd
