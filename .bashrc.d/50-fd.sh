# shellcheck shell=bash

if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ && -x "$(command -v fd)" ]]; then
    # Clear previous alias in case of reload
    unalias fd &>/dev/null

    # Use forward slashes for output results.
    # TODO: Remove once this fix is released https://github.com/sharkdp/fd/pull/730
    alias fd='fd --path-separator=//'
fi
