# shellcheck shell=bash

if [[ ! $EDITOR ]]; then
  EDITOR=$(find_executable \
    "sublime_text subl3 subl codium code" \
    "vim nano" \
  )

  # If we want to use Sublime Text or Visual Studio Code as Git commit editor,
  # they need their process to be foreground until they are actually closed.
  if [[ $EDITOR =~ ^sublime_text|subl3|subl|code|codium$ ]]; then
    EDITOR="$EDITOR --wait"
  fi
fi

export EDITOR
export VISUAL=$EDITOR
