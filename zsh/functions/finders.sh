#!/usr/bin/env bash


# Find througout my notes
# Usage: `brainsearch <TERM>`
brainsearch() {
    if [ ! "$#" -gt 0 ]; then
        echo "What do you need to know?";
        return 1;
    fi
    ag -l "$1" ~/notes/ | \
        fzf --preview "rg --color=always --ignore-case --pretty --context 20 '$1' {}" | \
        xargs -I {} vim "{}"
}

# Find a file by name.
# Usage: `ff <TERM>`
ff() {
    if [ ! "$#" -gt 0 ]; then
        echo "Need a string to search for";
        return 1;
    fi
    tree -afi | fzf -q "$1"
}

# Find a directory by name.
# Usage: `ffd <TERM>`
ffd() {
    if [ ! "$#" -gt 0 ]; then
        echo "Need a string to search for";
        return 1;
    fi
    tree -dfi "$2" | fzf -q "$1"
}

# Find file with content.
# find-in-file - usage: fif <SEARCH_TERM>
fif() {
    if [ ! "$#" -gt 0 ]; then
        echo "Need a string to search for";
        return 1;
    fi
    rg --files-with-matches --no-messages "$1" | fzf --preview "rg --color=always --ignore-case --pretty --context 10 '$1' {}"
}
