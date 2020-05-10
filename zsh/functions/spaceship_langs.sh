#!/bin/zsh

SPACESHIP_JAVA_SHOW="${SPACESHIP_JAVA_SHOW:=true}"
SPACESHIP_JAVA_SYMBOL="${SPACESHIP_JAVA_SYMBOL:="☕"}"
SPACESHIP_JAVA_COLOR="${SPACESHIP_JAVA_COLOR="yellow"}"

# Show java version
spaceship_java() {
	[[ $SPACESHIP_JAVA_SHOW == false ]] && return

	spaceship::exists java || return

	local java_version=$(java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}')

	# Exit section if variable is empty
	[[ -z $java_version ]] && return

	spaceship::section \
    	"$SPACESHIP_JAVA_COLOR" \
		"| $SPACESHIP_JAVA_SYMBOL$java_version "
}

SPACESHIP_NODEJS_SHOW="${SPACESHIP_NODEJS_SHOW:=true}"
SPACESHIP_NODEJS_SYMBOL="${SPACESHIP_NODEJS_SYMBOL="⬢ "}"
SPACESHIP_NODEJS_COLOR="${SPACESHIP_NODEJS_COLOR="green"}"

# Show nodejs version
spaceship_nodejs() {
	[[ $SPACESHIP_NODEJS_SHOW == false ]] && return

	spaceship::exists node || return

	local nodejs_version=$(node --version)

	# Exit section if variable is empty
	[[ -z $nodejs_version ]] && return

	spaceship::section \
    	"$SPACESHIP_NODEJS_COLOR" \
		"| $SPACESHIP_NODEJS_SYMBOL$nodejs_version "
}