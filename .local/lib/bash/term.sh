# shellcheck shell=bash

term_has_colors() {
  [[ $(tput colors 2>/dev/null) -gt 0 ]]
}

term_has_icons() {
  [[ ${TERM_ICONS-} == true ]];
}
