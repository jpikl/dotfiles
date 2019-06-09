# shellcheck shell=bash

confirm() {
  local reply
  read -n 1 -r -p "$1 [y/n]: " reply
  echo
  [[ $reply =~ [Yy] ]]
}

choose() {
  if [[ $# -le 1 ]]; then
    echo "${1:-}"
    return
  fi
  local reply
  select reply in "$@"; do
    if [[ $reply ]]; then
      echo "$reply"
      return
    fi
  done
}
