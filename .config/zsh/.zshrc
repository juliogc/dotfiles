#!/usr/bin/env zsh

#! ░ ▀█ █▀ █░█ █▀█ █▀▀
#! ▄ █▄ ▄█ █▀█ █▀▄ █▄▄

#! Configure Zsh options
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_EXPIRE_DUPS_FIRST # Remove duplicates first when HISTSIZE is met
setopt HIST_EXPIRE_DUPS_FIRST # Expire dup event first when trimming hist
setopt HIST_FIND_NO_DUPS      # Do not display previously found event
setopt HIST_IGNORE_ALL_DUPS   # Delete old event if new is dup
setopt HIST_SAVE_NO_DUPS      # Do not write dup event to hist file
setopt HIST_IGNORE_DUPS       # Ignore dupes if a command is issued multiple times in a row
setopt HIST_VERIFY            # Allow editing the command before executing again
setopt HIST_IGNORE_SPACE      # Do not add commands prefixed with a space to the history

#!  Initialize asdf properly before using shims
export ASDF_DATA_DIR="$HOME/.asdf"
[[ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]] && source "$(brew --prefix asdf)/libexec/asdf.sh"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

#!  golang
if [[ -d $HOME/.asdf/plugins/golang ]]; then
  source ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
fi

#!  zoxide
[[ -x "$(command -v zoxide)" ]] && eval "$(zoxide init zsh --cmd cd --hook pwd)"

fastfetch
