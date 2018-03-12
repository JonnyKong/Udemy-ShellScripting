#!/bin/bash

# Generate random number
NUM=${RANDOM}
echo "Random number ${NUM} generated"
logger -p user.info "Random number ${NUM} generated"