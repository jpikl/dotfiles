# Initialize prompt
if [[ -x "$(command -v starship)" ]]; then
  eval "$(starship init zsh)"
else
  # ''
  # '<cyan>$WORKDIR</cyan>'
  # 'at <yellow>$TIME</yellow> err <red>$LAST_EXIT_CODE</red> ❭ '
  PROMPT=$'\n%F{cyan}%d%f\nat %F{yellow}%*%f err %F{red}%?%f ❭ '
fi
