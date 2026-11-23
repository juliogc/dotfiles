#!/usr/bin/env zsh

#! █▀█ █▄░█ █▀█ █▀▄▀█
#! █▀▀ █░▀█ █▀▀ █░▀░█

if command -v pnpm &>/dev/null; then
  pnpm_completion="$(pnpm completion zsh 2>/dev/null)"
  [[ -n "$pnpm_completion" ]] && eval "$pnpm_completion"
  unset pnpm_completion
fi
