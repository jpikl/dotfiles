# shellcheck shell=bash

readonly PURELINE_DIR=$BASH_LIB_DIR/pureline
readonly PURELINE_SCRIPT=$PURELINE_DIR/pureline
readonly PURELINE_CONFIG=$CONFIG_DIR/pureline.conf

if [[ -f $PURELINE_SCRIPT ]]; then
  term_title_module() {
    local title="\033]0;"
    local project_root
    if project_root=$(findprj -au 2>/dev/null); then
      title+="[$(basename "$project_root")] "
    fi
    title+="$PWD\007"
    PS1+=$title
  }
  source "$PURELINE_SCRIPT" "$PURELINE_CONFIG"
else
  {
    echo
    echo "Unable to setup pureline prompt!"
    echo "Install pureline with:"
    echo "  dotfiles submodule update $PURELINE_DIR"
    echo
  } >&2
fi
