#!/usr/bin/env zsh

#! █░█ █▀█ █▀▄▀█ █▀▀ █▄▄ █▀█ █▀▀ █░█░█
#! █▀█ █▄█ █░▀░█ ██▄ █▄█ █▀▄ ██▄ ▀▄▀▄▀

export HOMEBREW_BIN_LOCATION="/opt/homebrew/bin"
export PATH="$HOMEBREW_BIN_LOCATION:$PATH"

export HOMEBREW_NO_ASK="1";

[ -x "$HOMEBREW_BIN_LOCATION/brew" ] && eval "$($HOMEBREW_BIN_LOCATION/brew shellenv)"
