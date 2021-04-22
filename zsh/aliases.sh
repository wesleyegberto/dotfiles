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
alias egrep='egrep --color=auto'
alias here='ofd' # Open current dir with finder
alias count="wc -l"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias cleanup_nodemodules='tree -dfi -P "./*node_modules$" --matchdirs | grep -e /node_modules$ | xargs rm -rf'

# Time tracker (https://tailordev.github.io/Watson/)
alias track="watson"

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
alias gdf="g dff"


# Kubernetes aliases
alias k="kubectl"
alias kgproj='gcloud info --format="value(config.project)"'
alias kgctx="kubectl config get-contexts"
alias ksctx="kubectl config use-context $1"

alias kgpoan="kubectl get po --all-namespaces"
alias kgpo="kubectl get po"
alias kgsvc="kubectl get svc"

alias kdesc="kubectl describe $1"
alias kgpog="kubectl get po | grep $1"
alias kgrep="kubectl get pod,svc -o wide | grep $1"
alias klogsf="kubectl get po --all-namespaces | fzf | awk '{print \$2}' | xargs kubectl logs"
alias klogs="kubectl logs --all-namespaces $1"
alias kport="kubectl port-forward $1" # kport <pod_name> <my_port>:<pod_port>
alias kshf="kubectl get po --all-namespaces | fzf | awk '{print \$2}' | xargs kubectl exec -it $1 sh"

alias krollstatus="kubectl rollout status deployments $1"
alias krollback="kubectl rollout undo deployments $1"

alias knodersc="kubectl get nodes --no-headers | awk '{print \$1}' | xargs -I {} sh -c 'echo {}; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo'"
alias kpodrsc="kubectl get po --all-namespaces -o=jsonpath=\"{range .items[*]}{.metadata.namespace}:{.metadata.name}{'\n'}{range .spec.containers[*]}  {.name} - {.resources.requests.cpu} - 	{.resources.requests.memory}{'\n'}{end}{'\n'}{end}\""

alias kscaleup="k scale --replicas=1 deploy $1"
alias kscaledown="k scale --replicas=0 deploy $1"

alias kpodimg="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' | sort"
alias kpodvrs="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{\"\n\"}{.metadata.name}{\":\t\"}{range .spec.containers[*]}{.image}{end}{end}' | grep $1"

alias kdpod="kubectl delete po $1"
alias kdpo="k get pods | grep $1 | awk '{print \$1}' | xargs kubectl delete pod"
alias kdpof="k get po | fzf | awk '{print \$1}' | xargs kubectl delete pod"
