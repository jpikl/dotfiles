# shellcheck shell=bash

# Git repo for dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Ls
alias la='ls --all'
alias ll='ls -l --human-readable'
alias lla='ls -l --all --human-readable'

# Cd
alias cdmvnroot='cd $(find-mvn-root || pwd)'
alias cdnpmdir='cd $(find-npm-dirs --select-one || pwd)'

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
alias npmd='npmls | egrep --line-regexp "dev|webpack-dev" | head --lines=1 | xargs --no-run-if-empty npm run --'

# Maven
alias mvnci='mvn clean install'
alias mvncist='mvnci -Dmaven.test.skip=true'
alias mvnsv='mvn-set-version'
alias mvngv='mvn-get-version'

# React Native
alias rndebug='adb shell input keyevent 82'

# Iconv
alias win1250-utf8='iconv --from-code=WINDOWS-1250 --to-code=UTF-8'
alias utf8-win1250='iconv --from-code=UTF-8 --to-code=WINDOWS-1250'
alias iso88592-utf8='iconv --from-code=ISO-8859-2 --to-code=UTF-8'
alias utf8-iso88592='iconv --from-code=UTF-8 --to-code=ISO-8859-2'

# Custom scripts
alias unpack='extract'
alias upfind='find-upwards'
alias srcfind='get-find-expression --ignore-non-sources | xargs find'
