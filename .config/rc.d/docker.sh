# shellcheck shell=sh

alias doco='docker container'
alias doim='docker image'
alias dovo='docker volume'
alias doex='docker exec -it'

# Exec shell in a docker container
doexsh() {
  if [ "$1" ]; then 
    docker exec -it "$1" sh -li
  else
    echo >&2 "Usage: doexsh <container>"
    return 1
  fi
}
