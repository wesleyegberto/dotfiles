#!/usr/bin/env bash

# usage: `generate_traffic http://httpbin.org/get 10`
generate_traffic() {
    local URL=$1
    local MAX_CONCURRENCY=$2
    local SLEEP_TIME=$3

    if [ -z "$MAX_CONCURRENCY" ]; then
        MAX_CONCURRENCY=10
    fi

    if [ -z "$SLEEP_TIME" ]; then
        SLEEP_TIME=10
    fi

    while true
    do
        END=$((RANDOM % MAX_CONCURRENCY + 1 ))
        echo "Concurrency: $END"
        for i in $(seq $END)
        do
            echo "Requesting $i"
            curl "$URL" &
        done
        sleep $SLEEP_TIME
    done
}

# usage: `stress_command 'curl http://httpbin.org/get' 10 1`
stress_command() {
    local command=$1
    local MAX_CONCURRENCY=$2
    local SLEEP_TIME=$3

    if [ -z "$MAX_CONCURRENCY" ]; then
        MAX_CONCURRENCY=10
    fi

    if [ -z "$SLEEP_TIME" ]; then
        SLEEP_TIME=10
    fi

    while true
    do
        END=$((RANDOM % MAX_CONCURRENCY + 1 ))
        echo "Concurrency: $END"
        for i in $(seq $END)
        do
            echo "Requesting $i"
            silent_background eval "silent_background $command"
        done
        sleep $SLEEP_TIME
    done
}

# usage: `ab_get_test http://httpbin.org/get 1000 10`
ab_get_test() {
    local URL=$1
    local total_requests=$2
    local concurrency=$3

    if [ -z "$total_requests" ]; then
        total_requests=5000
    fi
    if [ -z "$concurrency" ]; then
        concurrency=100
    fi

    ab -n "$total_requests" -c "$concurrency" "$URL"
}

# usage: `ab_post_test http://httpbin.org/post payload.json 5000 10`
ab_post_test() {
    local URL=$1
    local payload_path=$2
    local total_requests=$3
    local concurrency=$4

    if [ -z "$total_requests" ]; then
        total_requests=5000
    fi
    if [ -z "$concurrency" ]; then
        concurrency=100
    fi

    ab -n "$total_requests" -c "$concurrency" -T 'application/json' -p "$payload_path" "$URL"
}
