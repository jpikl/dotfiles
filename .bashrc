# shellcheck shell=bash

if [[ ! $- == *i* ]]; then
  echo "${BASH_SOURCE[0]} sourced in non-interactive mode" >&2
  return
fi

# Numbering convention of scripts in ~/.bashrc.d/
# 0x - Initialization
# 1x - Bash configuration
# 2x - Environment setup
# 3x - Core utilities (expected to be always available)
# 4x - System utilities (might not be available in MinGW)
# 5x - Installed applications
# 6x - Things provided by dotfiles
# 9x - Cleanup

for file in ~/.bashrc.d/*.sh; do
  source "$file"
done

unset file
