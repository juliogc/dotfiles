#!/usr/bin/env zsh

#! ▀█▀ █▀▀ █▀█ █▀▄▀█ █ █▄░█ ▄▀█ █░░
#! ░█░ ██▄ █▀▄ █░▀░█ █ █░▀█ █▀█ █▄▄


function _load_prompt() {
  [[ -f ${ZDOTDIR}/prompt.zsh ]] && source ${ZDOTDIR}/prompt.zsh
}

function _load_functions() {
  for file in "${ZDOTDIR:-$HOME/.config/zsh}/functions/"*.zsh; do
    [ -r "$file" ] && source "$file"
  done
}

function _load_completions() {

  for file in "${ZDOTDIR:-$HOME/.config/zsh}/completions/"*.zsh; do
    [ -r "$file" ] && source "$file"
  done
}

# Initialize completions with optimized performance
function _load_compinit() {
  autoload -Uz compinit

  # Enable extended glob for the qualifier to work
  setopt EXTENDED_GLOB

  # Fastest - use glob qualifiers on directory pattern
  if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
  else
    compinit -C
  fi

  _comp_options+=(globdots) # tab complete hidden files
}

# # History configuration
HISTFILE=${HISTFILE:-$ZDOTDIR/.zsh_history}
if [[ -f $HOME/.zsh_history ]] && [[ ! -f $HISTFILE ]]; then
  echo "Please manually move $HOME/.zsh_history to $HISTFILE"
  echo "Or move it somewhere else to avoid conflicts"
fi
HISTSIZE=50000
SAVEHIST=50000

export HISTFILE HISTSIZE SAVEHIST

if [[ -f $ZDOTDIR/user.zsh ]]; then
  source $ZDOTDIR/user.zsh
fi

_load_compinit

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

_load_prompt
_load_functions
_load_completions
