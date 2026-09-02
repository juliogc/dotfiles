#!/usr/bin/env zsh

#! █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀
#! █▄▄ █▄█ █░▀█ █▀░ █ █▄█

# Sources vital global environment variables and configurations
# shellcheck disable=SC1091
if ! . "$ZDOTDIR/conf.d/zsh/env.zsh"; then
  echo "Error: Could not source $ZDOTDIR/conf.d/zsh/env.zsh"
  return 1
fi
