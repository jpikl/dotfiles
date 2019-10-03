# shellcheck shell=bash

# shellcheck disable=SC2034
readonly ERR_OK=0
readonly ERR_GENERIC=1

self() {
  basename "$0"
}

alert() {
  echo "$(self): $1"
}

die() {
  [[ "${1:-}" ]] && alert "$1" >&2
  exit $ERR_GENERIC
}
