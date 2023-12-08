# shellcheck shell=sh
# shellcheck disable=SC1090

if [ -d ~/.config/env.d ]; then
    for SCRIPT in ~/.config/env.d/*.sh; do
        [ -f "$SCRIPT" ] && . "$SCRIPT"
    done
fi

if [ -d ~/.config/profile.d ]; then
    for SCRIPT in ~/.config/profile.d/*.sh; do
        [ -f "$SCRIPT" ] && . "$SCRIPT"
    done
fi

if [ -d ~/.config/login.d ]; then
    for SCRIPT in ~/.config/login.d/*.sh; do
        [ -f "$SCRIPT" ] && . "$SCRIPT"
    done
fi

unset SCRIPT
