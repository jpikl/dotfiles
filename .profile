# shellcheck shell=bash

# Local override not committed in git
if [[ -f ~/.profile.local ]]; then
  source ~/.profile.local
fi

# Convert paths like 'C:\x\y\z' to '/c/x/y/z' for use with MSYS
normalize_path() {
  local path=$1
  if [[ $path =~ ^[a-zA-Z]: ]]; then
    path=${path,}       # Lower case first char
    path=${path/:/}     # Remove ':'
    path=/${path//\\//} # '\' to '/'
  fi
  echo "$path"
}

detect_program() {
  local file
  local files

  if [[ $DISPLAY ]]; then
    files="$1 $2" # GUI programs and then terminal programs
  else
    files=$2 # Terminal programs only
  fi

  for file in $files; do
    if [[ -x $(command -v "$file") ]]; then
      echo "$file"
      break
    fi
  done
}

# Home directories
export CACHE_DIR="$HOME/.cache"
export CONFIG_DIR="$HOME/.config"
export LOCAL_DIR="$HOME/.local"
export LOCAL_BIN_DIR="$LOCAL_DIR/bin"
export LOCAL_LIB_DIR="$LOCAL_DIR/lib"
export LOCAL_SHARE_DIR="$LOCAL_DIR/share"
export BASH_LIB_DIR="$LOCAL_LIB_DIR/bash"

# Runtime user directories
export MEDIA_DIR="/run/media/$USER"
export VOLUMES_DIR="/run/user/$UID/gvfs"

# Configurable home directories
BACKUP_DIR=$(normalize_path "${BACKUP_DIR:-"$HOME/Backup"}")
DECRYPTED_DIR=$(normalize_path "${DECRYPTED_DIR:-"$HOME/Private"}")
DESKTOP_DIR=$(normalize_path "${DESKTOP_DIR:-"$HOME/Desktop"}")
DOCUMENTS_DIR=$(normalize_path "${DOCUMENTS_DIR:-"$HOME/Documents"}")
DOWNLOAD_DIR=$(normalize_path "${DOWNLOAD_DIR:-"$HOME/Downloads"}")
ENCRYPTED_DIR=$(normalize_path "${ENCRYPTED_DIR:-"$HOME/.private"}")
MUSIC_DIR=$(normalize_path "${MUSIC_DIR:-"$HOME/Music"}")
PICTURES_DIR=$(normalize_path "${PICTURES_DIR:-"$HOME/Pictures"}")
PLAYLISTS_DIR=$(normalize_path "${PLAYLISTS_DIR:-"$HOME/Playlists"}")
PUBLIC_DIR=$(normalize_path "${PUBLIC_DIR:-"$HOME/Public"}")
TEMP_DIR=$(normalize_path "${TEMP_DIR:-"$HOME/Temp"}")
VIDEOS_DIR=$(normalize_path "${VIDEOS_DIR:-"$HOME/Videos"}")
WORKSPACE_DIR=$(normalize_path "${WORKSPACE_DIR:-"$HOME/Workspace"}")

# Export configured home directories
export BACKUP_DIR
export DECRYPTED_DIR
export DESKTOP_DIR
export DOCUMENTS_DIR
export DOWNLOAD_DIR
export ENCRYPTED_DIR
export MUSIC_DIR
export PICTURES_DIR
export PLAYLISTS_DIR
export PUBLIC_DIR
export TEMP_DIR
export VIDEOS_DIR
export WORKSPACE_DIR

# Configurable home links
BINARIES_LINK=$(normalize_path "${BINARIES_LINK:-"$HOME/Binaries"}")
CACHE_LINK=$(normalize_path "${CACHE_LINK:-"$HOME/Cache"}")
CONFIG_LINK=$(normalize_path "${CONFIG_LINK:-"$HOME/Config"}")
DATA_LINK=$(normalize_path "${DATA_LINK:-"$HOME/Data"}")
LIBRARIES_LINK=$(normalize_path "${LIBRARIES_LINK:-"$HOME/Libraries"}")
MEDIA_LINK=$(normalize_path "${MEDIA_LINK:-"$HOME/Media"}")
VOLUMES_LINK=$(normalize_path "${VOLUMES_LINK:-"$HOME/Volumes"}")

# Export configured home links
export BINARIES_LINK
export CACHE_LINK
export CONFIG_LINK
export DATA_LINK
export LIBRARIES_LINK
export MEDIA_LINK
export VOLUMES_LINK

# Tool variables
export LINKS_CONFIG_DIR="${CONFIG_DIR##*/}" # Has to be relative to the HOME dir
export LUAROCKS_CONFIG="$CONFIG_DIR/luarocks/config.lua"

# Configurable tool variables
BROWSER=${BROWSER:-$(detect_program "chromium chrome firefox" "links lynx")}
FZF_DEFAULT_OPTS=${FZF_DEFAULT_OPTS:-"--layout=reverse --exact --cycle"}
IDEA_PROPERTIES=$(normalize_path "${IDEA_PROPERTIES:-"$CONFIG_DIR/IntelliJIdea/idea.properties"}")
IDEA_VM_OPTIONS=$(normalize_path "${IDEA_VM_OPTIONS:-"$CONFIG_DIR/IntelliJIdea/idea.vmoptions"}")
NPM_PREFIX=$(normalize_path "${NPM_PREFIX:-"$LOCAL_DIR"}")
MAVEN_LOCAL_REPO=$(normalize_path "${MAVEN_LOCAL_REPO:-"$LOCAL_LIB_DIR/maven"}")
VISUAL=${VISUAL:-$(detect_program "sublime_text subl3 subl code codium" "vim nano")}

# Links unfortunately uses the same CONFIG_DIR variable as we do
if [[ $BROWSER == links ]]; then
  BROWSER="env CONFIG_DIR=$LINKS_CONFIG_DIR links"
fi

# If we want to use Sublime Text or Visual Studio Code as Git commit editor,
# they need their process to be foreground until they are really closed.
if [[ $VISUAL =~ ^sublime_text|subl3|subl|code|codium$ ]]; then
  VISUAL="$VISUAL --wait"
fi

# Export configured tool variables
export BROWSER
export FZF_DEFAULT_OPTS
export IDEA_PROPERTIES
export IDEA_VM_OPTIONS
export NPM_PREFIX
export MAVEN_LOCAL_REPO
export VISUAL

# Path for local binaries
PATH=$PATH:$LOCAL_BIN_DIR

# Path for npm binaries
if [[ ${MSYSTEM:-} =~ ^MINGW(32|64)$ ]]; then
  PATH=$PATH:$NPM_PREFIX # Npm on Windows puts binaries here, not in $NPM_PREFIX/bin
elif [[ $NPM_PREFIX != "$LOCAL_DIR" ]]; then
  PATH=$PATH:$NPM_PREFIX/bin # Otherwise $NPM_PREFIX/bin matches $LOCAL_BIN_DIR which is already in PATH
fi

# Export final path
export PATH

# Tools that initialize environment
[[ -x "$(command -v luarocks)" ]] && eval "$(luarocks path --append)"
[[ -x "$(command -v ssh-agent)" ]] && eval "$(sshctl start)" # After we exported PATH

# Cleanup
unset normalize_path
unset detect_program
