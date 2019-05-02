# shellcheck shell=bash
# shellcheck source=/dev/null

# Root directory for all Bash scripts
export BASH_DIR=~/Bash

# Local override not commited in git
if [[ -f $BASH_DIR/profile_local.sh ]]; then
  source "$BASH_DIR/profile_local.sh"
fi

# Core directories
export BACKUP_DIR=${BACKUP_DIR:-~/Backup}
export DESKTOP_DIR=${DESKTOP_DIR:-~/Desktop}
export DOCUMENTS_DIR=${DOCUMENTS_DIR:-~/Documents}
export DOWNLOADS_DIR=${DOWNLOADS_DIR:-~/Downloads}
export LIBRARIES_DIR=${LIBRARIES_DIR:-~/Libraries}
export MUSIC_DIR=${MUSIC_DIR:-~/Music}
export PICTURES_DIR=${PICTURES_DIR:-~/Pictures}
export PLAYLISTS_DIR=${PLAYLISTS_DIR:-~/Playlists}
export PRIVATE_DECRYPTED_DIR=${PRIVATE_DECRYPTED_DIR:-~/Private}
export PRIVATE_ENCRYPTED_DIR=${PRIVATE_ENCRYPTED_DIR:-~/.private}
export PUBLIC_DIR=${PUBLIC_DIR:-~/Public}
export TEMP_DIR=${TEMP_DIR:-~/Temp}
export TEMPLATES_DIR=${TEMPLATES_DIR:-~/Templates}
export VIDEOS_DIR=${VIDEOS_DIR:-~/Videos}
export WORKSPACE_DIR=${WORKSPACE_DIR:-~/Workspace}

# Library directories
export MAVEN_DIR=${MAVEN_DIR:-$LIBRARIES_DIR/maven}
export NPM_DIR=${NPM_DIR:-$LIBRARIES_DIR/npm}

# Prompt options
export PROMPT_GIT_ENABLE=${PROMPT_GIT_ENABLED:-true}

# Path
export PATH=$PATH:$BASH_DIR/bin
export PATH=$PATH:$NPM_DIR/bin # Unix
export PATH=$PATH:$NPM_DIR     # Windows

# Other
export EDITOR=vim
