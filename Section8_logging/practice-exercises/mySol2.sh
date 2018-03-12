#!/bin/bash

function log_random() {
    echo "Random number $1 generated"
    logger -i -t "randomly" -p user.info "Random number $1 generated"
}

log_random ${RANDOM}
log_random ${RANDOM}
log_random ${RANDOM}