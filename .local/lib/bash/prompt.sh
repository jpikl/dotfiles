# shellcheck shell=bash

readonly PURELINE_DIR=$BASH_LIB_DIR/pureline
readonly PURELINE_SCRIPT=$PURELINE_DIR/pureline
readonly PURELINE_CONFIG=$CONFIG_DIR/pureline.conf

if [[ -f $PURELINE_SCRIPT ]]; then
  source "$PURELINE_SCRIPT" "$PURELINE_CONFIG"
else
  {
    echo
    echo "Unable to setup prompt: pureline not installed!"
    echo "You can install pureline with:"
    echo "  dotfiles submodule update $PURELINE_DIR"
    echo
  } >&2
fi
