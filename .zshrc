if [[ -d ~/.config/rc.d ]]; then
    for SCRIPT in ~/.config/rc.d/*.{sh,zsh}(N); do
        [[ -f "$SCRIPT" ]] && source "$SCRIPT"
    done
fi

unset SCRIPT
