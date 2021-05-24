# shellcheck shell=bash

## Make directory including its parent
alias mkdirp='mkdir --parents'

## Make directory including its parent and change into it
mkdirc() {
  mkdirp "$1" && cd "$1" || return 1
}
