#!/bin/zsh
# indicate a job (for example, vim) has been backgrounded
# If there is a job in the background, display a ✱
spaceship_jobs() {
    local sj
    sj=$(jobs 2>/dev/null | tail -n 1)
    if [[ $sj == "" ]]; then
        echo ""
    else
        echo "$fg[red]✱"
    fi
}
