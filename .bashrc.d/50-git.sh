# shellcheck shell=bash

## Select and checkout Git branch
alias gitcb='git lsb -lrsC | choose -ip "Checkout:" | xargs -r git checkout'
## Select and checkout Git tag
alias gitct='git tag | choose -ip "Checkout tag:" | xargs -r git checkout'

## Select and compare Git branches
alias gitcmpb='git lsb -lr | choose -imp "Compare:" | xargs -r git cmpb'

## Select and delete Git branch
alias gitdb='git lsb -lC | choose -imp "Delete:" | xargs -r git branch -d'
## Select and delete Git branch (with force)
alias gitdbf='gitdb -f'

## Select and fast-forward Git branch
alias gitffb=' git lsb -b | choose -imp "Fast-forward:" | xargs -r git ff'

## Select and merge Git branch
alias gitmb='git lsb -lrC | choose -ip "Merge to \""$(git lsb -c)"\":" | xargs -r git merge'
## Select and rease Git branch
alias gitrb='git lsb -lrC | choose -ip "Rebase \""$(git lsb -c)"\" onto:" | xargs -r git rebase'
