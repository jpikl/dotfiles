# shellcheck shell=bash

path_from_env() {
  local path=${!1-}
  if [[ $path && $path != /* ]]; then
    die "$1 variable must be an absolute path"
  fi
  echo "$path"
}

path_make_absolute() {
  if [[ $1 && $1 != /* ]]; then
    realpath "$1"
  else
    echo "$1"
  fi
}
