#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
# Colors: https://user-images.githubusercontent.com/704406/43988708-64c0fa52-9d4c-11e8-8cf9-c4d4b97a5200.png

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wesley/.oh-my-zsh"

export TERM="xterm-256color"
export DOTFILES=$(readlink ~/.dotfiles)


########################################################
# Theme Configuration
########################################################

# === # POWERLEVEL9K ===
# https://github.com/Powerlevel9k/powerlevel9k
# https://github.com/romkatv/powerlevel10k

# ZSH_THEME="powerlevel9k/powerlevel9k"

## POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_MODE='nerdfont-complete'
# # POWERLEVEL9K_COLOR_SCHEME='dark'
# POWERLEVEL9K_STATUS_VERBOSE=false

# Start config Multiline
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ICON_LEFT=true
## POWERLEVEL9K_NEWLINE_ICON="\uF09C"
## POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL="\ue0b2"
## POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL="\ue0b0"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uF460%f "
## POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{blue}"$'\u2570\uf460'"%F{white}"
## POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON="%F{blue}"$'\u256D\u2500'"%F{white}"

# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR_ICON="\ue0b0"
# POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="\ue0b1"
# End Multiline

# Start config Singleline
# # POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
# End Singleline

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir dir_writable vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time vi_mode)

# POWERLEVEL9K_DIR_HOME_BACKGROUND='033'
# POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='033'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
# POWERLEVEL9K_DIR_ETC_SUBFOLDER_BACKGROUND='033'
# POWERLEVEL9K_DIR_ETC_SUBFOLDER_FOREGROUND='black'
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='yellow'
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
# POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"


# POWERLEVEL9K_TIME_BACKGROUND="black"
# POWERLEVEL9K_TIME_FOREGROUND="white"
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

# POWERLEVEL9K_VCS_GIT_ICON=''

# SourceCodePro+Powerline+Awesome
## POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
## POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
## POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
## POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
## POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

# Nerd font
## POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
# POWERLEVEL9K_VCS_UNSTAGED_ICON='\uf421'
# POWERLEVEL9K_VCS_UNTRACKED_ICON='\uf00d'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\uf0ab '
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\uf0aa '

# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='cyan'
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='green'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'

## POWERLEVEL9K_HIDE_BRANCH_ICON=true


# === Spaceship ===
# https://github.com/denysdovhan/spaceship-prompt

ZSH_THEME="spaceship"

source "$DOTFILES/zsh/functions/spaceship_watson.sh"
source "$DOTFILES/zsh/functions/spaceship_langs.sh"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  java
  nodejs
  # node
  watson
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "
SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" λ "

SPACESHIP_NODE_PREFIX="⬢ "
SPACESHIP_NODE_SUFFIX=" "
SPACESHIP_NODE_SYMBOL=""


########################################################
# Plugin Manager
########################################################

plugins=(osx git vi-mode tmux jsontools)

source $ZSH/oh-my-zsh.sh
#source "$DOTFILES/zsh/prompts/jobs_prompt.zsh"


### Added by Zplugin's installer
if [[ ! -d $HOME/.zplugin/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zplugin…%f"
    command mkdir -p $HOME/.zplugin
    command git clone https://github.com/zdharma/zplugin $HOME/.zplugin/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions


########################################################
# Custom Functions
########################################################

# Load my functions
# if [[ -d $DOTFILES/zsh/functions ]]; then
#     for func in $DOTFILES/zsh/functions/*(:t); autoload -U $func
# fi

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'


########################################################
# Aliases
########################################################

# Force use of NeoVim
alias vim="nvim"
# Setup SpaceVIM as secundary (experimentation)
alias svim='nvim -u ~/.SpaceVim/vimrc'

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

# Tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat="tmux attach -t $1"
alias tns="tmux new-session -s $1"
alias tks="tmux kill-session -t $1"
alias ide="tmux new-session -s ide"


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
alias gdg='git ls-files -m | grep $1 | xargs git diff --color | diff-so-fancy'
alias gdv='git difftool -y -t vimdiff'

# 'checkout grep'
alias gcg='git ls-files -m | grep $1 | xargs git checkout'
# add grep
alias gag="git ls-files -m -o --exclude-standard | grep $1 | xargs git add --all"

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
alias kgpa="kubectl get po --all-namespaces"
alias kpod="kubectl get po"
alias kgpg="kubectl get po | grep $1"
alias kdesc="kubectl describe $1"
alias kgrep="k get pod,svc -o wide | grep $1"
alias klogs="k get pod | grep $1 | awk '{print $1}' | xargs kubectl logs"
alias kport="kubectl port-forward $1" # kport <pod_name> <my_port>:<pod_port>

alias krollstatus="kubectl rollout status deployments $1"
alias krollback="kubectl rollout undo deployments $1"

alias knodersc="kubectl get nodes --no-headers | awk '{print $1}' | xargs -I {} sh -c 'echo {}; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo'"
alias kpodrsc="kubectl get po --all-namespaces -o=jsonpath=\"{range .items[*]}{.metadata.namespace}:{.metadata.name}{'\n'}{range .spec.containers[*]}  {.name} - {.resources.requests.cpu} - 	{.resources.requests.memory}{'\n'}{end}{'\n'}{end}\""

alias kscaleup="k scale --replicas=1 deploy $1"
alias kscaledown="k scale --replicas=0 deploy $1"

alias kpodimg="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' | sort"
alias kpodvrs="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{\"\n\"}{.metadata.name}{\":\t\"}{range .spec.containers[*]}{.image}{end}{end}' | grep $1"
alias kpoddel="k get pods | grep $1 | awk '{print $1}' | xargs kubectl delete pod"
