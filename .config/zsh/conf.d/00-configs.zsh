#!/usr/bin/env zsh

#! █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀
#! █▄▄ █▄█ █░▀█ █▀░ █ █▄█

# Sources vital global environment variables and configurations
# shellcheck disable=SC1091
if ! . "$ZDOTDIR/conf.d/zsh/env.zsh"; then
    echo "Error: Could not source $ZDOTDIR/conf.d/zsh/env.zsh"
    return 1
fi


if [[ $- == *i* ]] && [ -f "$ZDOTDIR/conf.d/zsh/terminal.zsh" ]; then
    . "$ZDOTDIR/conf.d/zsh/terminal.zsh" || echo "Error: Could not source $ZDOTDIR/conf.d/zsh/terminal.zsh"
fi
