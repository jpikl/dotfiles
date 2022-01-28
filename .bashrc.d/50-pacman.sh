# shellcheck shell=bash

## Select packages to install using pacman/pacaur
alias paci='pacfind -rc | fzfpacman | xargs -ro sudo pacman -S'

## Select packages to install using pacman/pacaur (with refresh)
alias pacii='sudo pacman -Sy && paci'

## Select packages to uninstall using pacman/pacaur
alias pacun='pacfind -lc | fzfpacman | xargs -ro sudo pacman -Rsc'

## Pacman/pacaur system upgrade
alias pacup='pacupkeys && sudo pacman -Su'

## Update archlinux keyring
alias pacupkeys='sudo pacman -Sy archlinux-keyring'
