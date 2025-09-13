#!/usr/bin/env zsh

#! █▀▀ █▀█ █░░ █ █▀▄▀█ ▄▀█
#! █▄▄ █▄█ █▄▄ █ █░▀░█ █▀█

if command -v colima &>/dev/null; then
  eval "$(colima completion zsh)"
fi
