#!/usr/bin/env zsh

#! █░█ █▀█ █▀▄▀█ █▀▀ █▄▄ █▀█ █▀▀ █░█░█
#! █▀█ █▄█ █░▀░█ ██▄ █▄█ █▀▄ ██▄ ▀▄▀▄▀

if type brew &>/dev/null; then
  local homebrew_completions="$(brew --prefix)/share/zsh/site-functions"
  if [[ -d "$homebrew_completions" ]]; then
    FPATH="$homebrew_completions:$FPATH"
  fi
fi
