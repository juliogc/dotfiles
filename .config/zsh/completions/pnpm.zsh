#!/usr/bin/env zsh

# pnpm completion
if command -v asdf &>/dev/null; then
  pnpm_completion="$(asdf exec pnpm completion zsh 2>/dev/null)"
elif command -v pnpm &>/dev/null; then
  pnpm_completion="$(pnpm completion zsh)"
fi

[[ -n "$pnpm_completion" ]] && eval "$pnpm_completion"
unset pnpm_completion
