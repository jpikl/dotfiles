# shellcheck shell=bash

# We keep only the binary name from EDITOR variable.
# The rest are additional flags/options which are unnecessary.
# See ~/bashrc.d/20-editor.sh for more details.

## Open file with $EDITOR
alias edit='${EDITOR/ *}'

## Read pipe and open the result with $EDITOR
editpipe() {
  if [[ $# -gt 0 ]]; then
    xpipe -e "$1" "${EDITOR/ *}"
  else
    xpipe "${EDITOR/ *}"
  fi
}
