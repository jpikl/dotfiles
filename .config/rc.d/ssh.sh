# shellcheck shell=sh

# Start/stop agent
alias sshi='eval "$(sshctl start)"'
alias sshk='eval "$(sshctl stop)"'

# Add/list keys
alias ssha='find ~/.ssh -type f -name "id*" -not -name "*.pub" -print0 | fzf --exit-0 --select-1 --read0 --print0 | xargs -r0 ssh-add'
alias sshl='grep -RFf <(ssh-add -L) ~/.ssh'
