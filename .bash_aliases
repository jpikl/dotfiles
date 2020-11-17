# shellcheck shell=bash

# Backup
alias bakmusls='dirtree -s $MUSIC_DIR > $BACKUP_DIR/music.txt'

# Bat
alias batfzf='find -type f | fzfbat | xargs -r bat'
alias batfzfsrc='findsrc -type f | fzfbat | xargs -r bat'

# Cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
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
alias cdfzf='cd "$(find -type d | fzfls)"'
alias cdfzfsrc='cd "$(findsrc -type d | fzfls)"'
alias cdlib='cd "$LOCAL_LIB_DIR"'
alias cdmed='cd "$MEDIA_DIR"'
alias cdmus='cd "$MUSIC_DIR"'
alias cdmvndir='cd "$(findprj -mZ | choose -izp "Directory:")"'
alias cdmvnroot='cd "$(findprj -mu)"'
alias cdnpmdir='cd "$(findprj -nZ | choose -izp "Directory:")"'
alias cdnpmroot='cd "$(findprj -nu)"'
alias cdpic='cd "$PICTURES_DIR"'
alias cdplay='cd "$PLAYLISTS_DIR"'
alias cdplst='cdplay'
alias cdprj='cd "$WORKSPACE_DIR" && cd "$(find -mindepth 1 -maxdepth 1 -type d -printf "%P\0" | sort -z | choose -izp "Project:" -d "$OLDPWD")"'
alias cdpub='cd "$PUBLIC_DIR"'
alias cdtemp='cd "$TEMP_DIR"'
alias cdtmp='cd "$TEMP_DIR"'
alias cdvid='cd "$VIDEOS_DIR"'
alias cdvol='cd "$VOLUMES_DIR"'
alias cdwork='cd "$WORKSPACE_DIR"'
alias cdwrk='cdwork'

# Clipboard
alias clipget='clipbrd get'
alias clipset='clipbrd set'

# Dir
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# Docker
doba() { docker exec -it "$1" bash -li; }
alias doco='docker container'
alias doex='docker exec -it'
alias doim='docker image'
alias dovo='docker volume'

# Dotfiles
alias dotenv='env GIT_DIR=$HOME/.dotfiles.git GIT_WORK_TREE=$HOME'
alias dotfiles='dotenv git'
alias dotcode='dotenv code ~/.dotfiles.code-workspace'

# Edit
alias edit='${VISUAL/ --wait}'

# Exif
alias exiffzf='exiftool "$(find -type f | fzfexif)"'

# Grep
alias grep='grep --color=auto'
alias egrep='grep --extended-regexp'
alias fgrep='grep --fixed-strings'
alias pgrep='grep --perl-regexp'

# Find
alias findsrc='findex -exclude vplo'

# Fzf
alias fzfbat='fzf --preview="bat --color=always {}"'
alias fzfls='fzf --preview="ls -l --almost-all --human-readable --color=always {}"'
alias fzfexif='fzf --preview="exiftool {}"'
alias fzfxargs='fzf --multi --read0 --print0 | xargs -0r'
alias fzfpac='fzf --multi --no-sort --ansi --preview="pacaur -Si {2}" | cut -d" " -f2'

# Git
alias gitcb='git lsb -lrsC | choose -ip "Checkout:" | xargs -r git checkout'
alias gitcmpb='git lsb -lr | choose -imp "Compare:" | xargs -r git cmpb'
alias gitct='git tag | choose -ip "Checkout tag:" | xargs -r git checkout'
alias gitdb='git lsb -lC | choose -imp "Delete:" | xargs -r git branch -d'
alias gitdbf='gitdb -f'
alias gitffb=' git lsb -b | choose -imp "Fast-forward:" | xargs -r git ff'
alias gitmb='git lsb -lrC | choose -ip "Merge to \""$(git lsb -c)"\":" | xargs -r git merge'
alias gitrb='git lsb -lrC | choose -ip "Rebase \""$(git lsb -c)"\" onto:" | xargs -r git rebase'

# Iconv
alias win1250-utf8='iconv --from-code=WINDOWS-1250 --to-code=UTF-8'
alias utf8-win1250='iconv --from-code=UTF-8 --to-code=WINDOWS-1250'
alias iso88592-utf8='iconv --from-code=ISO-8859-2 --to-code=UTF-8'
alias utf8-iso88592='iconv --from-code=UTF-8 --to-code=ISO-8859-2'

# Ip
alias ip='ip -color=auto'
alias ip4='ip -brief -family inet address show'
alias ip4u='ip4 | fgrep " UP " | egrep --color=never --only-matching "[0-9]+(\.[0-9]+){3}"'
alias ip6='ip -brief -family inet6 address show'
alias iplink='ip -brief link show'

# Links
if [[ -x $(command -v links) ]]; then
  alias links='env CONFIG_DIR=$LINKS_CONFIG_DIR links' # Links unfortunately uses the same CONFIG_DIR variable as we do
fi

# Ls / Exa / Tree
if [[ -x "$(command -v exa)" ]]; then
  if [[ ${TERM_ICONS-} == true ]]; then
    alias ls='exa --git --icons'
  else
    alias ls='exa --git'
  fi

  alias la='ls --all'
  alias ll='ls --long'
  alias lla='ll --all'
  alias tree='ls --tree'
else
  alias ls='ls --color=auto'
  alias la='ls --almost-all'
  alias ll='ls -l --human-readable'
  alias lla='ll --almost-all'

  if [[ ! -x "$(command -v tree)" ]]; then
    alias tree='dirtree -s' # Use our own implementation when not available
  fi
fi

# Man
if [[ ! -x "$(command -v man)" ]]; then
  alias man=wman # MinGW does not have man
fi

# Maven
alias mvnci='mvn clean install'
alias mvncist='mvnci -Dmaven.test.skip=true'
alias mvni='mvn install'
alias mvnist='mvni -Dmaven.test.skip=true'

# Npm
alias npmd='npmr -1 webpack-dev dev'
alias npmg='npm --global'
alias npmgi='npmg install'
alias npmgl='npmg --depth=0 list'
alias npmgun='npmg uninstall'
alias npmgup='npmg update'
alias npmi='npm install'
alias npmii='rm -rf node_modules && npmi'
alias npml='npm --depth=0 list'
alias npmun='npm uninstall'
alias npmup='npm update'

# Pacman / Pacaur
alias paci='pacfind -c | fzfpac | xargs -ro pacaur -S'
alias pacr='pacaur -Sy'
alias pacri='pacr && paci'
alias pacun='pacfind -lc | fzfpac | xargs -ro pacaur -Rsc'
alias pacup='pacaur -Syu'

# React Native
alias rndebug='adb shell input keyevent 82'

# Sort
alias sortu='sort --unique'

# SSH
alias ssha='cd ~/.ssh && find -name "id_*" -not -name "*.pub" -printf "%P\0" | choose -izp "SSH key:" | xargs -ro ssh-add; cd "$OLDPWD"'
alias sshi='eval "$(sshctl start)"'
alias sshk='eval "$(sshctl stop)"'
alias sshl='cd ~/.ssh && fgrep -rHf <(ssh-add -L | cut -d" " -f2) | cut -d: -f1; cd "$OLDPWD"'

# Terminal
alias termfit='cut --characters=-$COLUMNS'

# Wc
alias wcl='wc --lines'

# Xargs
alias xargsfzf='find -print0 | fzfxargs'
alias xargsfzfsrc='findsrc -print0 | fzfxargs'
