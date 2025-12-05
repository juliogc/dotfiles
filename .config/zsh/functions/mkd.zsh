#!/usr/bin/env zsh

#! █▀▄▀█ █▄▀ █▀▄
#! █░▀░█ █░█ █▄▀

#!  Attempts to create and navigate to directory specified by pathname.
function mkd() {
  mkdir -p "$@" && cd "$_"
}
