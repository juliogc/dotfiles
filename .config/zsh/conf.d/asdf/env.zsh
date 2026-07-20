#!/usr/bin/env zsh

#! ▄▀█ █▀ █▀▄ █▀▀ ░░▄▀ █▀▀ █▄░█ █░█
#! █▀█ ▄█ █▄▀ █▀░ ▄▀░░ ██▄ █░▀█ ▀▄▀

export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY="latest_installed"

#! • golang •
if [[ -d $ASDF_DATA_DIR/plugins/golang ]]; then
  source $ASDF_DATA_DIR/plugins/golang/set-env.zsh
fi

#! • java •
if [[ -d $ASDF_DATA_DIR/plugins/java ]]; then
  source $ASDF_DATA_DIR/plugins/java/set-java-home.zsh
fi

