#!/usr/bin/env zsh

#! ▀█▀ █▀▀ █▀█ █▀▄▀█ █ █▄░█ ▄▀█ █░░
#! ░█░ ██▄ █▀▄ █░▀░█ █ █░▀█ █▀█ █▄▄

# Prompt preloads belong here only when a prompt engine explicitly requires
# code to run before the rest of the terminal stack. Powerlevel10k instant
# prompt used this pattern; Oh My Posh does not. Keep this as a reference point
# for future prompt engines that document an early preload requirement.
#
# function _load_prompt() {
#   # Example:
#   # [[ -f ${ZDOTDIR}/prompt.zsh ]] && source ${ZDOTDIR}/prompt.zsh
# }

function _load_functions() {
  for file in "${ZDOTDIR:-$HOME/.config/zsh}/functions/"*.zsh; do
    [ -r "$file" ] && source "$file"
  done
}

# Extended globbing (^, ~, #) for the whole interactive session.
setopt EXTENDED_GLOB

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

# Completion cache lives outside the dotfiles repo.
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"
[[ -d ${ZSH_COMPDUMP:h} ]] || mkdir -p "${ZSH_COMPDUMP:h}"

# NOTE: Oh My Zsh owns completion init: it runs `compinit` (after adding plugin
# dirs to fpath) and `bashcompinit` (lib/completion.zsh). Everything loaded
# afterwards (conf.d/02-completions.zsh: `compdef`, `complete`) relies on that.
# When switching to another plugin manager (e.g. zinit), restore it here:
#   autoload -Uz compinit bashcompinit
#   compinit -d "$ZSH_COMPDUMP"
#   bashcompinit
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Must run after compinit, which resets _comp_options.
_comp_options+=(globdots) # tab complete hidden files

_load_functions
