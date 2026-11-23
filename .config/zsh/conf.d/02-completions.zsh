#!/usr/bin/env zsh

#! █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
#! █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ █ █▄█ █░▀█ ▄█

[[ -o interactive ]] || return 0

# _comp_cache <cmd> <generator...>
# Registers <cmd>'s completion without running the tool on every new shell.
#   - Skipped when <cmd> isn't installed, or compinit already registered it
#     from $fpath (e.g. Homebrew's site-functions or distro packages).
#   - Otherwise the generator's output is cached in $ZSH_CACHE_DIR/completions
#     and only regenerated when the binary is newer than the cache, or the
#     cache is older than 7 days (asdf shims/wrappers keep their mtime across
#     version switches).
#   - Outputs that call `compdef` themselves are sourced; bare completion
#     function bodies (e.g. asdf) are autoloaded as `_<cmd>`.
_comp_cache() {
  emulate -L zsh -o extended_glob
  local cmd=$1; shift
  (( $+commands[$cmd] )) || return 0
  (( $+_comps[$cmd] )) && return 0

  local dir="${ZSH_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh}/completions"
  local file="$dir/$cmd.zsh"

  if [[ ! -s $file || ${commands[$cmd]:A} -nt $file || -n $file(#qNmw+1) ]]; then
    "$@" >| "$file" 2>/dev/null
    [[ -s $file ]] || { command rm -f -- "$file"; return 0; }
  fi

  if [[ $'\n'$(<$file) == *$'\n'compdef\ * ]]; then
    source "$file"
  else
    [[ -f $dir/_$cmd && ! $file -nt $dir/_$cmd ]] || command cp -f -- "$file" "$dir/_$cmd"
    (( ${fpath[(Ie)$dir]} )) || fpath=("$dir" $fpath)
    autoload -Uz "_$cmd"
    compdef "_$cmd" "$cmd"
  fi
}

for file in "${ZDOTDIR:-$HOME/.config/zsh}/completions/"*.zsh; do
  [ -r "$file" ] && source "$file"
done

unfunction _comp_cache
