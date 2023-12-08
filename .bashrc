# shellcheck shell=bash
# shellcheck disable=SC1090

if [[ -d ~/.config/env.d ]]; then
    for SCRIPT in ~/.config/env.d/*.{sh,bash}; do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

if [[ -d ~/.config/rc.d ]]; then
    for SCRIPT in ~/.config/rc.d/*.{sh,bash}; do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
