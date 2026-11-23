#!/usr/bin/env zsh

#! █░█ █▀ █▀▀ █▀█
#! █▄█ ▄█ ██▄ █▀▄
#! • User-specific Zsh configuration •

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#! • Plugins •
plugins=(
  fzf
  fzf-tab
  aliases
  command-not-found
  docker
  docker-compose
  # dotfiles
  git
  kubectl
  zsh-256color
  zsh-autopair
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
