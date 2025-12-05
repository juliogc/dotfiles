#!/usr/bin/env zsh

#! ░░█ █░█░█ ▀█▀   █▀▄ █▀▀ █▀▀ █▀█ █▀▄ █▀▀ █▀█
#! █▄█ ▀▄▀▄▀ ░█░   █▄▀ ██▄ █▄▄ █▄█ █▄▀ ██▄ █▀▄

jwt-decode() {
  jq -R 'split(".") |.[0:2] | map(gsub("-"; "+") | gsub("_"; "/") | gsub("%3D"; "=") | @base64d) | map(fromjson)' <<<$1
}
