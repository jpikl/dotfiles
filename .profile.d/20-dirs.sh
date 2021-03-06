# shellcheck shell=bash

# Configurable home directories
export USER_AUDIO_DIR=${USER_BACKUP_DIR:-$HOME/Audio}
export USER_BACKUP_DIR=${USER_BACKUP_DIR:-$HOME/Backup}
export USER_DECRYPTED_DIR=${USER_DECRYPTED_DIR:-$HOME/Private}
export USER_DESKTOP_DIR=${USER_DESKTOP_DIR:-$HOME/Desktop}
export USER_DOCUMENTS_DIR=${USER_DOCUMENTS_DIR:-$HOME/Documents}
export USER_DOWNLOAD_DIR=${USER_DOWNLOAD_DIR:-$HOME/Downloads}
export USER_ENCRYPTED_DIR=${USER_ENCRYPTED_DIR:-$HOME/.private}
export USER_MUSIC_DIR=${USER_MUSIC_DIR:-$HOME/Music}
export USER_PICTURES_DIR=${USER_PICTURES_DIR:-$HOME/Pictures}
export USER_PUBLIC_DIR=${USER_PUBLIC_DIR:-$HOME/Public}
export USER_TEMP_DIR=${USER_TEMP_DIR:-$HOME/Temp}
export USER_VIDEOS_DIR=${USER_VIDEOS_DIR:-$HOME/Videos}
export USER_WORKSPACE_DIR=${USER_WORKSPACE_DIR:-$HOME/Workspace}

# Configurable home links
export USER_BINARIES_LINK=${USER_BINARIES_LINK:-$HOME/Binaries}
export USER_CACHE_LINK=${USER_CACHE_LINK:-$HOME/Cache}
export USER_CONFIG_LINK=${USER_CONFIG_LINK:-$HOME/Config}
export USER_DATA_LINK=${USER_DATA_LINK:-$HOME/Data}
export USER_GVFS_LINK=${USER_GVFS_LINK:-$HOME/Volumes}
export USER_LIBRARIES_LINK=${USER_LIBRARIES_LINK:-$HOME/Libraries}
export USER_MEDIA_LINK=${USER_MEDIA_LINK:-$HOME/Media}

# Home directories
export USER_CACHE_DIR=${USER_CACHE_DIR:-$XDG_CACHE_HOME} # Check XDG first
export USER_CACHE_DIR=${USER_CACHE_DIR:-$HOME/.cache}
export USER_CONFIG_DIR=${USER_CONFIG_DIR:-$XDG_CONFIG_HOME} # Check XDG first
export USER_CONFIG_DIR=${USER_CONFIG_DIR:-$HOME/.config}
export USER_LOCAL_DIR=${USER_LOCAL_DIR:-$HOME/.local}
export USER_BINARIES_DIR=${USER_BINARIES_DIR:-$USER_LOCAL_DIR/bin}
export USER_LIBRARIES_DIR=${USER_LIBRARIES_DIR:-$USER_LOCAL_DIR/lib}
export USER_DATA_DIR=${USER_DATA_DIR:-$XDG_DATA_HOME}  # Check XDG first
export USER_DATA_DIR=${USER_DATA_DIR:-$USER_LOCAL_DIR/share}

# Runtime user directories
export USER_RUNTIME_DIR=${USER_RUNTIME_DIR:-$XDG_RUNTIME_DIR} # Check XDG first
export USER_RUNTIME_DIR=${USER_RUNTIME_DIR:-/run/user/$UID}
export USER_GVFS_DIR=$USER_RUNTIME_DIR/gvfs
export USER_MEDIA_DIR=/run/media/$USER

# Update path for local binaries
export PATH=$PATH:$USER_BINARIES_DIR
