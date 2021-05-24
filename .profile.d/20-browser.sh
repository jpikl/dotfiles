# shellcheck shell=bash

export BROWSER=${BROWSER:-$(find_executable
  "chromium chrome google-chrome google-chrome-stable firefox"
  "lynx links"
)}
