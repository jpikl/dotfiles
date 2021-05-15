# shellcheck shell=bash

## Execute command with dotfiles environment
alias dotenv='env GIT_DIR=$HOME/.dotfiles.git GIT_WORK_TREE=$HOME'

## Git for dotfiles
alias dotfiles='dotenv git'

## Visual studio code for dotfiles
alias dotcode='dotenv code ~/.dotfiles.code-workspace'
