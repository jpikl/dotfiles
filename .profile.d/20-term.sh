# shellcheck shell=bash

# Icon support in terminal
# This is later used by some ~/.bashrc.d/ and ~/.local/bin/ sripts.
if [[ ! $TERM_ICONS ]]; then
  if [[ $DISPLAY ]]; then
    export TERM_ICONS=true
  else
    export TERM_ICONS=false
  fi
fi
