#!/usr/bin/env sh

set -eu

pm upgrade

if [ ! -x "$(command -v fzf)" ]; then
    pm install fzf
fi

pm install <~/.config/pkgs/base
