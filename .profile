# shellcheck shell=bash

# Local override not committed in git
if [[ -f ~/.profile_local ]]; then
  source ~/.profile_local
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

# Home directories
BACKUP_DIR=$(normalize_path "${BACKUP_DIR:-"$HOME/Backup"}")
BINARIES_DIR=$(normalize_path "${BINARIES_DIR:-"$HOME/.local/bin"}")
CACHE_DIR=$(normalize_path "${CACHE_DIR:-"$HOME/.cache"}")
CONFIG_DIR=$(normalize_path "${CONFIG_DIR:-"$HOME/.config"}")
DATA_DIR=$(normalize_path "${DATA_DIR:-"$HOME/.local/share"}")
DESKTOP_DIR=$(normalize_path "${DESKTOP_DIR:-"$HOME/Desktop"}")
DOCUMENTS_DIR=$(normalize_path "${DOCUMENTS_DIR:-"$HOME/Documents"}")
DOWNLOAD_DIR=$(normalize_path "${DOWNLOAD_DIR:-"$HOME/Downloads"}")
LIBRARIES_DIR=$(normalize_path "${LIBRARIES_DIR:-"$HOME/.local/lib"}")
MUSIC_DIR=$(normalize_path "${MUSIC_DIR:-"$HOME/Music"}")
PICTURES_DIR=$(normalize_path "${PICTURES_DIR:-"$HOME/Pictures"}")
PLAYLISTS_DIR=$(normalize_path "${PLAYLISTS_DIR:-"$HOME/Playlists"}")
PRIVATE_DECRYPTED_DIR=$(normalize_path "${PRIVATE_DECRYPTED_DIR:-"$HOME/Private"}")
PRIVATE_ENCRYPTED_DIR=$(normalize_path "${PRIVATE_ENCRYPTED_DIR:-"$HOME/.private"}")
PUBLIC_DIR=$(normalize_path "${PUBLIC_DIR:-"$HOME/Public"}")
TEMP_DIR=$(normalize_path "${TEMP_DIR:-"$HOME/Temp"}")
VIDEOS_DIR=$(normalize_path "${VIDEOS_DIR:-"$HOME/Videos"}")
WORKSPACE_DIR=$(normalize_path "${WORKSPACE_DIR:-"$HOME/Workspace"}")

# Library directories
BASH_LIB_DIR=$(normalize_path "${BASH_LIB_DIR:-"$LIBRARIES_DIR/bash"}")
MAVEN_LIB_DIR=$(normalize_path "${MAVEN_LIB_DIR:-"$LIBRARIES_DIR/maven"}")
NPM_LIB_DIR=$(normalize_path "${NPM_LIB_DIR:-"$LIBRARIES_DIR/npm"}")

# System directories
MEDIA_DIR="/var/run/media/$USER"
VOLUMES_DIR="/run/user/$UID/gvfs"

# Links to directories
BINARIES_LINK=$(normalize_path "${BINARIES_LINK:-"$HOME/Binaries"}")
CACHE_LINK=$(normalize_path "${CACHE_LINK:-"$HOME/Cache"}")
CONFIG_LINK=$(normalize_path "${CONFIG_LINK:-"$HOME/Config"}")
DATA_LINK=$(normalize_path "${DATA_LINK:-"$HOME/Data"}")
LIBRARIES_LINK=$(normalize_path "${LIBRARIES_LINK:-"$HOME/Libraries"}")
MEDIA_LINK=$(normalize_path "${MEDIA_LINK:-"$HOME/Media"}")
VOLUMES_LINK=$(normalize_path "${VOLUMES_LINK:-"$HOME/Volumes"}")

unset normalize_path

# Home directires
export BACKUP_DIR
export BINARIES_DIR
export CACHE_DIR
export CONFIG_DIR
export DATA_DIR
export DESKTOP_DIR
export DOCUMENTS_DIR
export DOWNLOAD_DIR
export LIBRARIES_DIR
export MUSIC_DIR
export PICTURES_DIR
export PLAYLISTS_DIR
export PRIVATE_DECRYPTED_DIR
export PRIVATE_ENCRYPTED_DIR
export PUBLIC_DIR
export TEMP_DIR
export VIDEOS_DIR
export WORKSPACE_DIR

# Library directories
export BASH_LIB_DIR
export MAVEN_LIB_DIR
export NPM_LIB_DIR

# System directories
export MEDIA_DIR
export VOLUMES_DIR

# Links to directories
export BINARIES_LINK
export CACHE_LINK
export CONFIG_LINK
export DATA_LINK
export LIBRARIES_LINK
export MEDIA_LINK
export VOLUMES_LINK

# Path
export PATH=$PATH:$BINARIES_DIR
export PATH=$PATH:$NPM_LIB_DIR/bin # Unix
export PATH=$PATH:$NPM_LIB_DIR     # Windows

# Other
export EDITOR=vim
export FZF_DEFAULT_OPTS="--layout=reverse --exact --cycle"
export LUAROCKS_CONFIG="$CONFIG_DIR/luarocks/config.lua"

# Commands that set enviroment variables
command -v luarocks >/dev/null && eval "$(luarocks path --append)"
command -v ssh-agent >/dev/null && eval "$(sshstart)"
