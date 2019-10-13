# shellcheck shell=bash

die_help() {
  alert "$1"
  echo "Try '$(self) -h' for more information."
  exit "$ERR_GENERIC"
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
