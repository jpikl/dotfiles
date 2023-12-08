# shellcheck shell=sh
# shellcheck disable=SC2089
# shellcheck disable=SC2090

# Colored pager for man
if [ -x "$(command -v batcat)" ]; then
  # Ubuntu/Debian have `batcat` binary instead of `bat`
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  export MANROFFOPT="-c" 
elif [ -x "$(command -v bat)" ]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c" 
else
  export MANPAGER="lesser -R --use-color -Dd+c -Du+m"
  export MANROFFOPT="-c" 
fi

# Our own implementation when man is not available (MinGW)
if [ ! -x "$(command -v man)" ]; then
  alias man=wman
fi
