# shellcheck shell=sh

# Start/stop agent
alias sshi='eval "$(sshctl start)"'
alias sshk='eval "$(sshctl stop)"'

# Add/list keys
alias ssha='find ~/.ssh -type f -name "id*" -not -name "*.pub" -print0 | fzf --read0 --print0 | xargs -r0 ssh-add'
alias sshl='grep -Ff <(ssh-add -L) -R ~/.ssh'
