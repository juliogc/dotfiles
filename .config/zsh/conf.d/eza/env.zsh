#!/usr/bin/env zsh

#! █▀▀ ▀█ ▄▀█ ░░▄▀ █▀▀ █▄░█ █░█
#! ██▄ █▄ █▀█ ▄▀░░ ██▄ █░▀█ ▀▄▀

if type eza &>/dev/null; then
  export EZA_DEFAULT_OPTIONS="
    --group-directories-first
    --hyperlink=never
    --icons=auto
    --sort=name
    --total
  "
  export EZA_COLORS="
    uu=38;5;208:gu=38;5;130:\
    ur=38;5;28:uw=38;5;178:ux=38;5;124:ue=38;5;5:\
    da=38;5;246:db=38;5;255:dc=38;5;8:\
    sn=38;5;22:sb=38;5;22:sm=38;5;22:sl=38;5;1:\
    xx=38;5;245
  "
fi
