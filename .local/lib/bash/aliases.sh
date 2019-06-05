# shellcheck shell=bash

# Git for dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Ls
alias ls='ls --color=auto'
alias la='ls --almost-all'
alias ll='ls -l --human-readable'
alias lla='ll --almost-all'

# Cd
alias cdbak='cd "$BACKUP_DIR"'
alias cdbashlib='cd "$BASH_LIB_DIR"'
alias cdbin='cd "$BINARIES_DIR"'
alias cdcache='cd "$CACHE_DIR"'
alias cdcfg='cd "$CONFIG_DIR"'
alias cddata='cd "$DATA_DIR"'
alias cddesk='cd "$DESKTOP_DIR"'
alias cddoc='cd "$DOCUMENTS_DIR"'
alias cddown='cd "$DOWNLOAD_DIR"'
alias cdlib='cd "$LIBRARIES_DIR"'
alias cdmed='cd "$MEDIA_DIR"'
alias cdmus='cd "$MUSIC_DIR"'
alias cdmvnlib='cd "$MAVEN_LIB_DIR"'
alias cdmvnroot='cd $(find-mvn-root || pwd)'
alias cdnpmdir='cd $(find-npm-dirs --select-one || pwd)'
alias cdnpmlib='cd "$NPM_LIB_DIR"'
alias cdpic='cd "$PICTURES_DIR"'
alias cdplist='cd "$PLAYLISTS_DIR"'
alias cdpriv='cd "$PRIVATE_DIR"'
alias cdpub='cd "$PUBLIC_DIR"'
alias cdtmp='cd "$TEMP_DIR"'
alias cdvid='cd "$VIDEOS_DIR"'
alias cdvol='cd "$VOLUMES_DIR"'
alias cdwork='cd "$WORKSPACE_DIR"'

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

# Backup
alias bakmuslist='dir-tree $MUSIC_DIR > $BACKUP_DIR/music.txt'

# Other
alias unpack='extract'
alias fitterm='cut --characters=-$COLUMNS'
