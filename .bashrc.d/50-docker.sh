# shellcheck shell=bash

## Docker container operations
alias doco='docker container'

## Docker image operations
alias doim='docker image'

## Docker volume operations
alias dovo='docker volume'

## Execute command in a docker container
alias doex='docker exec -it'

## Start Bash in a docker container
doba() {
  if [[ $1 ]]; then
    docker exec -it "$1" bash -li
  else
    echo "Usage: doba <container>"
  fi
}
