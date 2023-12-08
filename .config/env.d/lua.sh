# shellcheck shell=sh

# The default config file uses version suffix (e.g.: config-5.4.lua)
# but we want a single configuration file for all lua versions.
export LUAROCKS_CONFIG=~/.config/luarocks/config.lua

# Update environment for Lua (including PATH)
if [ -x "$(command -v luarocks)" ]; then
  eval "$(luarocks path --append)"
fi
