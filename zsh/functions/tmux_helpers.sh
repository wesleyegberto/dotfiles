#!/bin/sh

# FZF
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.
tm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}


# Creates a Tmux session using current dirname as session name
tcd() {
    tmux new-session -s $(basename "$PWD")
}

# Creates a Tmux session using a selected folder from given path
tfd() {
    tmux new-session -s $(ls $1 | fzf)
}

# Open a given folder in Tmux and use its name as session name
# Usage: `tmf <PATH>`
tmf() {
    local _folder
    local _sessionName
    if [ $1 ]; then
        _folder=$1
    else
        _folder=$PWD
    fi
    _sessionName=$(basename "$_folder")
    tmux new-session -s "$_sessionName" -n "$_sessionName" -d "cd $_folder; zsh"
    tmux attach-session -t "$_sessionName"
}

# Kill a Tmux session using FZF
tmuxkillfzf () {
    local sessions
    sessions="$(tmux ls|fzf --exit-0 --multi)" || return $?
    local i
    for i in "${(f@)sessions}"
    do
        [[ $i =~ '([^:]*):.*' ]] && {
            echo "Killing $match[1]"
            tmux kill-session -t "$match[1]"
        }
    done
}


# ftpane - switch pane (@george-b)
# In tmux.conf: bind-key 0 run "tmux split-window -l 12 'bash -ci tsp'"
tsp() {
    local panes current_window current_pane target target_window target_pane
    panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_pane=$(tmux display-message -p '#I:#P')
    current_window=$(tmux display-message -p '#I')

    target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
        tmux select-pane -t ${target_window}.${target_pane}
    else
        tmux select-pane -t ${target_window}.${target_pane} &&
        tmux select-window -t $target_window
    fi
}


# Boost Productivity with tmux and iTerm2 workspace
# http://www.huyng.com/posts/productivity-boost-with-tmux-iterm2-workspaces/
tc() {
    local PS3 options SESSION_NAME
    # abort if we're already inside a TMUX session
    [ "$TMUX" = "" ] || exit 0

    # startup a "default" session if none currently exists
    tmux has-session -t default || tmux new-session -s default -d

    # present menu for user to choose which workspace to open
    PS3="Please choose your session: "

    options=($(tmux list-sessions -F "#S") "New Session" "Zsh")

    echo "Available sessions"
    echo "------------------"
    echo " "

    select opt in "${options[@]}"
    do
        case $opt in
            "New Session")
                read -p "Enter new session name: " SESSION_NAME
                tmux new -s "$SESSION_NAME"
                break
                ;;
            "Zsh")
                zsh --login
                break;;
            *)
                tmux attach-session -t $opt
                break
                ;;
        esac
    done
}
