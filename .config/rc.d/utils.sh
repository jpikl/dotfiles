# shellcheck shell=sh

alias diff='diff --color=auto' # Diff colored by default
alias grep='grep --color=auto' # Grep colored by default
alias mkdir='mkdir -p' # Make nested dirst by default
alias rmrf='rm -rf'
alias sortu='sort -u'
alias wcl='wc -l'
alias cutw='cut -c -$COLUMNS'  # Cut lines to fit terminal width
alias lspath='echo $PATH | tr : "\n"' # List PATH entries as lines
alias page='less -FIrX'

# Sort lines, output unique results with their count
sortuc() {
  sort | uniq -c | sort -nr
}
