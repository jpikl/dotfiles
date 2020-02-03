# shellcheck shell=bash

readonly PURELINE_DIR=$BASH_LIB_DIR/pureline
readonly PURELINE_SCRIPT=$PURELINE_DIR/pureline
readonly PURELINE_CONFIG=$CONFIG_DIR/pureline.conf

if [[ -f $PURELINE_SCRIPT ]]; then
  # shellcheck disable=SC2034
  project_module() {
    local content

    if [[ -f pom.xml ]]; then
      content="${PL_SYMBOLS[mvn]} mvn"
      PS1+="$(section_end "$2" "$1")"
      PS1+="$(section_content "$2" "$1" " $content ")"
      __last_color="$1"
    fi

    if [[ -f package.json || -f yarn.lock ]]; then
      if [ -f yarn.lock ]; then
        content="${PL_SYMBOLS[yarn]} yarn"
      else
        content="${PL_SYMBOLS[npm]} npm"
      fi
      PS1+="$(section_end "$2" "$1")"
      PS1+="$(section_content "$2" "$1" " $content ")"
      __last_color="$1"
    fi
  }

  term_title_module() {
    local title="\033]0;"
    local project_root

    if project_root=$(findprj -au "$PWD" 2>/dev/null); then
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
