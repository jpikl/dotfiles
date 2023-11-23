# shellcheck shell=bash

if [[ -x "$(command -v yay)" ]]; then
  # Override 50-pacman.sh aliases using yay
  alias paci='pacfind -c | fzfyay | xargs -ro yay -S'
  alias pacii='yay -Sy && paci'
  alias pacun='pacfind -lc | fzfyay | xargs -ro yay -Rsc'
  alias pacup='pacupkeys && yay -Su'
fi
