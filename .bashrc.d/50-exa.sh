# shellcheck shell=bash

# Clear previous alias in case of reload
unalias exa

if [[ -x "$(command -v exa)" ]]; then
  # Use exa with icons when available
  if [[ $TERM_ICONS == true ]]; then
    alias exa='exa --git --icons'
  else
    alias exa='exa --git'
  fi

  # Override 30-ls.sh aliases using exa
  alias ls='exa'
  alias la='exa --all'
  alias ll='exa --long'
  alias lla='exa --long --all'
  alias tree='exa --tree'
fi
