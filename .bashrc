# shellcheck shell=bash

# Check interactive mode
if [[ $- != *i* ]]; then
  echo "${BASH_SOURCE[0]} sourced in non-interactive bash mode" >&2
  return
fi

# Bash history (start with space to ignore command + erase duplicates)
export HISTCONTROL=ignorespace:erasedups

# Current tty device
TTY=$(tty)
export TTY

# Tools that initialize environment
command -v dircolors >/dev/null && eval "$(dircolors --bourne-shell)"
command -v thefuck >/dev/null && eval "$(thefuck --alias)"

# Detect font icons support in terminal
if [[ ! $TERM_FONT_ICONS ]]; then
  if [[ $TERM == linux ]]; then
    TERM_FONT_ICONS=false
  else
    TERM_FONT_ICONS=true
  fi
  export TERM_FONT_ICONS
fi

# Source libraries
if [[ $BASH_LIB_DIR ]]; then
  source "$BASH_LIB_DIR/aliases.sh"
  source "$BASH_LIB_DIR/prompt.sh"
else
  echo "${BASH_SOURCE[0]}: BASH_LIB_DIR variable was not set by .profile" >&2
fi

# Local override not committed in git
if [[ -f ~/.bashrc_local ]]; then
  source ~/.bashrc_local
fi
