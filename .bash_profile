# Mimic zsh behaviour

[[ -f ~/.config/sh/env ]] && source ~/.config/sh/env
[[ -f ~/.config/sh/env.local ]] && source ~/.config/sh/env.local

[[ -f ~/.config/bash/env ]] && source ~/.config/bash/env
[[ -f ~/.config/bash/env ]] && source ~/.config/bash/env.local

[[ -f ~/.config/sh/profile ]] && source ~/.config/sh/profile
[[ -f ~/.config/sh/profile.local ]] && source ~/.config/sh/profile.local

[[ -f ~/.config/bash/profile ]] && source ~/.config/bash/profile
[[ -f ~/.config/bash/profile.local ]] && source ~/.config/bash/profile.local

if [[ $- == *i* ]]; then
  [[ -f ~/.config/sh/rc ]] && source ~/.config/sh/rc
  [[ -f ~/.config/sh/rc.local ]] && source ~/.config/sh/rc.local

  [[ -f ~/.config/bash/rc ]] && source ~/.config/bash/rc
  [[ -f ~/.config/bash/rc.local ]] && source ~/.config/bash/rc.local
fi

[[ -f ~/.config/sh/login ]] && source ~/.config/sh/login
[[ -f ~/.config/sh/login.local ]] && source ~/.config/sh/login.local

[[ -f ~/.config/bash/login ]] && source ~/.config/bash/login
[[ -f ~/.config/bash/login.local ]] && source ~/.config/bash/login.local
