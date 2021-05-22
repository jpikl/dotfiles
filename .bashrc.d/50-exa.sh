# shellcheck shell=bash

if [[ -x "$(command -v exa)" ]]; then
  # Use exa with icons when available
  if [[ $TERM_ICONS == true ]]; then
    alias exa='exa --git --icons'
  else
    alias exa='exa --git'
  fi

  # Override 30-ls.sh aliases using exa
  alias ls='exa'
  alias la='ls --all'
  alias ll='ls --long'
  alias lla='ll --all'
  alias tree='ls --tree'
fi
