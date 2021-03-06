# shellcheck shell=bash

# We keep only the binary name from EDITOR variable.
# The rest are additional flags/options which are unnecessary.
# See ~/bashrc.d/20-editor.sh for more details.

## Open file with $EDITOR
alias edit='${EDITOR/ *}'

## Read pipe with $EDITOR
alias editpipe='xpipe ${EDITOR/ *}'
