# shellcheck shell=bash

# Main npm configuration
export NPM_CONFIG_USERCONFIG=$USER_CONFIG_DIR/npm/npmrc

# Global npm binaries should be installed to the $USER_BINARIES_DIR
# which is already in PATH. On Windows, however, binaries are installed
# to a different location.
if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ ]]; then
  export PATH=$PATH:${USER_LOCAL_DIR}
fi
