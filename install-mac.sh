#!/usr/bin/env bash
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  install-mac.sh
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Variables
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ZSH=$HOME/.ohmyzsh;
ZSH_CUSTOM=$ZSH/custom;
DOTFILES=$ZSH_CUSTOM/plugins/dotfiles;
SITES=$HOME/Sites;

#  Colors
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Regular
Blu='\e[0;34m';

#  Bold
BGre='\e[1;32m';
BYel='\e[1;33m';
BWhi='\e[1;37m';

#  No Color
NC='\e[0m'

#  Helpers
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DIVIDER=`printf %81s |tr " " "="`;

__display_header() {
  printf "\n${BYel}$DIVIDER\n${NC}"
  printf "${BGre}  $1\n${NC}"
  printf "${BYel}$DIVIDER\n${NC}"
}

__display_message() {
  printf "${Blu}==>${NC}${BWhi} $1\n${NC}";
}

__display_warn() {
  printf "${Blu}==>${NC}${BYel} $1\n${NC}";
}

#  Create directories arch
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Creating directories arch";
if [[ ! -d $SITES ]]
then
  mkdir -p $SITES;
  __display_message "$SITES created";
else
  __display_warn "$SITES already exists";
fi;

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  Homebrew
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing Homebrew"
if [[ ! -x "$(command -v brew)" ]];
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
  printf "${BGre}! Homebrew installed\n${NC}";
else
  __display_warn "Homebrew already installed";
fi

#  Homebrew Formulaes
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing Formulaes"

formulaes=(
  emojify
  fzy
  gawk
  htop
  kubectx
  tig
  watch
);

for formulae in $formulaes; do
  if [[ ! -x "$(command -v $formulae)" ]];
  then
    brew install $formulae;
    __display_message "$formulae installed";
  else
    __display_warn "$formulae already installed";
  fi;
done;

#  Homebrew Casks
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing Casks";

casks=(
  appcleaner
  dbeaver-community
  docker
  flutter
  intellij-idea-ce
  memory-cleaner
  rar
  rectangle
);

for cask in $casks; do
  brew list $cask 2> /dev/null;
  if [[ $? -eq 0 ]];
  then
    __display_warn "$cask already installed\n";
  else
    brew install $cask;
    __display_message "$cask installed\n";
  fi;
done;

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  dotfiles
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Cloning dotfiles";
if [[ ! -d "$SITES/dotfiles" ]];
then
  git clone git@github.com:juliogc/dotfiles.git "$SITES/dotfiles";
  __display_message "dotfiles clonned";
else
  __display_warn "dotfiles already clonned";
fi;

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  asdf
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing asdf";
if [[ ! -d $HOME/.asdf ]];
then
  git clone git@github.com:asdf-vm/asdf.git $HOME/.asdf;
  __display_message "asdf installed";
else
  __display_warn "asdf already installed";
fi;

#  asdf plugins
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
asdf_plugins=(
  nodejs
  java
  jq
);

for asdf_plugin in $asdf_plugins; do
  if [[ ! `asdf plugin list | grep $asdf_plugin` =~ $asdf_plugin ]];
  then
    asdf plugin add $asdf_plugin;
    __display_message "$asdf_plugin installed";
  else
    __display_warn "$asdf_plugin already installed";
  fi;
done;

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  oh-my-zsh
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing oh-my-zsh";
if [[ ! -d $ZSH ]];
then
  git clone git@github.com:ohmyzsh/ohmyzsh.git $ZSH;
  __display_message "oh-my-zsh installed";
else
  __display_warn "oh-my-zsh already installed";
fi;

#  oh-my-zsh plugins
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing oh-my-zsh plugins";
if [[ ! -d "$ZSH_CUSTOM/plugins/enhancd" ]];
then
  git clone git@github.com:b4b4r07/enhancd.git "$ZSH_CUSTOM/plugins/enhancd";
  __display_message "enhancd installed";
else
  __display_warn "enhancd already installed";
fi;

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-better-npm-completion" ]];
then
  git clone git@github.com:lukechilds/zsh-better-npm-completion.git "$ZSH_CUSTOM/plugins/zsh-better-npm-completion";
  __display_message "zsh-better-npm-completion installed";
else
  __display_warn "zsh-better-npm-completion already installed";
fi;

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]];
then
  git clone git@github.com:zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions";
  __display_message "zsh-autosuggestions installed";
else
  __display_warn "zsh-autosuggestions already installed";
fi;

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]];
then
  git clone git@github.com:zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions";
  __display_message "zsh-completions installed";
else
  __display_warn "zsh-completions already installed";
fi;

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]];
then
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting";
  __display_message "zsh-syntax-highlighting installed";
else
  __display_warn "zsh-syntax-highlighting already installed";
fi;

if [[ ! -d "$ZSH_CUSTOM/plugins/dotfiles" ]];
then
  ln -s "$SITES/dotfiles" "$ZSH_CUSTOM/plugins/dotfiles";
  __display_message "dotfiles installed";
else
  __display_warn "dotfiles already installed";
fi;

#  oh-my-zsh themes
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing oh-my-zsh themes";
if [[ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]];
then
  git clone git@github.com:spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
  __display_message "zsh-syntax-highlighting installed";
else
  __display_warn "zsh-syntax-highlighting already installed";
fi;

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  Create symlinks
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Create symlinks"

symlinks=(
  .zshrc
  .gitignore
  .gitconfig
  .vimrc
);

for symlink in $symlinks; do
  if [[ ! -f $HOME/$symlink ]]
  then
    ln -s $DOTFILES/$symlink $HOME/$symlink;
    __display_message "$symlink created";
  else
    __display_warn "$symlink already exists";
  fi;
done;

if [[ ! -d $HOME/.vim ]];
then
  ln -s $DOTFILES/.vim $HOME/.vim;
  __display_message ".vim created";
else
  __display_warn ".vim already exists";
fi;

#  [VIM] Install Vundle
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing vundle";
if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]
then
  git clone git@github.com:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim;
  vim +PluginInstall +qall;

  __display_message "vundle installed";
else
  __display_warn "vundle already installed";
fi;
