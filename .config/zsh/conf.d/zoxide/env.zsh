#!/usr/bin/env zsh

#! ▀█ █▀█ ▀▄▀ █ █▀▄ █▀▀ ░░▄▀ █▀▀ █▄░█ █░█
#! █▄ █▄█ █░█ █ █▄▀ ██▄ ▄▀░░ ██▄ █░▀█ ▀▄▀

export _ZO_EXCLUDE_DIRS=$HOME/**/node_modules
export _ZO_FZF_OPTS="
  ${FZF_DEFAULT_OPTS}
  --preview='eza --group-directories-first --color=always --icons=always --git -a --tree --level=3 {2..}'
"
