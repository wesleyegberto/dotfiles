#!/bin/sh

# usage: `generate_traffic http://httpbin.org/get 10`
generate_traffic() {
    local URL=$1
    local MAX_CONCURRENCY=$2
    local SLEEP_TIME=$3

    if [ -z "$MAX_CONCURRENCY" ]; then
        MAX_CONCURRENCY=10
    fi
    j
    if [ -z "$SLEEP_TIME" ]; then
        SLEEP_TIME=10
    fi

    while true
    do
        END=$((RANDOM % $MAX_CONCURRENCY + 1 ))
        echo "Concurrency: $END"
        for i in $(seq $END)
        do
            echo "Requesting $i"
            curl "$URL" &
        done
        sleep $SLEEP_TIME
    done
}