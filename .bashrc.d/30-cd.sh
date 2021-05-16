# shellcheck shell=bash

## Change directory to ~/.bashrc.d
alias cdbarc='cd ~/.bashrc.d'
## Change directory to ~/.profile.d
alias cdprof='cd ~/.profile.d'

## Change directory to $USER_BACKUP_DIR
alias cdbak='cd "$USER_BACKUP_DIR"'
## Change directory to $USER_BINARIES_DIR
alias cdbin='cd "$USER_BINARIES_DIR"'
## Change directory to $USER_CACHE_DIR
alias cdcach='cd "$USER_CACHE_DIR"'
## Change directory to $USER_CONFIG_DIR
alias cdconf='cd "$USER_CONFIG_DIR"'
## Change directory to $USER_DATA_DIR
alias cddat='cd "$USER_DATA_DIR"'
## Change directory to $USER_DESKTOP_DIR
alias cddesk='cd "$USER_DESKTOP_DIR"'
## Change directory to $USER_DOCUMENTS_DIR
alias cddoc='cd "$USER_DOCUMENTS_DIR"'
## Change directory to $USER_DOWNLOAD_DIR
alias cddown='cd "$USER_DOWNLOAD_DIR"'
## Change directory to $USER_LIBRARIES_DIR
alias cdlib='cd "$USER_LIBRARIES_DIR"'
## Change directory to $USER_MEDIA_DIR
alias cdmed='cd "$USER_MEDIA_DIR"'
## Change directory to $USER_MUSIC_DIR
alias cdmus='cd "$USER_MUSIC_DIR"'
## Change directory to $USER_PICTURES_DIR
alias cdpic='cd "$USER_PICTURES_DIR"'
## Change directory to $USER_PLAYLISTS_DIR
alias cdplay='cd "$USER_PLAYLISTS_DIR"'
## Change directory to $USER_PUBLIC_DIR
alias cdpub='cd "$USER_PUBLIC_DIR"'
## Change directory to $USER_TEMP_DIR
alias cdtmp='cd "$USER_TEMP_DIR"'
## Change directory to $USER_VIDEOS_DIR
alias cdvid='cd "$USER_VIDEOS_DIR"'
## Change directory to $USER_GVFS_DIR
alias cdvol='cd "$USER_GVFS_DIR"'
## Change directory to $USER_WORKSPACE_DIR
alias cdwork='cd "$USER_WORKSPACE_DIR"'

## Save current working directory
alias cdsave='echo "$PWD" > $HOME/.local/share/cd'
## Restore current working directory
alias cdload='cd "$(< $HOME/.local/share/cd)"'

## Change directory to a fzf search result
alias cdfzf='cd "$(find -type d | fzfls)"'
## Change directory to a fzf search result (source files only)
alias cdfzfsrc='cd "$(findsrc -type d | fzfls)"'

## Change directory to a workspace project search result
alias cdprj='cdwork && cd "$(findprj -vZ -d2 -D3 | sed -z "s;^\./;;" | choose -izp "Project:" -d "$OLDPWD")" #'

## Change directory to a Maven project search result
alias cdmvndir='cd "$(findprj -mZ | choose -izp "Directory:")"'
## Change directory to a Maven project root
alias cdmvnroot='cd "$(findprj -mu)"'

## Change directory to a NodeJS project search result
alias cdnpmdir='cd "$(findprj -nZ | choose -izp "Directory:")"'
## Change directory to a NodeJS project root
alias cdnpmroot='cd "$(findprj -nu)"'
