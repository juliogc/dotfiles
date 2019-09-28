#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# ~/.zshrc
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Exports
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export ZPLUG_DIR="$HOME/.zplug"
export ZSH="$ZPLUG_DIR/repos/robbyrussell/oh-my-zsh"
export ZSH_CACHE_DIR="$ZSH/cache"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Imports
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# zplug
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -s "$ZPLUG_DIR/init.zsh" ] && \. "$ZPLUG_DIR/init.zsh"


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Zplug Settings
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Import plugins
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "asdf-vm/asdf", from:github, use:"asdf.sh"
zplug "asdf-vm/asdf", from:github, use:"completions/asdf.bash", defer:1
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli", from:github, use:emoji-cli.plugin.zsh
zplug "denysdovhan/spaceship-prompt", from:github, use:spaceship.zsh, as:theme
zplug "juliogc/dotfiles", from:github, use:".zsh/*.zsh", defer:1
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "mrowa44/emojify", from:github, as:command, rename-to:emojify
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "zsh-users/zsh-autosuggestions", from:github, use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-completions"
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
autoload -U compinit && compinit

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Keybindings
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bindkey \^U backward-kill-line

