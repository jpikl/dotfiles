# shellcheck shell=bash

# Git repo for dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Colors
eval "$(dircolors --bourne-shell)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Ls
alias la='ls --all'
alias ll='ls -l --human-readable'
alias lla='ls -l --all --human-readable'

# Clipboard
alias wclip='xclip -in -selection clipboard'
alias rclip='xclip -out -selection clipboard'

# Npm
alias npmg='npm --global'
alias npmgl='npm --global --depth=0 list'
alias npmi='npm install'
alias npmfi='rm --force package-lock.json && npmi'
alias npmffi='rm --recursive --force node_modules && npmfi'
alias npmls='npm-list-scripts'
alias npmd='npmls | egrep --line-regexp "dev|webpack-dev" | head --lines=1 | xargs --no-run-if-empty npm run'

# Maven
alias mvnci='mvn clean install'
alias mvncist='mvn clean install -Dmaven.test.skip=true'
alias mvnsv='mvn-set-version'

# React Native
alias rndebug='adb shell input keyevent 82'

# Custom scripts
alias unpack='extract-archive'
alias upfind='find-upwards'
