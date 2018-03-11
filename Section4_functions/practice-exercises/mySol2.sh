#!/bin/bash

function file_count() {
    local DIR=$1
    local NUM=$(ls ${DIR} | wc -l)
    echo "${DIR}:"
    echo "${NUM}"
}

file_count /etc
file_count /var
file_count /usr/bin