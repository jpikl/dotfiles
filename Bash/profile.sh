# shellcheck shell=bash
# shellcheck source=/dev/null

# Root directory for all Bash scripts
export BASH_DIR=~/Bash

# Local override not commited in git
if [[ -f $BASH_DIR/profile_local.sh ]]; then
  source "$BASH_DIR/profile_local.sh"
fi

# Core directories
[[ -z $BACKUP_DIR ]] && export BACKUP_DIR=~/Backup
[[ -z $DESKTOP_DIR ]] && export DESKTOP_DIR=~/Desktop
[[ -z $DOCUMENTS_DIR ]] && export DOCUMENTS_DIR=~/Documents
[[ -z $DOWNLOAD_DIR ]] && export DOWNLOAD_DIR=~/Downloads
[[ -z $LIBRARIES_DIR ]] && export LIBRARIES_DIR=~/Libraries
[[ -z $MUSIC_DIR ]] && export MUSIC_DIR=~/Music
[[ -z $PICTURES_DIR ]] && export PICTURES_DIR=~/Pictures
[[ -z $PLAYLISTS_DIR ]] && export PLAYLISTS_DIR=~/Playlists
[[ -z $PRIVATE_DECRYPTED_DIR ]] && export PRIVATE_DECRYPTED_DIR=~/Private
[[ -z $PRIVATE_ENCRYPTED_DIR ]] && export PRIVATE_ENCRYPTED_DIR=~/.private
[[ -z $PUBLIC_DIR ]] && export PUBLIC_DIR=~/Public
[[ -z $TEMP_DIR ]] && export TEMPLATES_DIR=~/Temp
[[ -z $TEMPLATES_DIR ]] && export TEMPLATES_DIR=~/Templates
[[ -z $VIDEOS_DIR ]] && export VIDEOS_DIR=~/Videos
[[ -z $WORKSPACE_DIR ]] && export VIDEOS_DIR=~/Workspace

# Library directories
[[ -z $MAVEN_DIR ]] && export MAVEN_DIR=$LIBRARIES_DIR/maven
[[ -z $NPM_DIR ]] && export NPM_DIR=$LIBRARIES_DIR/npm

# Prompt options
[[ -z $PROMPT_GIT_ENABLED ]] && export PROMPT_GIT_ENABLED=true

# Path
export PATH=$PATH:$BASH_DIR/bin
export PATH=$PATH:$NPM_DIR/bin # Unix
export PATH=$PATH:$NPM_DIR     # Windows

# Other
export EDITOR=vim
