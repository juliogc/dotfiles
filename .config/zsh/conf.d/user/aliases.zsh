#!/usr/bin/env zsh

#! █░█ █▀ █▀▀ █▀█ ░░▄▀ ▄▀█ █░░ █ ▄▀█ █▀ █▀▀ █▀
#! █▄█ ▄█ ██▄ █▀▄ ▄▀░░ █▀█ █▄▄ █ █▀█ ▄█ ██▄ ▄█

#  helpers 
WORKSPACE=$HOME/Sites

#  navigation 
alias desk='cd $HOME/Desktop'
alias downloads='cd $HOME/Downloads'
alias www="cd $WORKSPACE"

#  overrides 
alias ls="eza --group-directories-first --icons=always --sort=name -a"
alias ll="ls -l -g --hyperlink --git --color-scale --color-scale-mode=gradient --time-style=relative"
alias lt="ls --tree --level=1 --hyperlink"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'

#  network 
alias ippublic='dig +short myip.opendns.com @resolver1.opendns.com'
