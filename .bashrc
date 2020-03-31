# shellcheck shell=bash

# Check interactive mode
if [[ $- != *i* ]]; then
  echo "${BASH_SOURCE[0]} sourced in non-interactive bash mode" >&2
  return
fi

# Shell options
shopt -s histappend   # Append entries to history file
shopt -s globstar     # Enable recursive "**" glob pattern

# Do not add commands starting with space to history + erase duplicates.
export HISTCONTROL=ignorespace:erasedups

# Tools that initialize environment
[[ -x "$(command -v dircolors)" ]] && eval "$(dircolors --bourne-shell)"
[[ -x "$(command -v thefuck)" ]] && eval "$(thefuck --alias)"

# Detect icons support in terminal
if [[ ! $TERM_ICONS ]]; then
  if [[ $DISPLAY ]]; then
    TERM_ICONS=true
  else
    TERM_ICONS=false
  fi
  export TERM_ICONS
fi

# Source libraries
if [[ $BASH_LIB_DIR ]]; then
  source "$BASH_LIB_DIR/aliases.sh"
  source "$BASH_LIB_DIR/prompt.sh"
else
  echo "${BASH_SOURCE[0]}: BASH_LIB_DIR variable was not set by .profile" >&2
fi

# Local override not committed in git
if [[ -f ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi
