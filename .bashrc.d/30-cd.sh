# shellcheck shell=bash

## Change directory to $BACKUP_DIR
alias cdbak='cd "$BACKUP_DIR"'
## Change directory to $LOCAL_BIN_DIR
alias cdbin='cd "$LOCAL_BIN_DIR"'
## Change directory to $CACHE_DIR
alias cdcach='cd "$CACHE_DIR"'
## Change directory to $CONFIG_DIR
alias cdconf='cd "$CONFIG_DIR"'
## Change directory to $LOCAL_SHARE_DIR
alias cddat='cd "$LOCAL_SHARE_DIR"'
## Change directory to $DESKTOP_DIR
alias cddesk='cd "$DESKTOP_DIR"'
## Change directory to $DOCUMENTS_DIR
alias cddoc='cd "$DOCUMENTS_DIR"'
## Change directory to $DOWNLOAD_DIR
alias cddown='cd "$DOWNLOAD_DIR"'
## Change directory to $LOCAL_LIB_DIR
alias cdlib='cd "$LOCAL_LIB_DIR"'
## Change directory to $MEDIA_DIR
alias cdmed='cd "$MEDIA_DIR"'
## Change directory to $MUSIC_DIR
alias cdmus='cd "$MUSIC_DIR"'
## Change directory to $PICTURES_DIR
alias cdpic='cd "$PICTURES_DIR"'
## Change directory to $PLAYLISTS_DIR
alias cdplay='cd "$PLAYLISTS_DIR"'
## Change directory to $PUBLIC_DIR
alias cdpub='cd "$PUBLIC_DIR"'
## Change directory to $TEMP_DIR
alias cdtmp='cd "$TEMP_DIR"'
## Change directory to $VIDEOS_DIR
alias cdvid='cd "$VIDEOS_DIR"'
## Change directory to $VOLUMES_DIR
alias cdvol='cd "$VOLUMES_DIR"'
## Change directory to $WORKSPACE_DIR
alias cdwork='cd "$WORKSPACE_DIR"'

## Save current working directory
alias cdsave='echo "$PWD" > $HOME/.local/share/cd'
## Restore current working directory
alias cdload='cd "$(< $HOME/.local/share/cd)"'

## Change directory to a fzf search result
alias cdfzf='cd "$(find -type d | fzfls)"'
## Change directory to a fzf search result (source files only)
alias cdfzfsrc='cd "$(findsrc -type d | fzfls)"'

## Change directory to a workspace project search result
alias cdprj='cd "$WORKSPACE_DIR" && cd "$(findprj -vZ -d2 -D3 | sed -z "s;^\./;;" | choose -izp "Project:" -d "$OLDPWD")"'

## Change directory to a Maven project search result
alias cdmvndir='cd "$(findprj -mZ | choose -izp "Directory:")"'
## Change directory to a Maven project root (upward search)
alias cdmvnroot='cd "$(findprj -mu)"'

## Change directory to a NodeJS project search result
alias cdnpmdir='cd "$(findprj -nZ | choose -izp "Directory:")"'
## Change directory to a NodeJS project root
alias cdnpmroot='cd "$(findprj -nu)"'
