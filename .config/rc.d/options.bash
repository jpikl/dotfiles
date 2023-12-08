# Shell options
shopt -s histappend # Append entries to history file instead of overwriting it
shopt -s globstar   # Enable recursive `**` glob pattern
shopt -s nullglob   # Remove glob patterns which did not match any file (instead of raising an error)
shopt -s direxpand  # Expand directory variables (like $HOME) for auto completion

# History configuration
export HISTFILE=~/.bash_history          # Save file
export HISTSIZE=1000                     # Max records in memory
export HISTFILESIZE=1000                 # Max records saved to file
export HISTCONTROL=ignorespace:erasedups # Ignore commands starting with space + erase duplicates
