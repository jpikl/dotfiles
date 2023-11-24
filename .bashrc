# Mimic .zshenv behavior
# Skip if this was already sourced by .bash_profile
[[ -f ~/.bash_env ]] && ! shopt -q login_shell && source ~/.bash_env

# Shell independent
[[ -f ~/.shrc ]] && source ~/.shrc

# Local overrides
[[ -f ~/bashrc.local ]] && . ~/bashrc.local
