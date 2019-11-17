# shellcheck shell=bash

is_command() {
  command -v "$1" >/dev/null
}

is_mingw() {
   [[ ${MSYSTEM:-} =~ ^MINGW(32|64)$ ]]
}
