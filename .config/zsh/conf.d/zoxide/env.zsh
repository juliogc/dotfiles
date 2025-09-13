#!/usr/bin/env zsh

#! ▀█ █▀█ ▀▄▀ █ █▀▄ █▀▀ ░░▄▀ █▀▀ █▄░█ █░█
#! █▄ █▄█ █░█ █ █▄▀ ██▄ ▄▀░░ ██▄ █░▀█ ▀▄▀

export _ZO_EXCLUDE_DIRS=$HOME/**/node_modules
export _ZO_FZF_OPTS="
  ${FZF_DEFAULT_OPTS}
  --preview='lsd --group-dirs first --color always --icon always --git -a --tree --depth 3 {2..}'
"
