# shellcheck shell=bash

if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ ]]; then
  # Npm on Windows uses a different directory layout inside %AppData%.
  # Binaries are stored directly in the "prefix" directory.
  export PATH=$PATH:${NPM_CONFIG_PREFIX:-$APPDATA/npm}
else
  # Change the defaut /usr/local prefix to ~/.local
  export NPM_CONFIG_PREFIX=${NPM_CONFIG_PREFIX:-$USER_LOCAL_DIR}
  # Change the default ~/.npm cache to ~/.cache/npm
  export NPM_CONFIG_CACHE=${NPM_CONFIG_CACHE:-$USER_CACHE_DIR/npm}
  # Update path for npm binaries
  export PATH=$PATH:$NPM_CONFIG_PREFIX/bin
fi
