# shellcheck shell=sh

# Prefer our sshctl wrapper
if [ -x "$(command -v sshctl)" ]; then
    eval "$(sshctl start 2>/dev/null)"
elif [ -x "$(command -v ssh-agent)" ]; then
    eval "$(ssh-agent -s)"
fi
