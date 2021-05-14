# shellcheck shell=bash

# The same value should configured in ~/.npmrc
export NPM_PREFIX=$HOME/.npm-global

# Update path for npm binaries
if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ ]]; then
  export PATH=$PATH:$NPM_PREFIX # Npm on Windows puts binaries here, not in bin
elif [[ $NPM_PREFIX != "$LOCAL_DIR" ]]; then
  export PATH=$PATH:$NPM_PREFIX/bin
fi
