# shellcheck shell=sh

# Generate LS_COLORS variable for better ls colors
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors --sh)"
fi

# Alias our wrapper
alias ls='list'
alias la='list -a'
alias ll='list -l'
alias lt='list -t'
alias lla='list -la'
alias lta='list -ta'
alias llt='list -lt'
alias llta='list -lta'
