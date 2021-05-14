# shellcheck shell=bash

## Select packages to install using pacman/pacaur
alias paci='pacfind -lgrc | fzfpacman | xargs -ro pacman -S'
## Select packages to install using pacman/pacaur (with refresh)
alias pacii='pacman -Sy && paci'

## Select packages to uninstall using pacman/pacaur
alias pacun='pacfind -lc | fzfpacman | xargs -ro pacman -Rsc'

## Pacman/pacaur system upgrade
alias pacup='pacman -Syu'
