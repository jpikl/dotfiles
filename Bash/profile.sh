# shellcheck shell=bash
# shellcheck source=/dev/null

# Root directory for all Bash scripts
export BASH_DIR=~/Bash

# Local override not committed in git
if [[ -f $BASH_DIR/profile_local.sh ]]; then
  source "$BASH_DIR/profile_local.sh"
fi

normalize_path() {
  local path=$1

  if [[ $path =~ ^[a-zA-Z]: ]]; then
    # Convert paths like 'C:\Dir\SubDir' to '/c/Dir/SubDir' 
    # that will work with MSYS environment on Windows.
    path=${path,}       # Make first character lowercase.
    path=${path/:/}     # Remove ':' character.
    path=/${path//\\//} # Convert '\' separators to '/'.
  fi

  echo "$path"
}

# Directories init
BACKUP_DIR=$(normalize_path "${BACKUP_DIR:-"$HOME/Backup"}")
DESKTOP_DIR=$(normalize_path "${DESKTOP_DIR:-"$HOME/Desktop"}")
DOCUMENTS_DIR=$(normalize_path "${DOCUMENTS_DIR:-"$HOME/Documents"}")
DOWNLOADS_DIR=$(normalize_path "${DOWNLOADS_DIR:-"$HOME/Downloads"}")
LIBRARIES_DIR=$(normalize_path "${LIBRARIES_DIR:-"$HOME/Libraries"}")
MUSIC_DIR=$(normalize_path "${MUSIC_DIR:-"$HOME/Music"}")
PICTURES_DIR=$(normalize_path "${PICTURES_DIR:-"$HOME/Pictures"}")
PLAYLISTS_DIR=$(normalize_path "${PLAYLISTS_DIR:-"$HOME/Playlists"}")
PRIVATE_DECRYPTED_DIR=$(normalize_path "${PRIVATE_DECRYPTED_DIR:-"$HOME/Private"}")
PRIVATE_ENCRYPTED_DIR=$(normalize_path "${PRIVATE_ENCRYPTED_DIR:-"$HOME.private"}")
PUBLIC_DIR=$(normalize_path "${PUBLIC_DIR:-"$HOME/Public"}")
TEMP_DIR=$(normalize_path "${TEMP_DIR:-"$HOME/Temp"}")
TEMPLATES_DIR=$(normalize_path "${TEMPLATES_DIR:-"$HOME/Templates"}")
VIDEOS_DIR=$(normalize_path "${VIDEOS_DIR:-"$HOME/Videos"}")
WORKSPACE_DIR=$(normalize_path "${WORKSPACE_DIR:-"$HOME/Workspace"}")
MAVEN_DIR=$(normalize_path "${MAVEN_DIR:-"$LIBRARIES_DIR/maven"}")
NPM_DIR=$(normalize_path "${NPM_DIR:-"$LIBRARIES_DIR/npm"}")

# Directories export
export BACKUP_DIR
export DESKTOP_DIR
export DOCUMENTS_DIR
export DOWNLOADS_DIR
export LIBRARIES_DIR
export MUSIC_DIR
export PICTURES_DIR
export PLAYLISTS_DIR
export PRIVATE_DECRYPTED_DIR
export PRIVATE_ENCRYPTED_DIR
export PUBLIC_DIR
export TEMP_DIR
export TEMPLATES_DIR
export VIDEOS_DIR
export WORKSPACE_DIR
export MAVEN_DIR
export NPM_DIR

# Prompt options
export PROMPT_GIT_ENABLE=${PROMPT_GIT_ENABLED:-true}

# Path
export PATH=$PATH:$BASH_DIR/bin
export PATH=$PATH:$NPM_DIR/bin # Unix
export PATH=$PATH:$NPM_DIR     # Windows

# Other
export EDITOR=vim

# Cleanup
unset normalize_path
