#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# HELP
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# @see http://explainshell.com/explain/
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Define how Bash prompt looks like:
# @see http://effectif.com/git/config
WORKSPACE=$HOME/Sites;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# AID
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# See the current branch in your prompt
# download the file, rename to .git-prompt.sh and "chmod +x" it
# curl -OL https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This makes sub sourcing work, so can move large chunks to their own file.
source "$HOME/.git-prompt.sh"
source "$HOME/.nvm/nvm.sh"
source "$HOME/.itunes.sh"

# Set git autocompletion and PS1 integration
# curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    . /usr/local/git/contrib/completion/git-completion.bash;
fi

# If not running interactively, don't do anything
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -z "$PS1" ] && return

# Don't want coredumps.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ulimit -S -c 0
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -o notify
set -o noclobber
set -o ignoreeof

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# HUMANIZE
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Regular         Bold               Underline          High Intensity     BoldHigh Intens..   Background         High Intensity Bgs
Yel='\e[0;33m';   BYel='\e[1;33m';   UYel='\e[4;33m';   IYel='\e[0;93m';   BIYel='\e[1;93m';   On_Yel='\e[43m';   On_IYel='\e[0;103m';
Pur='\e[0;35m';   BPur='\e[1;35m';   UPur='\e[4;35m';   IPur='\e[0;95m';   BIPur='\e[1;95m';   On_Pur='\e[45m';   On_IPur='\e[0;105m';
Bla='\e[0;30m';   BBla='\e[1;30m';   UBla='\e[4;30m';   IBla='\e[0;90m';   BIBla='\e[1;90m';   On_Bla='\e[40m';   On_IBla='\e[0;100m';
Gre='\e[0;32m';   BGre='\e[1;32m';   UGre='\e[4;32m';   IGre='\e[0;92m';   BIGre='\e[1;92m';   On_Gre='\e[42m';   On_IGre='\e[0;102m';
Whi='\e[0;37m';   BWhi='\e[1;37m';   UWhi='\e[4;37m';   IWhi='\e[0;97m';   BIWhi='\e[1;97m';   On_Whi='\e[47m';   On_IWhi='\e[0;107m';
Blu='\e[0;34m';   BBlu='\e[1;34m';   UBlu='\e[4;34m';   IBlu='\e[0;94m';   BIBlu='\e[1;94m';   On_Blu='\e[44m';   On_IBlu='\e[0;104m';
Cya='\e[0;36m';   BCya='\e[1;36m';   UCya='\e[4;36m';   ICya='\e[0;96m';   BICya='\e[1;96m';   On_Cya='\e[46m';   On_ICya='\e[0;106m';
Red='\e[0;31m';   BRed='\e[1;31m';   URed='\e[4;31m';   IRed='\e[0;91m';   BIRed='\e[1;91m';   On_Red='\e[41m';   On_IRed='\e[0;101m';

function __show_colors {
    printf "${Yel}Yel${NC}\n";
    printf "${Pur}Pur${NC}\n";
    printf "${Bla}Bla${NC}\n";
    printf "${Gre}Gre${NC}\n";
    printf "${Whi}Whi${NC}\n";
    printf "${Blu}Blu${NC}\n";
    printf "${Cya}Cya${NC}\n";
    printf "${Red}Red${NC}\n";
}

# No Color
NC='\e[0m'

# HELP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bold White on red background
ALERT=${BWhi}${On_Red};

# Delimiter line
DIVIDER=`printf %81s |tr " " "="`;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# ALIASES
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Native navigation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ..='cd ..';
alias ...='cd ../../';
alias ....='cd ../../../';
alias .....='cd ../../../../';
alias ......='cd ../../../../../';
alias .......='cd ../../../../../../';
alias ........='cd ../../../../../../../';
alias .........='cd ../../../../../../../../';
alias ..........='cd ../../../../../../../../../';
alias ...........='cd ../../../../../../../../../../';
alias ............='cd ../../../../../../../../../../../';
alias .............='cd ../../../../../../../../../../../../';
alias ..............='cd ../../../../../../../../../../../../../';
alias ...............='cd ../../../../../../../../../../../../../../';
alias ................='cd ../../../../../../../../../../../../../../../';
alias .................='cd ../../../../../../../../../../../../../../../../';
alias ..................='cd ../../../../../../../../../../../../../../../../../';
alias ...................='cd ../../../../../../../../../../../../../../../../../../';
alias ....................='cd ../../../../../../../../../../../../../../../../../../../';
alias .....................='cd ../../../../../../../../../../../../../../../../../../../../';
alias apps='cd /Applications';
alias desk='cd $HOME/Desktop';
alias docs='cd $HOME/Documents';
alias pics='cd $HOME/Pictures';
alias movs='cd $HOME/Movies';
alias musics='cd $HOME/Music';
alias downloads='cd $HOME/Downloads';
alias projects='cd $HOME/Projetos';

# Overrides
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ls='ls -Ghpla';
alias rm='rm -i';
alias cp='cp -i';
alias mv='mv -i';
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc';

# Network
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias iplocal="echo `ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1' | sed "1 d"`";
alias ip='dig +short myip.opendns.com @resolver1.opendns.com';

# Help
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias h='history';
alias c='clear';
alias o='open';
alias x='echo "Bye!"; exit;';
alias quit=x;
alias q=x;

