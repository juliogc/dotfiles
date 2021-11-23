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
  sudo chown -R $(whoami) $(brew --prefix)/*;
  printf "${BGre}! Homebrew installed\n${NC}";
else
  __display_warn "Homebrew already installed";
fi

#  Homebrew Formulaes
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing Formulaes"
if [[ ! -x "$(command -v emojify)" ]];
then
  brew install emojify;
  __display_message "emojify installed";
else
  __display_warn "emojify already installed";
fi;

if [[ ! -x "$(command -v fzy)" ]];
then
  brew install fzy;
  __display_message "fzy installed";
else
  __display_warn "fzy already installed";
fi;

if [[ ! -x "$(command -v gawk)" ]];
then
  brew install gawk;
  __display_message "gawk installed";
else
  __display_warn "gawk already installed";
fi;

if [[ ! -x "$(command -v htop)" ]];
then
  brew install htop;
  __display_message "htop installed";
else
  __display_warn "htop already installed";
fi;

if [[ ! -x "$(command -v kubectx)" ]];
then
  brew install kubectx;
  __display_message "kubectx installed";
else
  __display_warn "kubectx already installed";
fi;

if [[ ! -x "$(command -v tig)" ]];
then
  brew install tig;
  __display_message "tig installed";
else
  __display_warn "tig already installed";
fi;

if [[ ! -x "$(command -v watch)" ]];
then
  brew install watch;
  __display_message "watch installed";
else
  __display_warn "watch already installed";
fi;

if [[ ! -x "$(command -v lsd)" ]];
then
  brew install lsd;
  __display_message "lsd installed";
else
  __display_warn "lsd already installed";
fi;

#  Homebrew Casks
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_header "Installing Casks";
brew list appcleaner 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "appcleaner already installed\n";
else
  brew install appcleaner;
  __display_message "appcleaner installed\n";
fi;

brew list dbeaver-community 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "dbeaver-community already installed\n";
else
  brew install dbeaver-community;
  __display_message "dbeaver-community installed\n";
fi;

brew list docker 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "docker already installed\n";
else
  brew install docker;
  __display_message "docker installed\n";
fi;

brew list flutter 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "flutter already installed\n";
else
  brew install flutter;
  __display_message "flutter installed\n";
fi;

brew list intellij-idea-ce 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "intellij-idea-ce already installed\n";
else
  brew install intellij-idea-ce;
  __display_message "intellij-idea-ce installed\n";
fi;

brew list memory-cleaner 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "memory-cleaner already installed\n";
else
  brew install memory-cleaner;
  __display_message "memory-cleaner installed\n";
fi;

brew list rar 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "rar already installed\n";
else
  brew install rar;
  __display_message "rar installed\n";
fi;

brew list rectangle 2> /dev/null;
if [[ $? -eq 0 ]];
then
  __display_warn "rectangle already installed\n";
else
  brew install rectangle;
  __display_message "rectangle installed\n";
fi;

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
  source $HOME/.asdf/asdf.sh
  __display_message "asdf installed";
else
  __display_warn "asdf already installed";
fi;

#  asdf plugins
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [[ ! `asdf plugin list | grep nodejs` =~ nodejs ]];
then
  asdf plugin add nodejs;
  __display_message "nodejs installed";
else
  __display_warn "nodejs already installed";
fi;

if [[ ! `asdf plugin list | grep java` =~ java ]];
then
  asdf plugin add java;
  __display_message "java installed";
else
  __display_warn "java already installed";
fi;

if [[ ! `asdf plugin list | grep jq` =~ jq ]];
then
  asdf plugin add jq;
  __display_message "jq installed";
else
  __display_warn "jq already installed";
fi;

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
if [[ ! -f $HOME/.zshrc ]]
then
  ln -s $DOTFILES/.zshrc $HOME/.zshrc;
  __display_message ".zshrc created";
else
  __display_warn ".zshrc already exists";
fi;

if [[ ! -f $HOME/.gitignore ]];
then
  ln -s $DOTFILES/.gitignore $HOME/.gitignore;
  __display_message ".gitignore created";
else
  __display_warn ".gitignore already exists";
fi;

if [[ ! -f $HOME/.gitconfig ]];
then
  ln -s $DOTFILES/.gitconfig $HOME/.gitconfig;
  __display_message ".gitconfig created";
else
  __display_warn ".gitconfig already exists";
fi;

if [[ ! -d $HOME/.vim ]];
then
  ln -s $DOTFILES/.vim $HOME/.vim;
  __display_message ".vim created";
else
  __display_warn ".vim already exists";
fi;

if [[ ! -f $HOME/.vimrc ]];
then
  ln -s $DOTFILES/.vimrc $HOME/.vimrc;
  __display_message ".vimrc created";
else
  __display_warn ".vimrc already exists";
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