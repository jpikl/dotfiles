# shellcheck shell=bash

# Backup
alias bakmusls='dirtree -s $MUSIC_DIR > $BACKUP_DIR/music.txt'

# Bat
alias batfzf='find -type f | fzfbat | xargs --no-run-if-empty bat'
alias batfzfsrc='findsrc -type f | fzfbat | xargs --no-run-if-empty bat'

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
alias cdmvndir='cd "$(findprj -mZ | choose -zp "Directory:")"'
alias cdmvnroot='cd "$(findprj -mu)"'
alias cdnpmdir='cd "$(findprj -nZ | choose -zp "Directory:")"'
alias cdnpmroot='cd "$(findprj -nu)"'
alias cdpic='cd "$PICTURES_DIR"'
alias cdplay='cd "$PLAYLISTS_DIR"'
alias cdplst='cdplay'
alias cdprj='cd "$WORKSPACE_DIR" && cd "$(choose -p "Project:" * || echo "$OLDPWD")"'
alias cdpub='cd "$PUBLIC_DIR"'
alias cdtemp='cd "$TEMP_DIR"'
alias cdtmp='cd "$TEMP_DIR"'
alias cdvid='cd "$VIDEOS_DIR"'
alias cdvol='cd "$VOLUMES_DIR"'
alias cdwork='cd "$WORKSPACE_DIR"'
alias cdwrk='cdwork'

# Clipboard
if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ ]]; then
  alias clipget='powershell -command "Get-Clipboard"'
  alias clipset='clip'
else
  alias clipget='xclip -out -selection clipboard'
  alias clipset='xclip -in -selection clipboard'
fi

# Dir
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# Dotfiles
alias dotenv='env GIT_DIR=$HOME/.dotfiles.git GIT_WORK_TREE=$HOME'
alias dotfiles='dotenv git'
alias dotcode='dotenv code ~/.dotfiles.code-workspace'

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
alias fzfxargs='fzf --multi --read0 --print0 | xargs --null --no-run-if-empty'
alias fzfpac='fzf --multi --no-sort --ansi --preview="pacaur -Si {2}" | cut --delimiter=" " --fields=2'

# Git
alias gitcb='git ls-branches -lrsC | choose -p "Checkout branch:" | xargs --no-run-if-empty git checkout'
alias gitct='git tag | choose -p "Checkout tag:" | xargs --no-run-if-empty git checkout'
alias gitdb='git ls-branches -lC | choose -mp "Delete branch(es):" | xargs --no-run-if-empty git branch --delete'
alias gitdbf='gitdb --force'
alias gitffb=' git ls-branches -b | choose -mp "Fast-forward branch(es):" | xargs --no-run-if-empty git fast-forward'
alias gitmb='git ls-branches -lrC | choose -p "Merge branch to \""$(git ls-branches -c)"\":" | xargs --no-run-if-empty git merge'
alias gitrb='git ls-branches -lrC | choose -p "Rebase \""$(git ls-branches -c)"\" onto branch:" | xargs --no-run-if-empty git rebase'

# Iconv
alias win1250-utf8='iconv --from-code=WINDOWS-1250 --to-code=UTF-8'
alias utf8-win1250='iconv --from-code=UTF-8 --to-code=WINDOWS-1250'
alias iso88592-utf8='iconv --from-code=ISO-8859-2 --to-code=UTF-8'
alias utf8-iso88592='iconv --from-code=UTF-8 --to-code=ISO-8859-2'

# Ls
alias ls='ls --color=auto'
alias la='ls --almost-all'
alias ll='ls -l --human-readable'
alias lla='ll --almost-all'

# Man
command -v man >/dev/null || alias man=wman # MinGW does not have man

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
alias npmii='rm --force --recursive node_modules && npmi'
alias npml='npm --depth=0 list'
alias npmun='npm uninstall'
alias npmup='npm update'

# Pacman / Pacaur
alias paci='pacfind -c | fzfpac | xargs --no-run-if-empty retty pacaur -S'
alias pacr='pacaur -Sy'
alias pacri='pacr && paci'
alias pacun='pacfind -lc | fzfpac | xargs --no-run-if-empty retty pacaur -Rsc'
alias pacup='pacaur -Syu'

# React Native
alias rndebug='adb shell input keyevent 82'

# SSH
alias ssha='cd ~/.ssh && find -name "*.key" -printf "%P\0" | choose -zp "SSH key:" | xargs --no-run-if-empty --open-tty ssh-add; cd "$OLDPWD"'
alias sshi='eval "$(sshctl start)"'
alias sshk='eval "$(sshctl stop)"'
alias sshl='cd ~/.ssh && grep --fixed-strings --recursive --with-filename --file=<(ssh-add -L | cut --delimiter=" " --fields=2) | cut --delimiter=: --fields=1; cd "$OLDPWD"'

# Terminal
alias termfit='cut --characters=-$COLUMNS'

# Tree
command -v tree >/dev/null || alias tree='dirtree -s' # Use our own implementation when not available

# Xargs
alias xargsfzf='find -print0 | fzfxargs'
alias xargsfzfsrc='findsrc -print0 | fzfxargs'
