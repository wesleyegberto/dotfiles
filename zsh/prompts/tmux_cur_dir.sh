#!/bin/sh
# Creates a Tmux session using current directory name

tmux new-session -s $(basename "$PWD")