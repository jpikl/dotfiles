# Mimic .zshenv behavior
[[ -f ~/.bash_env ]] && source ~/.bash_env

# Shell independent
[[ -f ~/.profile ]] && source ~/.profile

# Local overrides
[[ -f ~/.bash_profile.local ]] && source ~/.bash_profile.local

# Interactive shell
[[ -f ~/.bashrc && $- == *i* ]] && source ~/.bashrc

# Mimic .zlogin behavior
[[ -f ~/.bash_login ]] && source ~/.bash_login
