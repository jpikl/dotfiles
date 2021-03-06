# shellcheck shell=bash

if [[ ! $- == *i* ]]; then
  echo "${BASH_SOURCE[0]} sourced in non-interactive mode" >&2
  return
fi

# Numbering convention for ~/.bashrc.d/ scripts
# 0x - Initialization
# 1x - Bash configuration
# 2x - Environment setup
# 3x - Core apps (expected to be always available)
# 4x - System apps (might not be available in MinGW)
# 5x - Installed apps
# 6x - Dotfiles apps
# 7x - Local overrides
# 9x - Cleanup

for rc in ~/.bashrc.d/*.sh; do
  source "$rc"
done

unset rc
