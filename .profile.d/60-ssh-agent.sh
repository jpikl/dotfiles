# shellcheck shell=bash

# Start ssh-agent using our sshctl wrapper
if [[ -x "$(command -v ssh-agent)" ]]; then
  eval "$(sshctl start 2>/dev/null)"
fi
