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
  [[ "${1-}" ]] && alert "$1"
  exit $ERR_GENERIC
} >&2

die_help() {
  alert "$1"
  echo "Try '$(self) -h' for more information."
  exit $ERR_GENERIC
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

die_no_var() {
  die "$1 variable is not set"
}
