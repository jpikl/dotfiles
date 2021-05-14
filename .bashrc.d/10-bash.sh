# shellcheck shell=bash

# Shell options
shopt -s histappend # Append entries to history file
shopt -s globstar   # Enable recursive "**" glob pattern

# Do not add commands starting with space to history + erase duplicates.
export HISTCONTROL=ignorespace:erasedups

## Reload .profile and .bashrc
alias bashreload='source ~/.bash_profile'
