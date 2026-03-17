#!/usr/bin/env zsh

#! █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
#! █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ █ █▄█ █░▀█ ▄█

[[ -o interactive ]] || return 0

for file in "${ZDOTDIR:-$HOME/.config/zsh}/completions/"*.zsh; do
  [ -r "$file" ] && source "$file"
done
