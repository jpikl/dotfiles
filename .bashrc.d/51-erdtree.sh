# shellcheck shell=bash

# Clear previous alias in case of reload
unalias et &>/dev/null

if [[ -x "$(command -v et)" ]]; then
  # Use exa with icons when available
  if [[ $TERM_ICONS == true ]]; then
    alias et='et --icons'
  fi

  # Override tree command or alias from 50-exa.sh
  alias tree='et'
fi
