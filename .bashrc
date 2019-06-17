# shellcheck shell=bash

# Interactive mode check
if [[ $- != *i* ]]; then
  echo "${BASH_SOURCE[0]}: Attempt to source file in non-interactive mode!"
  return
fi

# History control
# - Ignore commands with space before.
# - Erase duplicates.
export HISTCONTROL=ignorespace:erasedups

# Binaries
eval "$(dircolors --bourne-shell)"
command -v thefuck >/dev/null && eval "$(thefuck --alias)"

# Sources
if [[ $BASH_LIB_DIR ]]; then
  source "$BASH_LIB_DIR/aliases.sh"
  source "$BASH_LIB_DIR/prompt.sh"
else
  echo "${BASH_SOURCE[0]}: Environment variable BASH_LIB_DIR is not set!"
  echo "${BASH_SOURCE[0]}: ~/.profile was probably not sourced before!"
fi

# Local override not committed in git
if [[ -f ~/.bashrc_local ]]; then
  source ~/.bashrc_local
fi
