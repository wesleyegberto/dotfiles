#!/bin/zsh

SPACESHIP_WATSON_SHOW="${SPACESHIP_WATSON_SHOW=true}"
SPACESHIP_WATSON_SYMBOL="${SPACESHIP_WATSON_SYMBOL="🔨 "}"
# SPACESHIP_WATSON_PREFIX="${SPACESHIP_WATSON_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
# SPACESHIP_WATSON_SUFFIX="${SPACESHIP_WATSON_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_WATSON_COLOR="${SPACESHIP_WATSON_COLOR="cyan2"}"

# Show watson status
spaceship_watson() {
  [[ $SPACESHIP_WATSON_SHOW == false ]] && return

  spaceship::exists watson || return

  local watson_status=$(watson status | perl -pe 's/(Project | started.*\(.*\))//g')

  # Exit section if variable is empty
  [[ -z $watson_status ]] && return
  [[ $watson_status =~ 'No project started' ]] && return

  spaceship::section \
    "$SPACESHIP_WATSON_COLOR" \
    "| $SPACESHIP_WATSON_SYMBOL$watson_status "
}