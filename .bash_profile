# shellcheck shell=bash
# shellcheck disable=SC1090

if [[ -d ~/.config/env.d ]]; then
    for SCRIPT in ~/.config/env.d/*.{sh,bash}; do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

if [[ -d ~/.config/profile.d ]]; then
    for SCRIPT in ~/.config/profile.d/*.{sh,bash}; do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

if [[ $- == *i* ]]; then
    if [[ -d ~/.config/rc.d ]]; then
        for SCRIPT in ~/.config/rc.d/*.{sh,bash}; do
            [[ -f "$SCRIPT" ]] && source "$SCRIPT"
        done
    fi
fi

if [[ -d ~/.config/login.d ]]; then
    for SCRIPT in ~/.config/login.d/*.{sh,bash}; do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
