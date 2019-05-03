# shellcheck shell=bash
# shellcheck source=/dev/null

# Interactive mode check
if [[ $- != *i* ]]; then
  echo "${BASH_SOURCE[0]}: Attempt to source file in non-interactive mode!"
  return
fi

if [[ -z $BASH_DIR ]]; then
  echo "${BASH_SOURCE[0]}: Environment variable BASH_DIR is not defined!"
  echo "${BASH_SOURCE[0]}: ~/Bash/profile.sh was probably not sourced before!"
  return
fi

# Binaries
eval "$(dircolors --bourne-shell)"
command -v thefuck >/dev/null && eval "$(thefuck --alias)"

# Sources
source "$BASH_DIR/aliases.sh"
source "$BASH_DIR/prompt.sh"

# Local override not committed in git
if [[ -f $BASH_DIR/rc_local.sh ]]; then
  source "$BASH_DIR/rc_local.sh"
fi
