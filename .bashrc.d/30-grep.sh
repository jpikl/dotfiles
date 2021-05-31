# shellcheck shell=bash

# Clear previous alias in case of reload
unalias grep

# Grep with colors
alias grep='grep --color=auto'

## Grep with extend regex pattern
alias egrep='grep --extended-regexp'

## Grep with fixed string pattern
alias fgrep='grep --fixed-strings'

## Grep with Perl regex patern
alias pgrep='grep --perl-regexp'
