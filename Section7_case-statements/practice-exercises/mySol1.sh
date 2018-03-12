#!/bin/bash

case $1 in
    start)
        /tmp/sleep­-walking­-server &
        ;;
    stop)
        kill $(cat /tmp/sleep-walking-server.pid)
        ;;
    *)
        echo "Usage: $0 start|stop"
        exit1
        ;;
esac