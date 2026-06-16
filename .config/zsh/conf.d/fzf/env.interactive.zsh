#!/usr/bin/env zsh

#! █▀▀ ▀█ █▀▀ ░░▄▀ █▀▀ █▄░█ █░█
#! █▀░ █▄ █▀░ ▄▀░░ ██▄ █░▀█ ▀▄▀

export FZF_DEFAULT_OPTS="
  --layout reverse
  --border
  --bind shift-up:preview-page-up,shift-down:preview-page-down
  --bind=ctrl-z:ignore,btab:up,tab:down
  --color=fg:-1,fg+:#cfc9c2,bg:-1,bg+:#24283b,gutter:-1
  --color=hl:#5f87af,hl+:#5fd7ff,info:#e0af68,marker:#9ece6a
  --color=prompt:#f7768e,spinner:#bb9af7,pointer:#bb9af7,header:#b4f9f8
  --color=border:#24283b,label:#cfc9c2,query:#cfc9c2
  --prompt='> '
  --marker='>'
  --pointer='◆'
  --separator='─'
  --scrollbar='│'
  --info='right'
  --height='40%'"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
