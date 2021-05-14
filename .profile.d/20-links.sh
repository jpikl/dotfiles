# shellcheck shell=bash

# Configurable home links
BINARIES_LINK=$(normalize_path "${BINARIES_LINK:-"$HOME/Binaries"}")
CACHE_LINK=$(normalize_path "${CACHE_LINK:-"$HOME/Cache"}")
CONFIG_LINK=$(normalize_path "${CONFIG_LINK:-"$HOME/Config"}")
DATA_LINK=$(normalize_path "${DATA_LINK:-"$HOME/Data"}")
LIBRARIES_LINK=$(normalize_path "${LIBRARIES_LINK:-"$HOME/Libraries"}")
MEDIA_LINK=$(normalize_path "${MEDIA_LINK:-"$HOME/Media"}")
VOLUMES_LINK=$(normalize_path "${VOLUMES_LINK:-"$HOME/Volumes"}")

# Export variables
export BINARIES_LINK
export CACHE_LINK
export CONFIG_LINK
export DATA_LINK
export LIBRARIES_LINK
export MEDIA_LINK
export VOLUMES_LINK
