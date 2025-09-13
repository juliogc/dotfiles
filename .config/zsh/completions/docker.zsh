#!/usr/bin/env zsh

#! █▀▄ █▀█ █▀▀ █▄▀ █▀▀ █▀█
#! █▄▀ █▄█ █▄▄ █░█ ██▄ █▀▄

if command -v docker &>/dev/null; then
  eval "$(docker completion zsh)"
fi
