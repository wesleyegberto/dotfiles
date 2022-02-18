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

# Create a new branch from the current branch to hotfix a bug and open PR
hotfix_new() {
    if [ -z "$(git status --porcelain)" ]; then
        echo "Nothing to hotfix"
        return
    fi

    local current_branch
    current_branch="$(git symbolic-ref --short HEAD)"
    if [ -z "$current_branch" ]; then
        echo "No branch found"
        return
    fi

    local fix_message="$2"
    if [ -z "$fix_message" ]; then
        echo "Please provide a title for the hotfix"
        return
    fi

    git checkout -b hotfix/"$current_branch"
    git add .
    git commit -m "$fix_message"
    git push
    gh pr create -B "$current_branch" -t "$fix_message"
}