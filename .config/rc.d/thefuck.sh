# shellcheck shell=sh

# Init 'fuck' alias which corrects wrong commands
if [ -x "$(command -v thefuck)" ]; then
  eval "$(thefuck --alias)"
fi
