#!/usr/bin/env zsh

#! █▄█ ▄▀█ █▄█ ░░▄▀ █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
#! ░█░ █▀█ ░█░ ▄▀░░ █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

# AUR builds (makepkg) inherit the shell PATH. Keep asdf shims out of it so
# PKGBUILDs use the system toolchain declared in their makedepends (e.g.
# building asdf-vm with pacman's go, not asdf's).
if (( $+commands[yay] )); then
  yay() {
    local -a path=(${path:#${ASDF_DATA_DIR:-$HOME/.asdf}/shims})
    command yay "$@"
  }
fi
