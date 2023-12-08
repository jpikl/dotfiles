# shellcheck shell=bash
# shellcheck disable=SC1090

if [[ -d ~/.config/logout.d ]]; then
    for SCRIPT in ~/.config/logout.d/*.{sh,bash}; do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
