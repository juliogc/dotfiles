#!/usr/bin/env zsh

#! █░█ █▀ █▀▀ █▀█
#! █▄█ ▄█ ██▄ █▀▄

# Always load environment files.
for file in "$ZDOTDIR"/conf.d/*/env.zsh(N); do
  [[ "$file" == "$ZDOTDIR/conf.d/zsh/env.zsh" ]] && continue
  source "$file"
done

# Load interactive environment before plugins so they initialize with the
# intended tool options.
if [[ -o interactive ]]; then
  for file in "$ZDOTDIR"/conf.d/*/env.interactive.zsh(N); do
    source "$file"
  done
fi

# Initialize the interactive terminal stack after user environment options.
if [[ -o interactive && -f "$ZDOTDIR/conf.d/zsh/terminal.zsh" ]]; then
  source "$ZDOTDIR/conf.d/zsh/terminal.zsh" ||
    echo "Error: Could not source $ZDOTDIR/conf.d/zsh/terminal.zsh"
fi

# User aliases and functions must load after Oh My Zsh so they remain the
# final overrides.
if [[ -o interactive ]]; then
  for file in "$ZDOTDIR"/conf.d/*/{aliases,functions}.zsh(N); do
    source "$file"
  done
fi
