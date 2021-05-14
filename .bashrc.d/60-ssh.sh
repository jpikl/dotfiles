# shellcheck shell=bash

## Start SSH agent
alias sshi='eval "$(sshctl start)"'
## Kill SSH agent
alias sshk='eval "$(sshctl stop)"'

## Select and add load SSH key
alias ssha='cd ~/.ssh && find -name "id_*" -not -name "*.pub" -printf "%P\0" | choose -izp "SSH key:" | xargs -ro ssh-add; cd "$OLDPWD"'
## List loaded SSH keys
alias sshl='cd ~/.ssh && fgrep -rHf <(ssh-add -L | cut -d" " -f2) | cut -d: -f1; cd "$OLDPWD"'
