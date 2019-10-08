# shellcheck shell=bash

is_integer() {
  [[ $1 =~ ^[0-9]+$ ]]
}

is_decimal() {
  [[ $1 =~ ^([0-9]+\.)?[0-9]+$ ]]
}

is_character() {
  [[ ${#1} == 1 ]]
}

is_printable() {
  [[ $1 =~ [^[:space:]] ]]
}

is_one_of() {
  local value=$1
  shift
  for item in "$@"; do
    [[ $item == "$value" ]] && return 0
  done
  return 1
}

is_command() {
  command -v "$1" >/dev/null
}

is_mingw() {
   [[ $(uname) =~ ^MINGW ]]
}

repeat_value() {
  local i
  for (( i = 0; i < $1; i++ )); do
    echo -n "$2"
  done
}

join_values() {
  local separator=$1
  local result=
  shift
  for item in "$@"; do
    if [[ $result ]]; then
      result=$result$separator$item
    else
      result=$item
    fi
  done
  echo "$result"
}

remove_value() {
  local value=$1
  shift
  printf "%s\0" "$@" | grep --null \
                            --null-data \
                            --invert-match \
                            --line-regexp \
                            --fixed-strings \
                            "$value"
}
