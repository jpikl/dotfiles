# shellcheck shell=bash

# Exit error codes
ERR_GENERIC=1
ERR_UNPROCESSABLE_ARGS=100
ERR_INVALID_ARGS=101
ERR_MISSING_ARGS=102
ERR_UNABLE_CD=103
ERR_CMD_NOT_FOUND=104

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

self() {
  basename "$0"
}

print_usage_hint() {
  echo_error "Try '$(self) --help' for more information."
}

die() {
  [[ "$1" ]] && echo_error "$(self): $1"
  exit "${2:-$ERR_GENERIC}"
}

die_invalid_args() {
  print_usage_hint
  exit $ERR_INVALID_ARGS
}

die_unprocessable_args() {
  echo_error "$(self): Internal error: Unable to process arguments!"
  exit $ERR_UNPROCESSABLE_ARGS
}

die_missing_args() {
  echo_error "$(self): Missing required argument!"
  print_usage_hint
  exit $ERR_MISSING_ARGS
}

die_unable_cd() {
  exit $ERR_UNABLE_CD
}

die_cmd_not_found() {
  die "Command $1 is required!" $ERR_CMD_NOT_FOUND
}

cmd_exists() {
  command -v "$1" >/dev/null
}

require_cmd() {
  cmd_exists "$1" || die_cmd_not_found "$1"
}

require_gnu_getopt() {
  getopt --test >/dev/null
  [[ $? -eq 4 ]] || die "GNU getopt is required!" $ERR_CMD_NOT_FOUND
}

get_args() {
  local -r short_opts=$1
  local -r long_opts=$2
  shift 2
  getopt --name "$(self)" \
         --options "$short_opts" \
         --longoptions "$long_opts" \
         -- "$@"
}

confirm() {
  local reply
  read -n 1 -r -p "$1 [y/n]: " reply
  echo
  [[ $reply =~ [y/Y] ]]
}
