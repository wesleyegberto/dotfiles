#!/usr/bin/env bash

silent_background() {
    ({ 2>&3 "$@"& } 3>&2 &>/dev/null &)
    disown &>/dev/null # Prevent whine if job has already completed
}

# === Network ===
ipexternal() {
    echo "External IP: $(curl --silent https://ifconfig.me)"
}

ipforwarded() {
    echo "Forwarded IP: $(curl --silent https://ifconfig.me/forwarded)"
}

# Usage: `rss 12345`
rss() {
    PID=$1
    RSS=`ps -o rss ${PID} | tail -n1`
    RSS=`bc <<< "scale=1; ${RSS}/1024"`
    echo "RSS memory (PID: ${PID}): ${RSS}M"
}
