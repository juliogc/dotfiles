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
# IMPORTS
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source "$HOME/.nvm/nvm.sh"
source "$HOME/.itunes.sh"

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
Bla='\e[0;30m';   BBla='\e[1;30m';   UBla='\e[4;30m';   IBla='\e[0;90m';   BIBla='\e[1;90m';   On_Bla='\e[40m';   On_IBla='\e[0;100m';
Red='\e[0;31m';   BRed='\e[1;31m';   URed='\e[4;31m';   IRed='\e[0;91m';   BIRed='\e[1;91m';   On_Red='\e[41m';   On_IRed='\e[0;101m';
Gre='\e[0;32m';   BGre='\e[1;32m';   UGre='\e[4;32m';   IGre='\e[0;92m';   BIGre='\e[1;92m';   On_Gre='\e[42m';   On_IGre='\e[0;102m';
Yel='\e[0;33m';   BYel='\e[1;33m';   UYel='\e[4;33m';   IYel='\e[0;93m';   BIYel='\e[1;93m';   On_Yel='\e[43m';   On_IYel='\e[0;103m';
Blu='\e[0;34m';   BBlu='\e[1;34m';   UBlu='\e[4;34m';   IBlu='\e[0;94m';   BIBlu='\e[1;94m';   On_Blu='\e[44m';   On_IBlu='\e[0;104m';
Pur='\e[0;35m';   BPur='\e[1;35m';   UPur='\e[4;35m';   IPur='\e[0;95m';   BIPur='\e[1;95m';   On_Pur='\e[45m';   On_IPur='\e[0;105m';
Cya='\e[0;36m';   BCya='\e[1;36m';   UCya='\e[4;36m';   ICya='\e[0;96m';   BICya='\e[1;96m';   On_Cya='\e[46m';   On_ICya='\e[0;106m';
Whi='\e[0;37m';   BWhi='\e[1;37m';   UWhi='\e[4;37m';   IWhi='\e[0;97m';   BIWhi='\e[1;97m';   On_Whi='\e[47m';   On_IWhi='\e[0;107m';

# No Color
NC='\e[0m'

function __show_colors () {
    printf " Regular  Bold  Underline  High Intensity  BoldHigh Intens..  Background  High Intensity Bgs \n\n";
    printf " ${Bla}Bla      ${BBla}BBla  ${UBla}UBla${NC}       ${IBla}IBla${NC}            ${BIBla}BIBla${NC}              ${On_Bla}On_Bla${NC}      ${On_IBla}On_IBla${NC} \n";
    printf " ${Red}Red      ${BRed}BRed  ${URed}URed${NC}       ${IRed}IRed${NC}            ${BIRed}BIRed${NC}              ${On_Red}On_Red${NC}      ${On_IRed}On_IRed${NC} \n";
    printf " ${Gre}Gre      ${BGre}BGre  ${UGre}UGre${NC}       ${IGre}IGre${NC}            ${BIGre}BIGre${NC}              ${On_Gre}On_Gre${NC}      ${On_IGre}On_IGre${NC} \n";
    printf " ${Yel}Yel      ${BYel}BYel  ${UYel}UYel${NC}       ${IYel}IYel${NC}            ${BIYel}BIYel${NC}              ${On_Yel}On_Yel${NC}      ${On_IYel}On_IYel${NC} \n";
    printf " ${Blu}Blu      ${BBlu}BBlu  ${UBlu}UBlu${NC}       ${IBlu}IBlu${NC}            ${BIBlu}BIBlu${NC}              ${On_Blu}On_Blu${NC}      ${On_IBlu}On_IBlu${NC} \n";
    printf " ${Pur}Pur      ${BPur}BPur  ${UPur}UPur${NC}       ${IPur}IPur${NC}            ${BIPur}BIPur${NC}              ${On_Pur}On_Pur${NC}      ${On_IPur}On_IPur${NC} \n";
    printf " ${Cya}Cya      ${BCya}BCya  ${UCya}UCya${NC}       ${ICya}ICya${NC}            ${BICya}BICya${NC}              ${On_Cya}On_Cya${NC}      ${On_ICya}On_ICya${NC} \n";
    printf " ${Whi}Whi      ${BWhi}BWhi  ${UWhi}UWhi${NC}       ${IWhi}IWhi${NC}            ${BIWhi}BIWhi${NC}              ${On_Whi}On_Whi${NC}      ${On_IWhi}On_IWhi${NC} \n";
}

# HELP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bold White on red background
ALERT=${BWhi}${On_Red};

# Delimiter line
DIVIDER=`printf %81s |tr " " "="`;

# Number of CPUs
NCPU=$(sysctl hw.ncpu | awk '{print $2}');

# Small load
SLOAD=$(( 100*${NCPU} ));

# Medium load
MLOAD=$(( 200*${NCPU} ));

# Xlarge load
XLOAD=$(( 400*${NCPU} ));

# Test user type:
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [[ ${USER} == "root" ]]; then
    SU=${Red};  # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${BRed}; # User is not login user.
else
    SU=${BCya}; # User is normal (well ... most of us are).
fi

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
alias cls='clear';
alias mkdir='mkdir -p';
alias grep='grep -n';
alias ll='ls -Ghpla';
alias df='df -kTh';
alias du='du -kh';
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
alias o.='o .';
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
alias ios='open -a iOS\ Simulator';

# Other applications
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adobe
alias photoshop='open -a Adobe\ Photoshop';
alias illustrator='open -a Adobe\ Illustrator';

# Editors
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl';
alias subl=sublime;

