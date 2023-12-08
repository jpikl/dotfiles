# shellcheck disable=SC1091

# Arch Linux "command not found" support provided by `pgkfile` package
if [[ -f /usr/share/doc/pkgfile/command-not-found.bash ]]; then
  source /usr/share/doc/pkgfile/command-not-found.bash
fi
