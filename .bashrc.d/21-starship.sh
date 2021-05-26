# shellcheck shell=bash

if [[ -x "$(command -v starship)" ]]; then
  # Overrides 20-prompt.sh
  eval "$(starship init bash)"
fi
