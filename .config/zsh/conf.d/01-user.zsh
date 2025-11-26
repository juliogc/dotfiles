#!/usr/bin/env zsh

#! █░█ █▀ █▀▀ █▀█
#! █▄█ ▄█ ██▄ █▀▄

for file in $(find "$ZDOTDIR/conf.d" -mindepth 2 -type f -name "*.zsh" -and -not -path "*conf.d/zsh*" | sort -u); do
  source $file;
done;
