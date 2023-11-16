# shellcheck shell=bash

if [[ -x "$(command -v atuin)" ]]; then
  source ~/.bash_preexec
  eval "$(atuin init bash --disable-up-arrow)"
fi
