#!/bin/bash

function file_count() {
    local NUM=$(ls | wc -l)
    local DIR=$(basename "$(pwd)")
    echo "${DIR} have ${NUM} files"
}

file_count