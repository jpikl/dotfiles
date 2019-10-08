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
alias cdmvnroot='cd "$(findmvnroot)"'
alias cdnpmdir='cd "$(findnpmdirs -Z | choose -izp "NPM directory:")"'
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
alias findsrc='genfindexpr -s | xargs find'

# Clipboard
alias wclip='xclip -in -selection clipboard'
alias rclip='xclip -out -selection clipboard'

# Fzf
alias fzfbat='fzf --preview="bat --color=always {}"'

# Git
alias gitcb='git checkout "$(gitlsb -lrx | choose -ip "Git branch to checkout:")"'
alias gitct='git checkout "$(git tag | choose -ip "Git tag to checkout:")"'
alias gitfap='git fetch --all --prune'
alias gitffb='gitff $(gitlsb -l | choose -imp "Git branches to fast-forward:")'
alias gitladog='git log --all --decorate --oneline --graph'
alias gitmb='git merge "$(gitlsb -lr | choose -ip "Git branch to merge:")"'

# Npm
alias npmg='npm --global'
alias npmgl='npmg --depth=0 list'
alias npmgu='npmg install'
alias npmgu='npmg uninstall'
alias npmi='npm install'
alias npmfi='rm --force package-lock.json && npmi'
alias npmffi='rm --force --recursive node_modules && npmfi'
alias npmu='npm uninstall'
alias npmd='npmrs -r webpack-dev dev'

# Maven
alias mvnci='mvn clean install'
alias mvncist='mvnci -Dmaven.test.skip=true'

# React Native
alias rndebug='adb shell input keyevent 82'

# Iconv
alias win1250-utf8='iconv --from-code=WINDOWS-1250 --to-code=UTF-8'
alias utf8-win1250='iconv --from-code=UTF-8 --to-code=WINDOWS-1250'
alias iso88592-utf8='iconv --from-code=ISO-8859-2 --to-code=UTF-8'
alias utf8-iso88592='iconv --from-code=UTF-8 --to-code=ISO-8859-2'

# SSH
alias sshinit='eval $(sshstart)'
alias sshadd='ssh-add "$(choose -p "SSH key to add:" ~/.ssh/*.key)"'

# Backup
alias bakmuslist='dirtree -s $MUSIC_DIR > $BACKUP_DIR/music.txt'

# Other
alias fitterm='cut --characters=-$COLUMNS'
