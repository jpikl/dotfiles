# shellcheck shell=bash

## Start SSH agent if needed
alias sshi='eval "$(sshctl start)"'
## Kill SSH agent
alias sshk='eval "$(sshctl stop)"'
## Select and add load SSH key
alias ssha='sshctl add'
## List loaded SSH keys
alias sshl='sshctl list'
