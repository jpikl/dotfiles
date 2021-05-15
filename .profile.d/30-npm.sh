# shellcheck shell=bash

# The most essential npm packages
export NPM_BOOT_PACKAGES=(
  chokidar-cli
  eslint
  expo-cli
  http-server
  markdownlint-cli
  npm-check
  npm-check-updates
  stylelint
  yarn
)

# Prefix for installing global NPM packages
# The same value should configured in ~/.npmrc
export NPM_PREFIX=$HOME/.npm-global

# Update path for npm binaries
if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ ]]; then
  export PATH=$PATH:$NPM_PREFIX # Npm on Windows puts binaries here, not in bin
elif [[ $NPM_PREFIX != "$LOCAL_DIR" ]]; then
  export PATH=$PATH:$NPM_PREFIX/bin
fi

