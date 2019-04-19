# shellcheck shell=bash
# shellcheck source=/dev/null

# Interactive mode check
if [[ $- != *i* ]]; then
  echo "${BASH_SOURCE[0]}: Attempt to source file in non-interactive mode!"
  return
fi

if [[ -z $BASH_DIR ]]; then
  echo "${BASH_SOURCE[0]}: Environment variable BASH_DIR is not defined!"
  return
fi

# Sources
source "$BASH_DIR/aliases.sh"
source "$BASH_DIR/prompt.sh"

# Binaries
[[ -f /usr/bin/thefuck ]] && eval "$(thefuck --alias)"

# Local override not commited in git
if [[ -f $BASH_DIR/rc_local.sh ]]; then
  source "$BASH_DIR/rc_local.sh"
fi
