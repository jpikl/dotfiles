if [[ -d ~/.config/profile.d ]]; then
    for SCRIPT in ~/.config/profile.d/*.{sh,zsh}(N); do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
