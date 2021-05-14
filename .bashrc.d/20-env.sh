# shellcheck shell=bash

# Tools that initialize environment
[[ -x "$(command -v dircolors)" ]] && eval "$(dircolors --bourne-shell)"
[[ -x "$(command -v thefuck)" ]] && eval "$(thefuck --alias)"
[[ -x "$(command -v starship)" ]] && eval "$(starship init bash)"

# Command-not-found handle provided by Arch Linux pgkfile package
# Requires manual DB update using: pkgfile --update
if [[ -f /usr/share/doc/pkgfile/command-not-found.bash ]]; then
  # shellcheck disable=SC1091
  source /usr/share/doc/pkgfile/command-not-found.bash
fi

# Icon support in terminal
# This is later used by some aliases and by ~/.local/bin/ sripts.
if [[ ! $TERM_ICONS ]]; then
  if [[ $DISPLAY ]]; then
    export TERM_ICONS=true
  else
    export TERM_ICONS=false
  fi
fi
