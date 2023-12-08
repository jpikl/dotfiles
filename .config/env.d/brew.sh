# shellcheck shell=sh

# Brew environment might be already initialized in some toolbox/distrobox containers
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ] && [ ! -x "$(command -v brew)" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
