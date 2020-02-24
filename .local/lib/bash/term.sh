# shellcheck shell=bash

term_has_colors() {
  [[ -t 1 && $(tput colors 2>/dev/null) -gt 0 ]]
}

term_has_icons() {
  [[ -t 1 && ${TERM_ICONS-} == true ]]
}
