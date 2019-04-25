# shellcheck shell=bash

echo_error() {
  >&2 echo "$@"
}

die() {
    [[ "$1" ]] && echo_error "$1"
    exit 1
}

cmd_exists() {
  command "$1" 2>/dev/null
}

require_cmd() {
  cmd_exists "$1" || die "'$1' is required!"
}

require_gnu_getopt() {
  getopt --test >/dev/null
  [[ $? -eq 4 ]] || die "GNU getopt is required!"
}

get_args() {
  local -r name=$(basename "$0")
  local -r short_opts=$1
  shift
  local -r long_opts=$1
  shift
  getopt --name "$name" --options "$short_opts" --longoptions "$long_opts" -- "$@"
}
