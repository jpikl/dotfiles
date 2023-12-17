#!/usr/bin/env sh

set -eu

FNM_INSTALL_DIR=$HOME/.local/share/fnm
BASH_COMPLETIONS_DIR=~/.local/share/bash-completion/completions
ZSH_COMPLETIONS_DIR=~/.local/share/zsh/site-functions

# Always update to the latest fnm version
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$FNM_INSTALL_DIR" --skip-shell
export PATH="$PATH:$FNM_INSTALL_DIR"

eval "$(fnm env)"
fnm install --lts
fnm default lts-latest
fnm use lts-latest
corepack enable

echo "Generating bash completions"
mkdir -p "$BASH_COMPLETIONS_DIR"
npm completion >"$BASH_COMPLETIONS_DIR/npm"

echo "Generating zsh completions"
mkdir -p "$ZSH_COMPLETIONS_DIR"
npm completion >"$ZSH_COMPLETIONS_DIR/_npm"

if [ -f ~/.config/pkgs/npm ]; then
  xargs -r npm -g install <~/.config/pkgs/npm
fi
