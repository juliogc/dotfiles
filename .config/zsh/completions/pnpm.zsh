#!/usr/bin/env zsh

# pnpm completion
if command -v pnpm &>/dev/null; then
  eval "$(pnpm completion zsh)"
fi
