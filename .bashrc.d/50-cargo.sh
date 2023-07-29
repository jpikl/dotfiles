# shellcheck shell=bash

## rustup and cargo autocomplete
if [[ -x $(command -v rustup) ]]; then
    source <(rustup completions bash)
    #source <(rustup completions bash cargo)
    # Workaround for https://github.com/rust-lang/rustup/issues/3407
    if [[ -f ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/src/etc/bash_completion.d/cargo ]]; then
        source ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/src/etc/bash_completion.d/cargo
    fi
fi
