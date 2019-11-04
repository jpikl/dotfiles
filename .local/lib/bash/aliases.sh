# shellcheck shell=bash

# Git for dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Backup
alias bakmusls='dirtree -s $MUSIC_DIR > $BACKUP_DIR/music.txt'

# Bat
alias batfzf='bat $(find -type f | fzfbat)'
alias batfzfsrc='bat $(findsrc -type f | fzfbat)'

# Ls
alias ls='ls --color=auto'
alias la='ls --almost-all'
alias ll='ls -l --human-readable'
alias lla='ll --almost-all'

# Cd
alias cdbak='cd "$BACKUP_DIR"'
alias cdbin='cd "$LOCAL_BIN_DIR"'
alias cdcach='cd "$CACHE_DIR"'
alias cdcfg='cdconf'
alias cdconf='cd "$CONFIG_DIR"'
alias cddat='cd "$LOCAL_SHARE_DIR"'
alias cddesk='cd "$DESKTOP_DIR"'
alias cddoc='cd "$DOCUMENTS_DIR"'
alias cddok='cddoc'
alias cddown='cd "$DOWNLOAD_DIR"'
alias cddsk='cddesk'
alias cddwn='cddown'
alias cdfzf='cd $(find -type d | fzfls)'
alias cdfzfsrc='cd $(findsrc -type d | fzfls)'
alias cdlib='cd "$LOCAL_LIB_DIR"'
alias cdmed='cd "$MEDIA_DIR"'
alias cdmus='cd "$MUSIC_DIR"'
alias cdmvnroot='cd "$(mvnroot)"'
alias cdnpmdir='cd "$(npmdirs -Z | choose -izp "NPM directory:")"'
alias cdpic='cd "$PICTURES_DIR"'
alias cdplay='cd "$PLAYLISTS_DIR"'
alias cdplst='cdplay'
alias cdpriv='cd "$PRIVATE_DECRYPTED_DIR"'
alias cdprv='cdpriv'
alias cdpub='cd "$PUBLIC_DIR"'
alias cdtemp='cd "$TEMP_DIR"'
alias cdtmp='cd "$TEMP_DIR"'
alias cdvid='cd "$VIDEOS_DIR"'
alias cdvol='cd "$VOLUMES_DIR"'
alias cdwork='cd "$WORKSPACE_DIR"'
alias cdwrk='cdwork'

# Clipboard
alias clipi='xclip -in -selection clipboard'
alias clipo='xclip -out -selection clipboard'

# Exif
alias exiffzf='exiftool $(find -type f | fzfexif)'

# Grep
alias grep='grep --color=auto'
alias grep='grep --perl-regexp'
alias grepe='grep --extended-regexp'
alias grepf='grep --fixed-strings'

# Find
alias findsrc='find $(findexpr -s)'

# Fzf
alias fzfbat='fzf --preview="bat --color=always {}"'
alias fzfls='fzf --preview="ls -l --almost-all --human-readable --color=always {}"'
alias fzfexif='fzf --preview="exiftool {}"'
alias fzfxargs='fzf --multi --read0 --print0 | xargs --delimiter="\0" --no-run-if-empty'
# shellcheck disable=SC2142
alias fzfpac='fzf --multi --no-sort --ansi --preview="pacaur -Si {2}" | awk "{print \$2}"'

# Git
alias gitcb='git checkout "$(gitlsb -lrx | choose -ip "Git branch to checkout:")"'
alias gitct='git checkout "$(git tag | choose -ip "Git tag to checkout:")"'
alias gitDb='gitdb --force'
alias gitdb='git branch --delete "$(gitlsb -l | choose -imp "Git branches to delete:")"'
alias gitfap='git fetch --all --prune'
alias gitffb='gitff $(gitlsb -l | choose -imp "Git branches to fast-forward:")'
alias gitladog='git log --all --decorate --oneline --graph'
alias gitmb='git merge "$(gitlsb -lr | choose -ip "Git branch to merge to \""$(gitlsb -c)"\":")"'

# Iconv
alias win1250-utf8='iconv --from-code=WINDOWS-1250 --to-code=UTF-8'
alias utf8-win1250='iconv --from-code=UTF-8 --to-code=WINDOWS-1250'
alias iso88592-utf8='iconv --from-code=ISO-8859-2 --to-code=UTF-8'
alias utf8-iso88592='iconv --from-code=UTF-8 --to-code=ISO-8859-2'

# Npm
alias npmd='npmr webpack-dev dev'
alias npmg='npm --global'
alias npmgi='npmg install'
alias npmgl='npmg --depth=0 list'
alias npmgun='npmg uninstall'
alias npmgup='npmg update'
alias npmi='npm install'
alias npmii='rm --force --recursive node_modules && npmi'
alias npml='npm --depth=0 list'
alias npmun='npm uninstall'
alias npmup='npm update'

# Maven
alias mvnci='mvn clean install'
alias mvncist='mvnci -Dmaven.test.skip=true'
alias mvni='mvn install'
alias mvnist='mvni -Dmaven.test.skip=true'

# Pacman / pacaur
alias paci='pacfind -ra | fzfpac | xargs --no-run-if-empty retty pacaur -S'
alias pacr='pacaur -Sy'
alias pacri='pacr && paci'
alias pacun='pacfind -i | fzfpac | xargs --no-run-if-empty retty pacaur -Rsc'
alias pacup='pacaur -Syu'

# React Native
alias rndebug='adb shell input keyevent 82'

# SSH
alias ssha='ssh-add "$(choose -p "SSH key to add:" ~/.ssh/*.key)"'
alias sshi='eval $(sshstart)'

# Terminal
alias termfit='cut --characters=-$COLUMNS'

# Xargs
alias xargsfzf='find -print0 | fzfxargs'
alias xargsfzfsrc='findsrc -print0 | fzfxargs'
