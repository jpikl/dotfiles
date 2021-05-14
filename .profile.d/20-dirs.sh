# shellcheck shell=bash

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

# Export variables
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
