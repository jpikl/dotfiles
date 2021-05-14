# shellcheck shell=bash

if [[ -x "$(command -v pacaur)" ]]; then
  # Override 50-pacman.sh aliases using pacaur
  alias paci='pacfind -c | fzfpacaur | xargs -ro pacaur -S'
  alias pacii='pacaur -Sy && paci'
  alias pacun='pacfind -lc | fzfpacaur | xargs -ro pacaur -Rsc'
  alias pacup='pacaur -Syu'
fi
