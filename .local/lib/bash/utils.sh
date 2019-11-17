# shellcheck shell=bash

is_command() {
  command -v "$1" >/dev/null
}

is_mingw() {
  [[ ${MSYSTEM:-} =~ ^MINGW(32|64)$ ]]
}

is_one_of() {
  local value=$1
  shift
  for item; do
    [[ $item == "$value" ]] && return 0
  done
  return 1
}

join_values() {
  local separator=$1
  local result=
  shift
  for item; do
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
