# shellcheck shell=bash

# shellcheck disable=SC2139
## Install globaly the mostt essential npm packages
alias npmboot="npmgi ${NPM_BOOT_PACKAGES[*]}"

## Start npm development script
alias npmd='npmr -1 webpack-dev dev start'

## Npm in global mode
alias npmg='npm --global'
## Npm install (global mode)
alias npmgi='npmg install'
## Npm update (global mode)
alias npmgup='npmg update'
## Npm uninstall (global mode)
alias npmgun='npmg uninstall'
## List globaly installed npm packages
alias npmgl='npmg --depth=0 list'

## Npm install
alias npmi='npm install'
## Npm install (with node_modules removal)
alias npmii='rm -rf node_modules && npmi'
## Npm update
alias npmup='npm update'
## Npm uninstall
alias npmun='npm uninstall'
## List installed npm packages
alias npml='npm --depth=0 list'
