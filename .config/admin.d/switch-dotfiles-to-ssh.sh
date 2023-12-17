#!/usr/bin/env sh

set -eu

dotenv git remote set-url origin git@github.com:jpikl/dotfiles.git
dotenv git submodule set-url .local/share/dotfiles/modules/pm git@github.com:jpikl/pm.git
dotenv git submodule set-url .local/share/dotfiles/modules/sshctl git@github.com:jpikl/sshctl.git
