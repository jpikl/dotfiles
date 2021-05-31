# shellcheck shell=bash

# Clear previous alias in case of reload
unalias ls &>/dev/null

# List files with colors
alias ls='ls --color=auto'

## List files including hidden ones
alias la='ls --almost-all'

## List files in long format
alias ll='ls -l --human-readable'

## List files in long format, including hidden ones
alias lla='ll --almost-all'
