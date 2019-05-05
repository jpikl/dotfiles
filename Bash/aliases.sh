# shellcheck shell=bash

# Git repo for dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Ls
alias ls='ls --color=auto'
alias la='ls --all'
alias ll='ls -l --human-readable'
alias lla='ll --all'

# Cd
alias cdmvnroot='cd $(find-mvn-root || pwd)'
alias cdnpmdir='cd $(find-npm-dirs --select-one || pwd)'

# Grep
alias grep='grep --color=auto'
alias egrep='grep --extended-regexp'
alias fgrep='grep --fixed-strings'

# Find
alias findup='find-upwards'
alias findsrc='get-find-expression --ignore-non-sources | xargs find'

# Clipboard
alias wclip='xclip -in -selection clipboard'
alias rclip='xclip -out -selection clipboard'

# Npm
alias npmg='npm --global'
alias npmgl='npmg --depth=0 list'
alias npmgu='npmg install'
alias npmgu='npmg uninstall'
alias npmi='npm install'
alias npmfi='rm --force package-lock.json && npmi'
alias npmffi='rm --force --recursive node_modules && npmfi'
alias npmu='npm uninstall'
alias npmls='npm-list-scripts'
alias npmd='npm-run-script --rerun-on-failure webpack-dev dev'

# Maven
alias mvnci='mvn clean install'
alias mvncist='mvnci -Dmaven.test.skip=true'
alias mvnsv='mvn-set-version'

# React Native
alias rndebug='adb shell input keyevent 82'

# Java
alias javace='java-count-exceptions'

# Iconv
alias win1250-utf8='iconv --from-code=WINDOWS-1250 --to-code=UTF-8'
alias utf8-win1250='iconv --from-code=UTF-8 --to-code=WINDOWS-1250'
alias iso88592-utf8='iconv --from-code=ISO-8859-2 --to-code=UTF-8'
alias utf8-iso88592='iconv --from-code=UTF-8 --to-code=ISO-8859-2'

# Other
alias unpack='extract'
alias fitterm='cut -c1-${COLUMNS}'
