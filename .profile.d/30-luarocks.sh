# shellcheck shell=bash

# Luarocks main configuration file
export LUAROCKS_CONFIG="$CONF_DIR/luarocks/config.lua"

# Update paths for lua
if [[ -x "$(command -v luarocks)" ]]; then
  eval "$(luarocks path --append)"
fi
