# shellcheck shell=bash

# Our own implementation when tree is not available
if [[ ! -x "$(command -v tree)" ]]; then
  alias tree='dirtree -s'
fi
