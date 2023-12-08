if [[ -d ~/.config/env.d ]]; then
    for SCRIPT in ~/.config/env.d/*.{sh,zsh}(N); do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
