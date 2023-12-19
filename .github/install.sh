#!/usr/bin/env sh

set -eu

# =============================================================================
# Utils
# =============================================================================

DOTFILES_DIR=$HOME/.local/share/dotfiles/git

dotfiles() {
    git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"
}

heading() {
    echo
    echo "====================[ $1 ]===================="
    echo
}

task() {
    heading "$1"
    shift
    "$@"
    echo "Done"
}

confirm() {
    printf "\n%s [y/n]: " "$1"
    read -r ANSWER </dev/tty

    if [ "$ANSWER" != y ] && [ "$ANSWER" != Y ]; then
        echo >&2 "Installation canceled!"
        exit 1
    fi
}

# =============================================================================
# Tasks
# =============================================================================

clone_repo() {
    if [ -d "$DOTFILES_DIR" ]; then
        confirm "$DOTFILES_DIR already exits! Delete it?"
        rm -rf "$DOTFILES_DIR"
    fi
    git clone --bare https://github.com/jpikl/dotfiles.git "$DOTFILES_DIR"
}

checkout_files() {
    # Force native symlinks on windows (requires developer mode to be enabled).
    dotfiles config core.symlinks true

    if ! dotfiles checkout; then
        confirm "Git checkout failed! Try again with '--force'?"
        dotfiles checkout --force
    fi
}

update_env() {
    export PATH="$PATH:$HOME/.local/bin"
}

update_submodules() {
    # Switch from SSH to HTTPS for now (we do not have SSH configured yet)
    dotfiles submodule set-url .local/share/dotfiles/modules/pm https://github.com/jpikl/pm.git
    dotfiles submodule set-url .local/share/dotfiles/modules/sshctl https://github.com/jpikl/sshctl.git
    dotfiles submodule update --init
}

post_install() {
    runner ~/.config/admin.d/ </dev/tty
}

# =============================================================================
# Run
# =============================================================================

task "Clone repository" clone_repo
task "Checkout files" checkout_files
task "Update environment" update_env
task "Update submodules" update_submodules
task "Post-install" post_install
heading "Success"
echo "Logout and login for all changes to take effect!"
