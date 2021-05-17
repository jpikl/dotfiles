# shellcheck shell=bash

# Select files to add to Git
alias gitadd='git status --porcelain --no-renames -z | grep -zZ "^.[A-Z]" | cut -zc4- | choose -izmp "Add files" | xargs -r git add -v --'
# Select Git files to restore
alias gitres='git status --porcelain --no-renames -z | grep -zZ "^.[A-Z]" | cut -zc4- | choose -izmp "Restore files" | xargs -r git restore --'
# Select staged Git files to restore
alias gitress='git status --porcelain --no-renames -z | grep -zZ "^[A-Z]." | cut -zc4- | choose -izmp "Restore staged files" | xargs -r git restore -S --'
# Select untracked files to delete
alias gitdun='git status --porcelain --no-renames -z | grep -zZ "??" | cut -zc4- | choose -izmp "Delete untracked files" | xargs -r rm -vrf --'
