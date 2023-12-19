# shellcheck shell=sh

if [ -x "$(command -v ssh-agent)" ] && [ -x "$(command -v sshctl)" ]; then
    eval "$(sshctl start 2>/dev/null)"
fi
