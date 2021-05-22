# shellcheck shell=bash

# Use our own tree implementation when it is not installed or aliased
if ! command -v tree &>/dev/null; then
  alias tree='dirtree -s'
fi
