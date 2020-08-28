# shellcheck shell=bash

# Check interactive mode
if [[ $- != *i* ]]; then
  echo "${BASH_SOURCE[0]} sourced in non-interactive bash mode" >&2
  return
fi

# Shell options
shopt -s histappend   # Append entries to history file
shopt -s globstar     # Enable recursive "**" glob pattern

# Do not add commands starting with space to history + erase duplicates.
export HISTCONTROL=ignorespace:erasedups

# Tools that initialize environment
[[ -x "$(command -v dircolors)" ]] && eval "$(dircolors --bourne-shell)"
[[ -x "$(command -v thefuck)" ]] && eval "$(thefuck --alias)"
[[ -x "$(command -v starship)" ]] && eval "$(starship init bash)"

# Detect icons support in terminal
if [[ ! $TERM_ICONS ]]; then
  if [[ $DISPLAY ]]; then
    export TERM_ICONS=true
  else
    export TERM_ICONS=false
  fi
fi

# Use colored pager for man
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

# Aliases are in a separate file
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

# Local override not committed in git
if [[ -f ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi
