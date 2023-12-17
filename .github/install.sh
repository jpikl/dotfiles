#!/usr/bin/env sh

set -eu

DOTFILES_DIR=$HOME/.local/share/dotfiles

heading() {
    echo
    echo "====================[ $1 ]===================="
    echo
}

task() {
    NAME=$1
    shift

    heading "$NAME"
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

clone_repo() {
    if [ -d "$DOTFILES_DIR" ]; then
        confirm "$DOTFILES_DIR already exits! Delete it?"
        rm -rf "$DOTFILES_DIR"
    fi
    git clone --bare -b new https://github.com/jpikl/dotfiles.git "$DOTFILES_DIR"
}

checkout_files() {
    if ! do_checkout_files; then
        confirm "Git checkout failed! Try again with '--force'?"
        do_checkout_files --force
    fi
}

do_checkout_files() {
    git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" checkout "$@"
}

update_env() {
    . ~/.config/sh/env
}

update_submodules() {
    # Switch from SSH to HTTPS for now (we do not have SSH configured yet)
    dotenv git submodule set-url .local/share/dotfiles/modules/pm https://github.com/jpikl/pm.git
    dotenv git submodule set-url .local/share/dotfiles/modules/sshctl https://github.com/jpikl/sshctl.git
    dotenv git submodule update --init
}

post_install() {
    admin </dev/tty
}

task "Clone repository" clone_repo
task "Checkout files" checkout_files
task "Update environment" update_env
task "Update submodules" update_submodules
task "Post-install" post_install

heading "Success"
echo "Logout and login for all changes to take effect!"
