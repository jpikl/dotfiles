# shellcheck shell=bash

readonly ERR_GENERIC=1

self() {
  basename "$0"
}

die() {
  [[ "${1:-}" ]] && alert "$1" >&2
  exit "${2:-$ERR_GENERIC}"
}

alert() {
  echo "$(self): $1"
}

