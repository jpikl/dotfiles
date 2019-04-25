# shellcheck shell=bash

# Git repo for dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Colors
eval "$(dircolors -b)"
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
alias npmfi='rm --force ./package-lock.json && npmi'
alias npmffi='rm --recursive --force ./node_modules && npmfi'
alias npmd='npm_run_dev'

# Maven
alias mvnci='mvn clean install'
alias mvncist='mvn clean install -Dmaven.test.skip=true'
alias mvnsv='mvn_set_version'

# React Native
alias rndebug='adb shell input keyevent 82'

# Custom scripts
alias of=open_file
alias ea=extract_archive
alias pacfind=find_package
alias upfind='find-upwards'
