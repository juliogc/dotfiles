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
    libssl-dev libssl1.0-dev \
    libyaml-dev libxml2-dev libbison-dev libxslt1-dev libreadline-dev \
    libpq-dev \
    zlib1g zlib1g-dev \
    gawk;


#  Install shell packages
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -x "$(command -v htop)" ] && sudo apt install htop -y;
[ ! -x "$(command -v git)" ] && sudo apt install git -y;
[ ! -x "$(command -v vim)" ] && sudo apt install vim -y;
[ ! -x "$(command -v zsh)" ] && sudo apt install zsh -y;
[ ! -x "$(command -v curl)" ] && sudo apt install curl -y;
[ ! -x "$(command -v vim)" ] && sudo apt install vim -y;
[ ! -x "$(command -v zplug)" ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh;
[ ! -x "$(command -v fzy)" ] && sudo apt install fzy -y;


#  Install containers stack
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -x "$(command -v docker)" ] && sudo apt install docker.io -y;
sudo usermod -aG docker $USER;

[ ! -x "$(command -v kubectl)" ] && sudo snap install kubectl --channel=1.15/stable --classic;


#  Install AWS CLI
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd $HOME/Desktop;
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
unzip awscliv2.zip;
sudo ./aws/install;
rm -r ./awscliv2.zip ./aws;
cd $HOME;


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
echo "Setting ZSH as default shell. Prepare to insert your password in 5 seconds!!!"
sleep 5;
chsh -s $(which zsh);
