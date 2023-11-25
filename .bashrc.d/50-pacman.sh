# shellcheck shell=bash

## Select packages to install using pacman/yay
alias paci='pacfind -rc | fzfpacman | xargs -ro sudo pacman -S'

## Select packages to install using pacman/yay (with refresh)
alias pacii='sudo pacman -Sy && paci'

## Select packages to uninstall using pacman/yay
alias pacun='pacfind -lc | fzfpacman | xargs -ro sudo pacman -Rsc'

## Pacman/yay system upgrade
alias pacup='pacupkeys && sudo pacman -Su'

## Update archlinux keyring
alias pacupkeys='sudo pacman -Sy --needed archlinux-keyring'
