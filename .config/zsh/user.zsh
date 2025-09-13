#!/usr/bin/env zsh

#! █░█ █▀ █▀▀ █▀█
#! █▄█ ▄█ ██▄ █▀▄
#! • User-specific Zsh configuration •

ZSH_THEME="powerlevel10k/powerlevel10k"

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

#! • keybindings •
bindkey "^U" backward-kill-line
# bindkey "\e\e[D" backward-word
# bindkey "\e\e[C" forward-word
bindkey "^H" backward-kill-word
