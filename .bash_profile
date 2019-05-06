# shellcheck shell=bash
# shellcheck source=/dev/null

# Local override not committed in git
if [[ -f ~/profile_local ]]; then
  source ~/profile_local
fi

source ~/.profile
source ~/.bashrc
