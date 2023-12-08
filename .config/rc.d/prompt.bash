# Initialize starship prompt or use fallback
if [[ -x "$(command -v starship)" ]]; then
  eval "$(starship init bash)"
else
  # ''
  # '<cyan>$WORKDIR</cyan>'
  # 'at <yellow>$TIME</yellow> err <red>$LAST_EXIT_CODE</red> ❭ '
  PS1="\n\[\e[36m\]\w\[\e[0m\]\nat \[\e[33m\]\t\[\e[0m\] err \[\e[31m\]\$?\[\e[0m\] ❭ "
fi
