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

# Select files to add to Git
alias gitadd='git status --porcelain --no-renames -z | grep -zZ "^.[A-Z]" | cut -zc4- | choose -izmp "Add files" | xargs -r git add -v --'
# Select Git files to restore
alias gitres='git status --porcelain --no-renames -z | grep -zZ "^.[A-Z]" | cut -zc4- | choose -izmp "Restore files" | xargs -r git restore --'
# Select staged Git files to restore
alias gitress='git status --porcelain --no-renames -z | grep -zZ "^[A-Z]." | cut -zc4- | choose -izmp "Restore staged files" | xargs -r git restore -S --'
# Select untracked files to delete
alias gitdun='git status --porcelain --no-renames -z | grep -zZ "??" | cut -zc4- | choose -izmp "Delete untracked files" | xargs -r rm -vrf --'
