#!/bin/sh

# Force use of NeoVim
alias vim="nvim"
alias v="nvim"

# Lazy
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias cdf='cd ~/.dotfiles'

alias cls="clear"
alias :q='exit'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias here='ofd' # Open current dir with finder
alias count="wc -l"
alias forgot="tldr"
alias icat="kitty +kitten icat" # display image on terminal

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"
alias cleanup_nodemodules='tree -dfi -P "*./node_modules$" --matchdirs | grep -e /node_modules$ | xargs rm -rf'
alias cleanup_javabuilds='tree -dfi -P "*./target$" --matchdirs | grep -e /target$ | xargs rm -rf'
alias cleanup_serverless='tree -adfi -P "*.serverless$" --matchdirs | grep -e /.serverless$ | xargs rm -rf'
alias cleanup_jupyter='tree -adfi -P "*.ipynb_checkpoints$" --matchdirs | grep -e /.ipynb_checkpoints$ | xargs rm -rf'


# Time tracker (https://tailordev.github.io/Watson/)
alias track="watson"

# Tmux aliases
alias td="tmux has-session -t default & tmux attach -t default || tmux new-session -s default"
alias ide="tmux new-session -s ide"

alias tls='tmux ls'
alias tat="tmux attach -t"
alias tns="tmux new-session -s"
alias tks="tmux kill-session -t"
alias tkf="tmuxkillfzf"
alias tksv="tmux kill-server"


# Git aliases
alias g="git"
alias ungit="find . -name '.git' -exec rm -rf {} \;" # Remove git from a project
alias gst="git status"
alias gsa="git status -uall"
alias gl="git pull"
alias glr="git pull --rebase"
alias gsp='git pull --rebase --autostash' # Git stash, pull and apply stash
alias gp="git push"
alias gdf="g d"
alias gfl="git fetch --prune && git pull"
alias gcf='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always | diff-so-fancy" --pointer="B" | xargs git checkout'


# Utiltiy Aliases
alias topcpu='top -o cpu'  # CPU
alias topmem='top -o rsize' # Memory


# Kubernetes aliases
alias k="kubectl"
alias kgproj='gcloud info --format="value(config.project)"'
alias kgctx="kubectl config get-contexts"
alias ksctx="kubectl config use-context"

alias kgpoan="kubectl get po --all-namespaces"
alias kgpo="kubectl get po --all-namespaces"
alias kgsvc="kubectl get svc --all-namespaces"

alias kdesc="kubectl describe --all-namespaces"
alias kgpog="kubectl get po --all-namespaces | grep"
alias kgrep="kubectl get pod,svc -o wide --all-namespaces | grep"
# alias klogsf="kubectl get po --all-namespaces | fzf | awk '{print \$2}' | xargs kubectl logs"
alias klogs="kubectl logs --all-namespaces"
alias kport="kubectl port-forward" # kport <pod_name> <my_port>:<pod_port>

alias krollstatus="kubectl rollout status deployments"
alias krollback="kubectl rollout undo deployments"

alias knodersc="kubectl get nodes --no-headers | awk '{print \$1}' | xargs -I {} sh -c 'echo {}; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo'"
alias kpodrsc="kubectl get po --all-namespaces -o=jsonpath=\"{range .items[*]}{.metadata.namespace}:{.metadata.name}{'\n'}{range .spec.containers[*]} {.name} - {.resources.requests.cpu} - {.resources.requests.memory}{'\n'}{end}{'\n'}{end}\""

alias kscaleup="kubectl scale --replicas=1 deploy"
alias kscaledown="kubectl scale --replicas=0 deploy"

alias kpodimg="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{\"\n\"}{.metadata.name}{\":\t\"}{range .spec.containers[*]}{.image}{\", \"}{end}{end}' | sort"
alias kpodvrs="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{\"\n\"}{.metadata.name}{\":\t\"}{range .spec.containers[*]}{.image}{end}{end}' | grep"

alias kdpod="kubectl delete po"
# alias kdpof="kubectl get po | fzf | awk '{print \$1}' | xargs kubectl delete pod"

alias dps="docker ps"
alias dpsa="docker ps -a"
alias drm="docker rm"
alias drmi="docker rmi"

