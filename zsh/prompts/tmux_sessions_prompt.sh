#!/bin/sh
# Boost Productivity with tmux and iTerm2 workspace
# http://www.huyng.com/posts/productivity-boost-with-tmux-iterm2-workspaces/

# First off, place the above script in a location that’s accessible to iTerm2 (I usually place it in ~/.dotfiles/tmux.start.sh
export PATH=$PATH:/usr/local/bin

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0

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