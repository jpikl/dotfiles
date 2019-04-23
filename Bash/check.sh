#!/usr/bin/env bash

files=(
  ../.bash_logout
  ../.bash_profile
  ../.bashrc
  ../.profile
  ../.xprofile
  *.sh
  bin/*
  lib/*.sh
)

echo "Checking the following files:"
echo

for file in "${files[@]}"; do
  echo "  $file"
done

shellcheck "${files[@]}" && printf "\nSUCCESS\n"
