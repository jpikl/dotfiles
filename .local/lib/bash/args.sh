# shellcheck shell=bash

help_usage() {
  echo "Try '$(self) -h' for more information."
}

die_invalid_opt() {
  if [ "$1" == : ]; then
    alert "option -$OPTARG requires an argument"
  else
    alert "invalid option -$OPTARG"
  fi
  help_usage
  die
} >&2

die_missing_arg() {
  alert "missing required argument"
  help_usage
  die
} >&2
