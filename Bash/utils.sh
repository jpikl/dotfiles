# shellcheck shell=bash

is_integer() {
  [[ $1 =~ ^[0-9]+$ ]]
}

is_character() {
  [[ ${#1} == 1 ]]
}

is_printable() {
  [[ $1 =~ [^[:space:]] ]]
}

echo_error() {
  >&2 echo "$@"
}

echo_times() {
  for (( i = 0; i < $1; i++ )); do
    echo -n "$2"
  done
}

clear_line() {
  echo -ne "\r"
  echo_times "$1" " "
  echo -ne "\r"
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
