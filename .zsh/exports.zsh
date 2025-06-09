#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Local exports
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# NVim
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export EDITOR="nvim"
export VISUAL="nvim"

# AWS CLI
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export AWS_PROFILE=local;

# Localstack
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export SERVICES=sns,sqs,dynamodb;

# User local binaries
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export PATH="$PATH:/home/`whoami`/.local/bin";
export PATH="/usr/local/sbin:$PATH";

# GO Lang exports
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [[ -d $HOME/.asdf/plugins/go ]]; then
  export GOPATH=$(go env GOPATH);
  export GOPKG=$GOPATH/bin;
  PATH=$PATH:$GOPKG;
fi;

# Java HOME exports
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -d $HOME/.asdf/plugins/java ] && . $HOME/.asdf/plugins/java/set-java-home.zsh;

# Docker export via brew
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -d $HOME/.docker ] && export PATH="$HOME/.docker/bin:$PATH";

# enhancd
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ENHANCD_USE_ABBREV=true

# FZF
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export FZF_DEFAULT_OPTS="
  --layout reverse
  --border
  --bind shift-up:preview-page-up,shift-down:preview-page-down
  --bind=ctrl-z:ignore,btab:up,tab:down
  --color=fg:-1,fg+:#cfc9c2,bg:-1,bg+:#24283b,gutter:-1
  --color=hl:#5f87af,hl+:#5fd7ff,info:#e0af68,marker:#9ece6a
  --color=prompt:#f7768e,spinner:#bb9af7,pointer:#bb9af7,header:#b4f9f8
  --color=border:#24283b,label:#cfc9c2,query:#cfc9c2
  --prompt='> '
  --marker='>'
  --pointer='◆'
  --separator='─'
  --scrollbar='│'
  --info='right'
  --height='40%'"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# zoxide
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export _ZO_EXCLUDE_DIRS=$HOME/**/node_modules
export _ZO_FZF_OPTS="
  ${FZF_DEFAULT_OPTS}
  --preview='lsd --group-dirs first --color always --icon always --git -a --tree --depth 3 {2..}'
"
