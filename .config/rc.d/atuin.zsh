# Better shell history (Ctrkl+R) with atuin
if [[ -x "$(command -v atuin)" ]]; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi
