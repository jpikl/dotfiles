# shellcheck shell=bash

is_command() {
  command -v "$1" >/dev/null
}

is_mingw() {
   [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ ]]
}

get_tty() {
  if [[ -t 0 ]]; then
    tty # stdin is connected to tty
    return 0
  fi

  local device
  if is_mingw; then
    device=/dev/$(ps -p $$ | tail --lines=+2 | awk '{print $5}') # MinGW ps has very limited options.
  else
    device=/dev/$(ps h -o tty -p $$) # No header, output tty, current PID.
  fi

  if [[ ! -c $device ]]; then
    alert "unable to detect tty" >&2
    return 1
  fi

  echo "$device"
}
