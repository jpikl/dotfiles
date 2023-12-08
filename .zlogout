if [[ -d ~/.config/logout.d ]]; then
    for SCRIPT in ~/.config/logout.d/*.{sh,zsh}(N); do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