# Native applications
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias allfiles='open /System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch';
alias activity='open -a Activity\ Monitor';
alias airport='open -a AirPort\ Utility';
alias quicktime='open -a QuickTime\ Player';
alias applescript='open -a AppleScript\ Editor';
alias systempreferences='open -a System\ Preferences';
alias safari='open -a Safari';
alias textedit='open -a TextEdit';
alias preview='open -a Preview';
alias terminal='open -a Terminal';
alias iterm='open -a iTerm';
alias stickies='open -a Stickies';
alias timemachine='open -a Time\ Machine';
alias itunes='open -a iTunes';
alias contacts='open -a Contacts';
alias facetime='open -a FaceTime';
alias calculator='open -a Calculator';
alias calendar='open -a Calendar';
alias dictionary='open -a Dictionary';
alias fontbook='open -a Font\ Book';
alias photobooth='open -a Photo\ Booth';
alias notes='open -a Notes';
alias reminders='open -a Reminders';
alias appstore='open -a App\ Store';
alias dashboard='open -a Dashboard';
alias messages='open -a Messages';
alias missioncontrol='open -a Mission\ Control';
alias launchpad='open -a Launchpad';
alias chess='open -a Chess';
alias xcode='open -a Xcode';
alias iphone='open -a iPhone\ Simulator';

# Other applications
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adobe
alias photoshop='open -a Adobe\ Photoshop\ CS6';

# Editors
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl';
alias subl=sublime;

# Browsers
alias firefox='open -a Firefox';
alias canary='open -a Google\ Chrome\ Canary';
alias chrome='open -a Google\ Chrome';
alias opera='open -a Opera';

# Others
alias pomodoro='open -a focus\ booster';
alias virtualbox='open -a VirtualBox';
alias skype='open -a Skype';

# Native commands
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias terminaltakefocusonclick='defaults write com.apple.terminal FocusFollowsMouse -string NO && killall Dock';
alias terminaltakefocusonover='defaults write com.apple.terminal FocusFollowsMouse -string YES && killall Dock';
alias includedebugmenuonsafari='defaults write com.apple.safari IncludeDebugMenu -bool YES && killall Dock';
alias disablecrashreporter='defaults write com.apple.CrashReporter DialogType none && killall Dock';
alias enablecrashreporter='defaults write com.apple.CrashReporter DialogType prompt && killall Dock';
alias hidedesktopicons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder';
alias showdesktopicons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder';
alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Dock';
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Dock';
alias dashboardoff='defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock';
alias dashboardon='defaults write com.apple.dashboard mcx-disabled -boolean NO && killall Dock';
alias devmodeoff='defaults write com.apple.dashboard devmode NO && killall Dock';
alias devmodeon='defaults write com.apple.dashboard devmode YES && killall Dock';

# Extras
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias reload='source ~/.bash_profile && clear';
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias gitconfig='subl $HOME/.gitconfig';
alias bashrc='subl $HOME/.bashrc';
alias httpdvhosts='subl /private/etc/apache2/extra/httpd-vhosts.conf';
alias vhosts=httpdvhosts;
alias httpdconf='subl /etc/apache2/httpd.conf';
alias httpdconfig=httpdconf;
alias bash_profile='subl $HOME/.bash_profile';
alias profile=bash_profile;ls


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# UTILS
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Dates
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function __cur_year () {
    CUR_YEAR="$(date +'%Y')";
    echo "$CUR_YEAR";
}

function __cur_month () {
    CUR_MONTH="$(date +'%m')";

    case $CUR_MONTH in
        01 ) MONTH_PATH="$CUR_MONTH janeiro"
            ;;
        02 ) MONTH_PATH="$CUR_MONTH fevereiro"
            ;;
        03 ) MONTH_PATH="$CUR_MONTH março"
            ;;
        04 ) MONTH_PATH="$CUR_MONTH abril"
            ;;
        05 ) MONTH_PATH="$CUR_MONTH maio"
            ;;
        06 ) MONTH_PATH="$CUR_MONTH junho"
            ;;
        07 ) MONTH_PATH="$CUR_MONTH julho"
            ;;
        08 ) MONTH_PATH="$CUR_MONTH agosto"
            ;;
        09 ) MONTH_PATH="$CUR_MONTH setembro"
            ;;
        10 ) MONTH_PATH="$CUR_MONTH outubro"
            ;;
        11 ) MONTH_PATH="$CUR_MONTH novembro"
            ;;
        12 ) MONTH_PATH="$CUR_MONTH dezembro"
            ;;
    esac

    echo "$MONTH_PATH";
}

# Uncompress files
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tar)     tar xvf $1    ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.gz)      gunzip $1     ;;
            *.7z)      7z x $1       ;;
            *.Z)       uncompress $1 ;;
            *)         echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!";
    fi
}

# Show the project tree
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function tree() {
   find ${1:-.} -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g';
}

# Attempts to create and navigate to directory specified by pathname.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function mkd() {
    mkdir -p "$@" && cd "$_";
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# GIT
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Status
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function __git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*";
}

# Details
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function __git_state() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(__git_dirty)]/";
}

# Branch
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function __git_branch() {
    git rev-parse --abbrev-ref HEAD;
}

# show git status on PS1
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export GIT_PS1_SHOWUPSTREAM=auto;
export GIT_PS1_SHOWDIRTYSTATE=true;
export GIT_PS1_SHOWSTASHSTATE=true;
export GIT_PS1_SHOWTRACKEDFILES=true;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# OTHER THINGS
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DIR autocomplete and case insensitive
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bind 'set completion-ignore-case on'

# PS1 colored with username, machine name, count, timestamp, branch name and git status
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PS1='$(__git_ps1 "[${Yel}%s${NC}${Red}${NC}] ")'"${Cya}\w${NC}"' \n\$ '
PS1=''"${Cya}$USERNAME${NS}"' '"${Gre}@ \w${NC}"' $(__git_ps1 "(${Red}%s${NC}${Red}${NC}) ") \n\$ '

# Grep e ls color
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

# Open directory with Sublime Text
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export EDITOR='subl -w'
export GIT_EDITOR='vim'

# Load rvm
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
