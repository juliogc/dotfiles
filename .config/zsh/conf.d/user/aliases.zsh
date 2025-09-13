#!/usr/bin/env zsh

#! █░█ █▀ █▀▀ █▀█ ░░▄▀ ▄▀█ █░░ █ ▄▀█ █▀ █▀▀ █▀
#! █▄█ ▄█ ██▄ █▀▄ ▄▀░░ █▀█ █▄▄ █ █▀█ ▄█ ██▄ ▄█

#  helpers 
WORKSPACE=$HOME/Sites;

#  navigation 
alias desk='cd $HOME/Desktop';
alias downloads='cd $HOME/Downloads';
alias www="cd $WORKSPACE";

#  overrides 
alias ls='eza --group-directories-first';
alias ll='eza -l -h -a --group-directories-first';
alias lt='eza -a --tree --level=1 --group-directories-first';
alias rm='rm -i';
alias cp='cp -i';
alias mv='mv -i';
alias vim='nvim';

#  network 
alias ippublic='dig +short myip.opendns.com @resolver1.opendns.com';
