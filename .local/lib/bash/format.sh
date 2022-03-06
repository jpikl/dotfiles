# shellcheck shell=bash

join_args() {
  local separator=$1
  shift
  if [[ $# -gt 0 ]]; then
    printf "%s" "$1"
    shift
    local arg
    for arg; do
      printf "%s%s" "$separator" "$arg"
    done
  fi
}

list_args() {
  join_args ", " "$@"
}
