# shellcheck shell=bash

confirm() {
  local reply
  read -n 1 -r -p "$1 [y/n]: " reply
  echo
  [[ $reply =~ [Yy] ]]
}
