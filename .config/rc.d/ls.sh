# shellcheck shell=sh

# Generate LS_COLORS variable for better ls colors
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors --sh)"
fi

# File tree
if [ -x "$(command -v erd)" ]; then
    # Erd default options
    if [ "$DISPLAY" ]; then
        alias erd='erd --human --layout inverted --icons' # Show icons in graphical terminal
    else
        alias erd='erd --human --layout inverted' # Human readable sizes + Top-Down layout
    fi
    # Prefer erd over eza and tree (because it is much faster)
    tree() {
        if [ "$DISPLAY" ]; then
            env erd --human --layout inverted --icons --color=force "$@" | lesser -r
        else
            env erd --human --layout inverted --color=force "$@" | lesser -r
        fi
    }
elif [ -x "$(command -v eza)" ]; then
    # Fallback to eza "tree mode" if erd is not available
    tree() {
        if [ "$DISPLAY" ]; then
            env eza --git --icons --tree --color=always "$@" | lesser -r
        else
            env eza --git --tree --color=always "$@" | lesser -r
        fi
    }
elif [ -x "$(command -v tree)" ]; then
    # Fallback to the base tree command
    tree() { env tree -C | lesser -r; }
fi

# File list
if [ -x "$(command -v eza)" ]; then
    # Eza default options
    if [ "$DISPLAY" ]; then
        alias eza='eza --git --icons' # Show icons in graphical terminal
    else
        alias eza='eza --git' # Show git status column
    fi
    # Prefer eza over ls
    alias ls='eza'      # Override ls
    alias la='eza -a'   # With hidden files
    alias ll='eza -l'   # Long format (human readable sizes)
    alias lla='eza -la' # Long format with hidden files
else
    alias ls='ls --color=auto' # Colored by default
    alias la='ls -a'           # With hidden files
    alias ll='ls -lh'          # Long format (human readable sizes)
    alias lla='ls -lha'        # Long format with hidden files
fi
