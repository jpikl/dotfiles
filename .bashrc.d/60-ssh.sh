# shellcheck shell=bash

## Start SSH agent
alias sshi='eval "$(sshctl start)"'
## Kill SSH agent
alias sshk='eval "$(sshctl stop)"'

## Select and add load SSH key
ssha() (
  cd ~/.ssh || return 1
  find . -name "id_*" -not -name "*.pub" -printf "%P\0" | choose -izp "SSH key:" | xargs -ro ssh-add
)

## List loaded SSH keys
sshl() (
  cd ~/.ssh || return 1
  grep -rHFf <(ssh-add -L | cut -d" " -f2) | cut -d: -f1
)
