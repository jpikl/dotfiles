# shellcheck shell=bash

# Command-not-found handle provided by Arch Linux pgkfile package
# Requires manual DB update using: pkgfile --update
if [[ -f /usr/share/doc/pkgfile/command-not-found.bash ]]; then
  # shellcheck disable=SC1091
  source /usr/share/doc/pkgfile/command-not-found.bash
fi
