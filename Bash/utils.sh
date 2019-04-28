# shellcheck shell=bash

echo_error() {
  >&2 echo "$@"
}

die() {
    [[ "$1" ]] && echo_error "$1"
    exit 1
}

confirm() {
  local reply
  read -n 1 -r -p "$1 [y/n]: " reply
  echo
  [[ $reply =~ [y/Y] ]]
}

cmd_exists() {
  command -v "$1" >/dev/null
}

require_cmd() {
  cmd_exists "$1" || die "Command '$1' is required!"
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
