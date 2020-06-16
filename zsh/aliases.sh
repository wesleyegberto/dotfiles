#!/bin/sh

# Force use of NeoVim
alias vim="nvim"
alias v="nvim"

# Lazy
alias ..='cd ..'
alias cd..='cd ..'
alias cls="clear"
alias :q='exit'
alias grep='grep --color=auto'
alias here='ofd' # Open current dir with finder

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Time tracker (https://tailordev.github.io/Watson/)
alias track="watson"

# Tmux funtions
# `tcd` : start a tmux session using current dirname as session name
# `tm` : find a tmux session using FZF
# `tm name` : attach to an existing session <name> or creates a new one
# `tc` : choose a tmux session or creates a new one
# `tfp` : find a Tmux pane

# Tmux aliases
alias td="tmux has-session -t default & tmux attach -t default || tmux new-session -s default"
alias ide="tmux new-session -s ide"

alias tls='tmux ls'
alias tat="tmux attach -t $1"
alias tns="tmux new-session -s $1"
alias tks="tmux kill-session -t $1"
alias tkf="tmuxkillfzf"
alias tksv="tmux kill-server"


# Git aliases
alias g="git"
alias gst="git status"
alias gsa="git status -uall"
alias gl="git pull"
alias glr="git pull --rebase"
alias gp="git push"
alias gck="git checkout $1"

alias gdf="git diff --color | diff-so-fancy"
alias gdfh="git diff --color HEAD^ HEAD | diff-so-fancy"
# diff grep
alias gdg="git ls-files -m | grep $1 | xargs git diff --color | diff-so-fancy"
alias gdfz="git ls-files -m | fzf | xargs git diff --color | diff-so-fancy"
alias gdv="git difftool -y -t vimdiff"

# 'checkout grep'
alias gcg="git ls-files -m | grep $1 | xargs git checkout"
alias gcf="git ls-files -m | fzf | xargs git checkout"
# add grep
alias gag="git ls-files -m -o --exclude-standard | grep $1 | xargs git add --all"
alias gaf="git ls-files -m -o --exclude-standard | fzf | xargs git add --all"

alias glg="git log --graph --pretty=format:'%Cred%h%Creset %C(bold blue)%an%C(reset) - %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# show what I did today
alias glt='git log --reverse --no-merges --branches=* --date=local --after="yesterday 11:59PM" --author="`git config --get user.name`"'
# show most changed files
alias gchurn="git log --all -M -C --name-only --format='format:' \"$@\" | sort | grep -v '^$' | uniq -c | sort | awk 'BEGIN {print \"count\tfile\"} {print $1 \"\t\" $2}' | sort -g;"


# Kubernetes aliases
alias k="kubectl"
alias kproject='gcloud info --format="value(config.project)"'
alias kcontext="kubectl config get-contexts"
alias ksetcontext="kubectl config use-context $1"

alias kgpoan="kubectl get po --all-namespaces"
alias kgpo="kubectl get po"
alias kgsvc="kubectl get svc"
alias kdpo="kubectl delete po $1"

alias kdesc="kubectl describe $1"
alias kgpog="kubectl get po | grep $1"
alias kgrep="kubectl get pod,svc -o wide | grep $1"
alias klogsf="kubectl get po --all-namespaces | fzf | awk '{print \$2}' | xargs kubectl logs"
alias klogs="kubectl logs --all-namespaces $1"
alias kport="kubectl port-forward $1" # kport <pod_name> <my_port>:<pod_port>

alias krollstatus="kubectl rollout status deployments $1"
alias krollback="kubectl rollout undo deployments $1"

alias knodersc="kubectl get nodes --no-headers | awk '{print \$1}' | xargs -I {} sh -c 'echo {}; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo'"
alias kpodrsc="kubectl get po --all-namespaces -o=jsonpath=\"{range .items[*]}{.metadata.namespace}:{.metadata.name}{'\n'}{range .spec.containers[*]}  {.name} - {.resources.requests.cpu} - 	{.resources.requests.memory}{'\n'}{end}{'\n'}{end}\""

alias kscaleup="k scale --replicas=1 deploy $1"
alias kscaledown="k scale --replicas=0 deploy $1"

alias kpodimg="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' | sort"
alias kpodvrs="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{\"\n\"}{.metadata.name}{\":\t\"}{range .spec.containers[*]}{.image}{end}{end}' | grep $1"
alias kpoddel="k get pods | grep $1 | awk '{print $1}' | xargs kubectl delete pod"
