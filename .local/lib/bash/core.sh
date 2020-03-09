# shellcheck shell=bash

self() {
  echo "${0##*/}"
}

alert() {
  echo "$(self): $1"
}

die() {
  [[ "${1-}" ]] && alert "$1"
  exit 1
} >&2

die_help() {
  alert "$1"
  echo "Try '$(self) -h' for more information."
  exit 1
} >&2

die_invalid_opt() {
  if [ "$1" == : ]; then
    die_help "option -$OPTARG requires an argument"
  else
    die_help "invalid option -$OPTARG"
  fi
}

die_missing_arg() {
  die_help "missing required argument"
}