# Browsers
# alias firefox='open -a Firefox';
alias chrome='open -a Google\ Chrome';

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
alias emptytrash="rm -rf /Users/$USER/.Trash/*";
alias cleanupds="sudo find . -type f -name '*.DS_Store' -ls -delete"
alias gitconfig='subl $HOME/.gitconfig';
alias reload='source ~/.bash_profile && clear';
alias bashrc='subl $HOME/.bashrc';
alias httpdvhosts='subl /private/etc/apache2/extra/httpd-vhosts.conf';
alias vhosts='cd /private/etc/apache2/vhosts/';
alias httpdconf='subl /etc/apache2/httpd.conf';
alias httpdconfig=httpdconf;
alias hosts='subl /etc/hosts';
alias bash_profile='subl $HOME/.bash_profile';
alias profile=bash_profile;

# Work
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias www="cd $WORKSPACE";

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# UTILS
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Google Drive
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function drive () {
    CUR_DIR=$(pwd);
    MONTH_PATH=$(__cur_month);
    YEAR_PATH=$(__cur_year);
    cd "/Users/$USER/Google Drive/Empresa/Financeiro/$YEAR_PATH/$MONTH_PATH/Planilha de horas";
    open .;
    cd "$CUR_DIR";
}

# Timesheet
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function __time_sheet () {
    MONTH_PATH=$(__cur_month);
    MONTH_EXTEND=$(__cur_month_extend);
    YEAR_PATH=$(__cur_year);
    open "/Users/$USER/Google Drive/Empresa/Financeiro/$YEAR_PATH/$MONTH_PATH/Planilha de horas/julio-corradi_planilha-horas-extra_$MONTH_EXTEND-$YEAR_PATH.xls";
}
alias timesheet=__time_sheet;

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

function __cur_month_extend () {
    CUR_MONTH="$(date +'%m')";

    case $CUR_MONTH in
        01 ) MONTH_PATH="janeiro"
            ;;
        02 ) MONTH_PATH="fevereiro"
            ;;
        03 ) MONTH_PATH="março"
            ;;
        04 ) MONTH_PATH="abril"
            ;;
        05 ) MONTH_PATH="maio"
            ;;
        06 ) MONTH_PATH="junho"
            ;;
        07 ) MONTH_PATH="julho"
            ;;
        08 ) MONTH_PATH="agosto"
            ;;
        09 ) MONTH_PATH="setembro"
            ;;
        10 ) MONTH_PATH="outubro"
            ;;
        11 ) MONTH_PATH="novembro"
            ;;
        12 ) MONTH_PATH="dezembro"
            ;;
    esac

    echo "$MONTH_PATH";
}

# Transfer
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function __transfer () {
    tmpfile=$( mktemp -t transferXXX );
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}
alias transfer=__transfer

# Tweet
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function tweet {
    MESSAGE="$1";
    printf "${Gre}Running${NC} t update ${Red}$MESSAGE${NC} \n";
    t update "$MESSAGE";
}

# Compress files
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function z () {
    zip -r "$1".zip "$1"/ -x "*.DS_Store";
}

# Count items
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function count_items () {
    FILES=`ls ./ | grep -v ^l | wc -l | awk '{print $1}'`;
    printf "[${Gre}INFO${NC}] This directory has $FILES items.${NC}\n";
}

# Uncompress files
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function extract () {
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

# Set git autocompletion and PS1 integration
# curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f /Users/$USER/.git-completion.bash ]; then
    . /Users/$USER/.git-completion.bash;
fi

# show git status on PS1
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export GIT_PS1_SHOWUPSTREAM=auto;
export GIT_PS1_SHOWDIRTYSTATE=true;
export GIT_PS1_SHOWSTASHSTATE=true;
export GIT_PS1_SHOWTRACKEDFILES=true;

# GITK
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias gitk='/Users/$USER/gitk';

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
# PS1=''"${Cya}$USER${NS}"' '"${Gre}@ \w${NC}"' $(__git_ps1 "(${Yel}%s${NC}${Red}${NC}) ") \n\$ '
PS1='┌─ [ '"${Cya}$USER${NS}"' '"${BWhi}@ ${NC}"''"${Cya}\h${NC}"' ] '"${Gre}\w${NC}"' $(__git_ps1 "(${Yel}%s${NC}${Red}${NC}) ") \n└─• ';

# Grep e ls color
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

# Application exports
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# export PATH="/usr/local/ffmpeg/bin:$PATH";
# export PATH="/usr/local/phantomjs/bin:$PATH";
# export PATH="/usr/local/mysql/bin:$PATH";
# export JAVA_HOME=$(/usr/libexec/java_home);
# export M2_HOME="/usr/local/maven";
# export M2=$M2_HOME/bin;
# export PATH="/usr/local/heroku/bin:/usr/local/mongodb/bin:$M2:$PATH";

# Load rvm
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# PROCESS/SYSTEM RELATED FUNCTIONS:
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Get current host related info.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function ii() {
    printf "You are logged on ${BRed}$HOST\n"
    printf "\n${BRed}Additionnal information:\n$NC"; uname -a
    printf "\n${BRed}Diskspace:\n$NC" ; df2 / $HOME
    printf "\n${BRed}Current date:\n$NC"; date
    printf "\n${BRed}Machine stats:\n$NC" ; uptime
    printf "\n${BRed}Memory stats:\n$NC" ; free
    printf "\n${BRed}Local IP Address:\n$NC" ; ip
    printf "\n${BRed}Lan IP Address:\n$NC" ; iplocal
    printf "\n${BRed}Users logged on:\n$NC"; w -hs | cut -d " " -f1 | sort | uniq
    printf "\n${BRed}Open connections:\n$NC"; netstat -pan --inet;
}
