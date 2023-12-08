# shellcheck shell=sh

# Prefer nvim over vim/vi
if [ -x "$(command -v nvim)" ]; then
    alias vim=nvim
    alias vi=nvim
fi

# Helix editor shortcut
alias hx=helix
