#!/usr/bin/env zsh

#! █▀▄▀█ ▄▀█ █▀ █▀█ █▄░█ ░░▄▀ █▀▀ █▄░█ █░█
#! █░▀░█ █▀█ ▄█ █▄█ █░▀█ ▄▀░░ ██▄ █░▀█ ▀▄▀

local MASON_HOME="$HOME/.local/share/nvim/mason"
if [[ -d "$MASON_HOME" ]]; then
  export PATH="$MASON_HOME/bin:$PATH"
fi
