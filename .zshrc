#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# ~/.zshrc
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Exports
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export NVM_DIR="$HOME/.nvm"
export RBENV_DIR="$HOME/.rbenv"
export ZPLUG_DIR="$HOME/.zplug"
export ZSH="/home/jcorradi/.oh-my-zsh"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Imports
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# oh-my-zsh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -s "$ZSH/oh-my-zsh.sh" ] && \. "$ZSH/oh-my-zsh.sh"

# nvm
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# zplug
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -s "$ZPLUG_DIR/init.zsh" ] && \. "$ZPLUG_DIR/init.zsh"

# rbenv
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -d "$RBENV_DIR/bin" ] && export PATH="$RBENV_DIR/bin:$PATH"
eval "$(rbenv init -)"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Zplug Settings
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Import plugins
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
zplug "~/.zsh/*.zsh", from:local
zplug "b4b4r07/enhancd", use:init.sh
zplug "denysdovhan/spaceship-prompt", from:github, use:spaceship.zsh, as:theme
zplug "juliogc/emoji-cli", from:github, use:emoji-cli.plugin.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/zsh-syntax-highlighting", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "zsh-users/zsh-autosuggestions", from:github, use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # <- Must be last import

# Install plugins if there are plugins that have not been installed
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
zplug load

EMOJI_CLI_FILTER=$EMOJI_CLI_FILTER:fzy
# zle -N emoji::cli
# bindkey "$EMOJI_CLI_KEYBIND" emoji::cli
