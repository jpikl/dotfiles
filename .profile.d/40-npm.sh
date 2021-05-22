# shellcheck shell=bash

# Main npm configuration
export NPM_CONFIG_USERCONFIG=$USER_CONFIG_DIR/npm/npmrc

# Npm on Widows uses a different directory layout and has to be therefore
# placed in different location rather than $USER_LOCAL_DIR configured in npmrc.
if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ ]]; then
  export NPM_CONFIG_PREFIX=$USER_DATA_DIR/npm
  export PATH=$PATH:$NPM_CONFIG_PREFIX
fi
