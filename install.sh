# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  install.sh
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Install dependencies
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt update;
[ ! -x "$(command -v git)" ] && sudo apt install git -y;
[ ! -x "$(command -v zsh)" ] && sudo apt install zsh -y;
[ ! -x "$(command -v curl)" ] && sudo apt install curl -y;
[ ! -x "$(command -v zplug)" ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh;
[ ! -x "$(command -v nvm)" ] $$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash;
[ ! -x "$(command -v rbenv)" ] && git clone https://github.com/rbenv/rbenv.git ~/.rbenv;
[ ! -d "$(rbenv root)"/plugins/ruby-build ] && \
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build && \
    sudo apt install build-essential libssl-dev libreadline-dev zlib1g-dev -y;
[ ! -x "$(command -v fzy)" ] && sudo apt install fzy -y;

#  Set ZSH as default Shell
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "Setting ZSH as default shell. Prepare to insert your password in 5 seconds!!!"
sleep 5;
chsh -s $(which zsh);


#  Export variables
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SITES=$HOME/Sites;
DOTFILES=$SITES/dotfiles;
TERMINATOR=$HOME/.config/terminator;


#  Create directories arch
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -d $SITES ] && mkdir -p $SITES;
[ ! -d $TERMINATOR ] && mkdir -p $TERMINATOR;


#  Clone dotfiles
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[! -d $DOTFILES ] && git clone https://github.com/juliogc/dotfiles $DOTFILES;


#  Create symlinks
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -d $HOME/.zsh ] && ln -s $DOTFILES/.zsh $HOME/.zsh;
[ ! -f $HOME/.zshrc ] && ln -s $DOTFILES/.zshrc $HOME/.zshrc;

[ ! -f $HOME/.gitignore ] && ln -s $DOTFILES/.gitignore $HOME/.gitignore;
[ ! -f $HOME/.gitconfig ] && ln -s $DOTFILES/.gitconfig $HOME/.gitconfig;

[ ! -d $HOME/.vim ] && ln -s $DOTFILES/.vim $HOME/.vim;
[ ! -f $HOME/.vimrc ] && ln -s $DOTFILES/.vimrc $HOME/.vimrc;

[ ! -f $TERMINATOR/config ] && ln -s $DOTFILES/terminator/config $TERMINATOR/config;


#  Install Vundle
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ ! -d $HOME/.vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim;
vim +PluginInstall +qall;
