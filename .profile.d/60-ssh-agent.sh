# shellcheck shell=bash

# Start ssh-agent using our sshctl wrapper
if [[ -x "$(command -v ssh-agent)" ]]; then
  eval "$(sshctl start)"
fi
