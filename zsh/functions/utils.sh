#!/usr/bin/env bash

# === Network ===
ipexternal() {
    echo "External IP: $(curl --silent https://ifconfig.me)"
}

ipforwarded() {
    echo "Forwarded IP: $(curl --silent https://ifconfig.me/forwarded)"
}

# === Git ===
prcreate() {
    if [ -z "$2" ]; then
        # If title is not provided then use autofill
        gh pr create -B "$1" -f
    else
        # Otherwise use provided title
        gh pr create -B "$1" -t "$2"
    fi
}

prmerge() {
    gh pr merge --merge --delete-branch=true "$1"
}

prlist() {
    gh pr list --state open
}

prcheck() {
    gh pr checkout "$1" && gh pr diff
}
