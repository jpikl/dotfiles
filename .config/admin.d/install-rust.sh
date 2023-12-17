#!/usr/bin/env sh

set -eu

BASH_COMPLETIONS_DIR=~/.local/share/bash-completion/completions
ZSH_COMPLETIONS_DIR=~/.local/share/zsh/site-functions

if [ ! -x "$(command -v rustup)" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi

rustup self update
rustup install stable
rustup install nightly

echo "Generating bash completions"
mkdir -p "$BASH_COMPLETIONS_DIR"
rustup completions bash >"$BASH_COMPLETIONS_DIR/rustup"
rustup completions bash cargo >"$BASH_COMPLETIONS_DIR/cargo"

echo "Generating zsh completions"
mkdir -p "$ZSH_COMPLETIONS_DIR"
rustup completions zsh >"$ZSH_COMPLETIONS_DIR/_rustup"
rustup completions zsh cargo >"$ZSH_COMPLETIONS_DIR/_cargo"

if [ -f ~/.config/pkgs/cargo ]; then
  xargs -r cargo install <~/.config/pkgs/cargo
fi
