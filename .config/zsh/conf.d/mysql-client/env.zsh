#!/usr/bin/env zsh

#! █▀▄▀█ █▄█ █▀ █▀█ █░░ ░░▄▀ █▀▀ █▄░█ █░█
#! █░▀░█ ░█░ ▄█ ▀▀█ █▄▄ ▄▀░░ ██▄ █░▀█ ▀▄▀

# Homebrew's mysql-client is keg-only, so its binaries aren't linked into PATH.
local MYSQL_CLIENT_BIN="${HOMEBREW_PREFIX:-/opt/homebrew}/opt/mysql-client/bin"
if [[ -d "$MYSQL_CLIENT_BIN" ]]; then
  export PATH="$MYSQL_CLIENT_BIN:$PATH"
fi
