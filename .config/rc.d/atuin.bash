# shellcheck disable=SC1090

# Better shell history (Ctrkl+R) with atuin
if [[ -x "$(command -v atuin)" ]]; then
  [[ -f ~/.bash_preexec ]] && source ~/.bash_preexec
  eval "$(atuin init bash --disable-up-arrow)"
fi
