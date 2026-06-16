#!/usr/bin/env zsh

#! █▄█ ▄▀█ █▄▄ ▄▀█ █ ░░▄▀ █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
#! ░█░ █▀█ █▄█ █▀█ █ ▄▀░░ █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

# Upgrade yabai via Homebrew, re-sign with the local yabai-cert so the
# Accessibility TCC grant stays valid, and restart the LaunchAgent.
# Requires: yabai-cert (Code Signing, Always Trust) in the System keychain.
yabai-upgrade() {
  emulate -L zsh
  setopt err_return pipe_fail

  local cert="yabai-cert"
  local agent="com.asmvik.yabai"
  local bin

  command -v yabai >/dev/null || { print -u2 "yabai not installed"; return 1 }

  print "==> brew upgrade yabai"
  brew upgrade yabai || true   # tolerate "already up-to-date"

  bin="$(readlink -f "$(command -v yabai)")"
  print "==> Signing $bin"
  sudo xattr -cr "$bin"
  sudo codesign -fs "$cert" "$bin"
  codesign -v "$bin" || { print -u2 "signature verify failed"; return 1 }

  print "==> Restarting $agent"
  launchctl kickstart -k "gui/$(id -u)/$agent"

  sleep 2
  if pgrep -xq yabai; then
    print "==> yabai $(yabai --version) running"
  else
    print -u2 "yabai failed to start — check /tmp/yabai_${USER}.err.log"
    return 1
  fi
}
