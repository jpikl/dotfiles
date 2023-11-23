# shellcheck shell=bash

## Fzf with directory contents preview
alias fzfls='fzf --preview="ls -l --almost-all --human-readable --color=always {}"'

## Fzf for pacman package selection
alias fzfpacman='fzf --multi --no-sort --ansi --preview="pacman -Si {2}" | cut -d" " -f2'

## Fzf for yay package selection
alias fzfyay='fzf --multi --no-sort --ansi --preview="yay -Si {2}" | cut -d" " -f2'
