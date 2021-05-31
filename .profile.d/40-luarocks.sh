# shellcheck shell=bash

# The default config file uses version suffix (e.g.: config-5.4.lua),
# we want, however, a single configuration file for all lua versions.
export LUAROCKS_CONFIG="$USER_CONFIG_DIR/luarocks/config.lua"

# Update paths for lua
if [[ -x "$(command -v luarocks)" ]]; then
  eval "$(luarocks path --append)"
fi
