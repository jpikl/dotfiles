# shellcheck shell=bash

## Sort lines, output unique results
alias sortu='sort --unique'

## Sort lines, output unique results with their count
sortuc() {
  sort | uniq --count | sort --numeric-sort --reverse
}
