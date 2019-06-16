# shellcheck shell=bash

self() {
  basename "$0"
}

alert() {
  echo "$(self): $1"
}

die() {
  [[ "${1:-}" ]] && alert "$1" >&2
  exit 1
}

