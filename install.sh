# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  install.sh
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Export variables
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SITES=$HOME/Sites;
DOTFILES=$SITES/dotfiles;
TERMINATOR=$HOME/.config/terminator;


#  Install apt dependencies
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
[ ! -x "$(command -v curl)" ] && sudo apt install curl -y;
[ ! -x "$(command -v htop)" ] && sudo apt install htop -y;
[ ! -x "$(command -v git)" ] && sudo apt install git -y;
[ ! -x "$(command -v vim)" ] && sudo apt install vim -y;
[ ! -x "$(command -v zsh)" ] && sudo apt install zsh -y;
[ ! -x "$(command -v zplug)" ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh;
[ ! -x "$(command -v fzy)" ] && sudo apt install fzy -y;
[ ! -x "$(command -v terminator)" ] && sudo apt install terminator -y;


#  Docker
#  [ ! -x "$(command -v docker)" ] && sudo apt install docker.io -y;
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ ! -x "$(command -v docker)" ]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg;

  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;

 sudo apt-get update;
 sudo apt-get install docker-ce docker-ce-cli containerd.io;
 sudo usermod -aG docker $USER;
fi;


#  Docker compose
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ ! -x "$(command -v docker-compose)" ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
  sudo chmod +x /usr/local/bin/docker-compose;
fi;


#  Kubernetes kubectl
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -x "$(command -v kubectl)" ] && sudo snap install kubectl --classic;


#  AWS CLI
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ ! -x "$(command -v aws)" ]; then
  cd $HOME/Desktop;
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
  unzip awscliv2.zip;
  sudo ./aws/install;
  rm -r ./awscliv2.zip ./aws;
  cd $OLDPWD;
fi;


#  Google Chrome
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ ! -x "$(command -v google-chrome)" ]; then
  CHROME_PACK="google-chrome-stable_current_amd64.deb";
  cd $HOME/Desktop;
  wget "https://dl.google.com/linux/direct/$CHROME_PACK"
  sudo apt install "./$CHROME_PACK"
  rm "./$CHROME_PACK"
  cd $OLDPWD;
fi;


#  Create directories arch
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -d $SITES ] && mkdir -p $SITES;
[ ! -d $TERMINATOR ] && mkdir -p $TERMINATOR;


#  Clone dotfiles
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -d $DOTFILES ] && git clone https://github.com/juliogc/dotfiles $DOTFILES;


#  Create symlinks
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -d $HOME/.zsh ] && ln -s $DOTFILES/.zsh $HOME/.zsh;
[ ! -f $HOME/.zshrc ] && ln -s $DOTFILES/.zshrc $HOME/.zshrc;

[ ! -f $HOME/.gitignore ] && ln -s $DOTFILES/.gitignore $HOME/.gitignore;
[ ! -f $HOME/.gitconfig ] && ln -s $DOTFILES/.gitconfig $HOME/.gitconfig;

[ ! -d $HOME/.vim ] && ln -s $DOTFILES/.vim $HOME/.vim;
[ ! -f $HOME/.vimrc ] && ln -s $DOTFILES/.vimrc $HOME/.vimrc;

[ ! -f $TERMINATOR/config ] && ln -s $DOTFILES/terminator/config $TERMINATOR/config;


#  [VIM] Install Vundle
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -d $HOME/.vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim;
vim +PluginInstall +qall;


#  Set ZSH as default Shell
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "Done!!";
echo "Please, run the chsh -s \$(which zsh) to set ZSH as default shell and restart the machine!";
