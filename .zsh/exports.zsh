#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Local exports
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Spaceship theme
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export SPACESHIP_DIR_TRUNC=0;
export SPACESHIP_TIME_SHOW=true;
export SPACESHIP_USER_SHOW=true;
export SPACESHIP_TIME_FORMAT="%T";
export SPACESHIP_KUBECTL_SHOW=true;
export SPACESHIP_KUBECTL_VERSION_SHOW=false;
# [ ! -z "$WSL_DISTRO_NAME" ] && export SPACESHIP_BATTERY_SHOW=false;

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
if [[ -d $HOME/.asdf/plugins/java ]]; then
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

