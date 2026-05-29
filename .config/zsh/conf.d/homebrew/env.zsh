#!/usr/bin/env zsh

#! █░█ █▀█ █▀▄▀█ █▀▀ █▄▄ █▀█ █▀▀ █░█░█
#! █▀█ █▄█ █░▀░█ ██▄ █▄█ █▀▄ ██▄ ▀▄▀▄▀

export HOMEBREW_BIN_LOCATION="/opt/homebrew/bin"
export PATH="$HOMEBREW_BIN_LOCATION:$PATH"

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
