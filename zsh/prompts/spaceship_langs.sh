#!/bin/zsh

# Show java version
spaceship_java() {
	spaceship::exists java || return

	local java_version=$(java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}')

	# Exit section if variable is empty
	[[ -z $java_version ]] && return

	spaceship::section "$fg[yellow]| ☕ $java_version "
}

# Show nodejs version
spaceship_nodejs() {
	spaceship::exists node || return

	local nodejs_version=$(node --version)

	# Exit section if variable is empty
	[[ -z $nodejs_version ]] && return

	spaceship::section "$fg[green]| ⬢ $nodejs_version "
}
