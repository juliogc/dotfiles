#!/usr/bin/env zsh

#! █░█ █▀ █▀▀ █▀█
#! █▄█ ▄█ ██▄ █▀▄

# Always load environment files.
for file in "$ZDOTDIR"/conf.d/*/env.zsh(N); do
  [[ "$file" == "$ZDOTDIR/conf.d/zsh/env.zsh" ]] && continue
  source "$file"
done

# Interactive-only env, aliases, and functions.
if [[ -o interactive ]]; then
  for file in "$ZDOTDIR"/conf.d/*/{env.interactive,aliases,functions}.zsh(N); do
    source "$file"
  done
fi
