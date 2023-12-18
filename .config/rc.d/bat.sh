# shellcheck shell=sh

# Ubuntu/Debian have `batcat` binary instead of `bat`
if [ -x "$(command -v batcat)" ]; then
    alias bat=batcat
fi
