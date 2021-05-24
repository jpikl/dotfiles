# shellcheck shell=bash

if [[ -x "$(command -v dircolors)" ]]; then
  eval "$(dircolors --bourne-shell)"
fi
