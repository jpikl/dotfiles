# Path to local function definitions (auto completions)
fpath+=~/.local/share/zsh/site-functions

# Auto completer configuration
# _extensions   - Complete the glob `*.` with the possible file extensions
# _expand_alias - Expand an alias into the underlying command
# _complete     - The main completer
# _approximate  - Try to correct completion if no match is found
zstyle ':completion:*' completer _extensions _expand_alias _complete _approximate

# Enable auto completions
autoload -Uz compinit
compinit
