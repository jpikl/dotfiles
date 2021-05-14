# shellcheck shell=bash

# Colored pager for man
if [[ -x $(command -v bat) ]]; then
  export MANPAGER="$SHELL -c 'col --no-backspaces --spaces | bat --plain --language man'"
elif [[ -x $(command -v most) ]]; then
  export MANPAGER=most
elif [[ -x $(command -v less) ]]; then
  MANPAGER="env LESS_TERMCAP_mb=$(printf '\e[1;31m') \
                LESS_TERMCAP_md=$(printf '\e[1;36m') \
                LESS_TERMCAP_me=$(printf '\e[0m') \
                LESS_TERMCAP_so=$(printf '\e[01;44;33m') \
                LESS_TERMCAP_se=$(printf '\e[0m') \
                LESS_TERMCAP_us=$(printf '\e[1;32m') \
                LESS_TERMCAP_ue=$(printf '\e[0m') \
                less"
  export MANPAGER
fi

# Our own implementation when man is not available (MinGW)
if [[ ! -x "$(command -v man)" ]]; then
  alias man=wman
fi
