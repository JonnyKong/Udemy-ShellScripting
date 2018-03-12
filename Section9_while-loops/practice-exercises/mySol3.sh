#!/bin/bash

while true
do
    echo "1. Show disk usage"
    echo "2. Show uptime"
    echo "3. Show all users"
    read -p "Input command: (or enter q to quit) " COMMAND

    case ${COMMAND} in
        1)
            df
            ;;
        2)
            uptime
            ;;
        3)
            who
            ;;
        q)
            break
            ;;
        *)
            echo "Invalid Option"
            ;;
    esac
    
    echo
done
echo "Goodbye!"