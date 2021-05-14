# shellcheck shell=bash

# Home directories
export CACHE_DIR="$HOME/.cache"
export CONF_DIR="$HOME/.config"
export LOCAL_DIR="$HOME/.local"
export LOCAL_BIN_DIR="$LOCAL_DIR/bin"
export LOCAL_LIB_DIR="$LOCAL_DIR/lib"
export LOCAL_SHARE_DIR="$LOCAL_DIR/share"
export BASH_LIB_DIR="$LOCAL_LIB_DIR/bash"

# Runtime user directories
export MEDIA_DIR="/run/media/$USER"
export VOLUMES_DIR="/run/user/$UID/gvfs"

# Update path for local binaries
export PATH=$PATH:$LOCAL_BIN_DIR
