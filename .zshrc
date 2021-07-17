#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
# Colors: https://user-images.githubusercontent.com/704406/43988708-64c0fa52-9d4c-11e8-8cf9-c4d4b97a5200.png

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="vim"

export TERM="xterm-256color"
export DOTFILES=$(readlink ~/.dotfiles)

export HISTTIMEFORMAT='%F | %T '

# Setting fd as the default source for fzf
# Bindins:
# ctrl-y: copy
# ctrl-s: open in VSCode
# ctrl-v: open in Vim
# ctrl-o: open with preview
export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --height=80% --multi --preview-window=:hidden --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200' --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008' --prompt='∼ ' --pointer='▶' --marker='✓' --bind '?:toggle-preview' --bind 'ctrl-a:select-all' --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)' --bind 'ctrl-v:execute(echo {+} | xargs -o vim)' --bind 'ctrl-s:execute(echo {+} | xargs -o code)' --bind 'ctrl-t:execute(echo {+} | xargs -o tmux)' --bind 'ctrl-o:execute(open {+})'"
export FZF_PREVIEW_WINDOW="([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude '.git' --exclude 'node_modules' --exclude '.build'"

# start tmux on startup
# if [ -z $TMUX ]
# then
#   # TODO: start only when there is any previous connection
#   tmux has-session -t default & tmux attach -t default || tmux new-session -s default
# fi

########################################################
# Theme Configuration
########################################################

# === Spaceship ===
# https://github.com/denysdovhan/spaceship-prompt

ZSH_THEME="spaceship"

# source "$DOTFILES/zsh/prompts/spaceship_watson.sh"
source "$DOTFILES/zsh/prompts/spaceship_langs.sh"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  java
  nodejs
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

# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"


########################################################
# Plugin Manager
########################################################

plugins=(osx git vi-mode jsontools)

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

source "$DOTFILES/zsh/functions/finders.sh"
source "$DOTFILES/zsh/functions/tmux_helpers.sh"
source "$DOTFILES/zsh/functions/projects.sh"
source "$DOTFILES/zsh/functions/springboot_helpers.sh"
source "$DOTFILES/zsh/functions/traffic_generator.sh"
source "$DOTFILES/zsh/functions/aws_helpers.sh"
source "$DOTFILES/zsh/functions/docker.sh"

export PATH=$PATH:$DOTFILES/zsh/bin

########################################################
# Aliases
########################################################

source "$DOTFILES/zsh/aliases.sh"

# Dev tools
# Facebook's Infer: Java static analyzer (https://fbinfer.com/docs/getting-started)
# infer run -- javac Hello.java

# MS's C# static analyzer (https://github.com/microsoft/CSharpCodeAnalyzer)
