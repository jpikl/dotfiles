if [[ -d ~/.config/login.d ]]; then
    for SCRIPT in ~/.config/login.d/*.{sh,zsh}(N); do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
