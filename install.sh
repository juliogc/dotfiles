#!/usr/bin/env bash
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  install.sh
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Variables
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ZSH=$HOME/.ohmyzsh;
ZSH_CUSTOM=$ZSH/custom;
DOTFILES=$ZSH_CUSTOM/plugins/dotfiles;
SITES=$HOME/Sites;
TERMINATOR=$HOME/.config/terminator;

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

if [[ ! -d $TERMINATOR ]]
then
  mkdir -p $TERMINATOR;
  __display_message "$TERMINATOR created";
else
  __display_warn "$TERMINATOR already exists";
fi;

#  apt dependencies
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt update;
sudo apt install -y \
    build-essential \
    libssl-dev \
    libyaml-dev libxml2-dev libbison-dev libxslt1-dev libreadline-dev \
    libpq-dev \
    zlib1g zlib1g-dev \
    gawk \
    apt-transport-https ca-certificates gnupg;


#  Install base packages
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [[ ! -x "$(command -v curl)" ]]
then
  sudo apt install curl -y;
  __display_message "curl installed";
else
  __display_warn "curl already installed";
fi;

if [[ ! -x "$(command -v htop)" ]]
then
  sudo apt install htop -y;
  __display_message "htop installed";
else
  __display_warn "htop already installed";
fi;

if [[ ! -x "$(command -v git)" ]]
then
  sudo apt install git -y;
  __display_message "git installed";
else
  __display_warn "git already installed";
fi;

if [[ ! -x "$(command -v vim)" ]]
then
  sudo apt install vim -y;
  __display_message "vim installed";
else
  __display_warn "vim already installed";
fi;

if [[ ! -x "$(command -v zsh)" ]]
then
  sudo apt install zsh -y;
  __display_message "zsh installed";
else
  __display_warn "zsh already installed";
fi;

if [[ ! -x "$(command -v fzy)" ]]
then
  sudo apt install fzy -y;
  __display_message "fzy installed";
else
  __display_warn "fzy already installed";
fi;

if [[ ! -x "$(command -v terminator)" ]]
then
  sudo apt install terminator -y;
  __display_message "terminator installed";
else
  __display_warn "terminator already installed";
fi;

if [[ ! -x "$(command -v imwheel)" ]]
then
  sudo apt install imwheel -y;
  __display_message "imwheel installed";
else
  __display_warn "imwheel already installed";
fi;

#  Docker
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [[ ! -x "$(command -v docker)" ]];
then
  sudo install -m 0755 -d /etc/apt/keyrings;
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg;
  sudo chmod a+r /etc/apt/keyrings/docker.gpg;

  echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update;
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;
  sudo usermod -aG docker $USER;

  __display_message "docker installed";
else
  __display_warn "docker already installed";
fi;

#  Kubernetes kubectl
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [[ ! -x "$(command -v kubectl)" ]]
then
  sudo snap install kubectl --classic;

  __display_message "kubectl installed";
else
  __display_warn "kubectl already installed";
fi;

#  AWS CLI
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ ! -x "$(command -v aws)" ];
then
  cd $HOME/Desktop;
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
  unzip awscliv2.zip;
  sudo ./aws/install;
  rm -r ./awscliv2.zip ./aws;
  cd $OLDPWD;

  __display_message "aws installed";
else
  __display_warn "aws already installed";
fi;

#  Google Chrome
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ ! -x "$(command -v google-chrome)" ];
then
  CHROME_PACK="google-chrome-stable_current_amd64.deb";
  cd $HOME/Desktop;
  wget "https://dl.google.com/linux/direct/$CHROME_PACK"
  sudo dpkg -i "./$CHROME_PACK"
  rm "./$CHROME_PACK"
  cd $OLDPWD;

  __display_message "google-chrome installed";
else
  __display_warn "google-chrome already installed";
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

if [[ (! `uname` =~ [Dd]arwin) && (! -f $TERMINATOR/config) ]];
then
  ln -s $DOTFILES/terminator/config $TERMINATOR/config;
  __display_message "terminator config created";
else
  __display_warn "terminator config already exists or it's not a Ubuntu OS";
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

#  Set ZSH as default Shell
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__display_message "Done!!";
__display_warn "Please, run the command \"chsh -s \$(which zsh)\" to set ZSH as default shell and restart the machine!";
