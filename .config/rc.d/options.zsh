# Shell options
setopt APPEND_HISTORY       # Append entries to history file instead of overwriting it
setopt HIST_IGNORE_SPACE    # Do not save commands starting with space to history
setopt HIST_IGNORE_ALL_DUPS # Erase duplicates in history
setopt EXTENDED_GLOB        # Enable extended glob matching characters ‘#’, ‘~’, ‘^’
setopt NULL_GLOB            # Remove glob patterns which did not match any file (instead of raising an error)
setopt NOTIFY               # Report the status of background jobs immediately

# History configuration
HISTFILE=~/.zsh_history # Save file
HISTSIZE=1000           # Max records in memory
SAVEHIST=1000           # Max records saved to file
