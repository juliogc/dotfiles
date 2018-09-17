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

# If not running interactively, don't do anything
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[ -z "$PS1" ] && return


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# AID
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Enable autocomplete when using sudo prefix
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
complete -cf sudo

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
    printf ""%134s"\n" | tr " " "-";
    printf "|  Color  |  Regular  |  Bold  |  Underline  |  High Intensity  |  Bold High Intensity  |  Background  |  High Intensity Background  |\n";
    printf ""%134s"\n" | tr " " "-";
    printf "  Black     ${Bla}Bla         ${BBla}BBla     ${UBla}UBla${NC}          ${IBla}IBla${NC}               ${BIBla}BIBla${NC}                    ${On_Bla}On_Bla${NC}         ${On_IBla}On_IBla${NC} \n";
    printf "    Red     ${Red}Red         ${BRed}BRed     ${URed}URed${NC}          ${IRed}IRed${NC}               ${BIRed}BIRed${NC}                    ${On_Red}On_Red${NC}         ${On_IRed}On_IRed${NC} \n";
    printf "  Green     ${Gre}Gre         ${BGre}BGre     ${UGre}UGre${NC}          ${IGre}IGre${NC}               ${BIGre}BIGre${NC}                    ${On_Gre}On_Gre${NC}         ${On_IGre}On_IGre${NC} \n";
    printf " Yellow     ${Yel}Yel         ${BYel}BYel     ${UYel}UYel${NC}          ${IYel}IYel${NC}               ${BIYel}BIYel${NC}                    ${On_Yel}On_Yel${NC}         ${On_IYel}On_IYel${NC} \n";
    printf "   Blue     ${Blu}Blu         ${BBlu}BBlu     ${UBlu}UBlu${NC}          ${IBlu}IBlu${NC}               ${BIBlu}BIBlu${NC}                    ${On_Blu}On_Blu${NC}         ${On_IBlu}On_IBlu${NC} \n";
    printf " Purple     ${Pur}Pur         ${BPur}BPur     ${UPur}UPur${NC}          ${IPur}IPur${NC}               ${BIPur}BIPur${NC}                    ${On_Pur}On_Pur${NC}         ${On_IPur}On_IPur${NC} \n";
    printf "   Cyan     ${Cya}Cya         ${BCya}BCya     ${UCya}UCya${NC}          ${ICya}ICya${NC}               ${BICya}BICya${NC}                    ${On_Cya}On_Cya${NC}         ${On_ICya}On_ICya${NC} \n";
    printf "  White     ${Whi}Whi         ${BWhi}BWhi     ${UWhi}UWhi${NC}          ${IWhi}IWhi${NC}               ${BIWhi}BIWhi${NC}                    ${On_Whi}On_Whi${NC}         ${On_IWhi}On_IWhi${NC} \n";
}

# HELP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bold White on red background
ALERT=${BWhi}${On_Red};

# Delimiter line
DIVIDER=`printf %81s |tr " " "="`;


# Test user type:
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [[ ${USER} == "root" ]]; then
    SU=${Red};  # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${BRed}; # User is not login user.
else
    SU=${BCya}; # User is normal (well ... most of us are).
fi;


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
alias desk='cd $HOME/Desktop';
alias docs='cd $HOME/Documents';
alias pics='cd $HOME/Pictures';
alias movs='cd $HOME/Movies';
alias musics='cd $HOME/Music';
alias downloads='cd $HOME/Downloads';

# Overrides
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ll='ls -hpla --group-directories-first';
alias df='df -kTh';
alias du='du -kh';
alias rm='rm -i';
alias cp='cp -i';
alias mv='mv -i';

# Network
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias iplocal="echo `ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1' | sed "1 d"`";
alias ip='dig +short myip.opendns.com @resolver1.opendns.com';

# Editors
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl';
alias subl=sublime;

# Extras
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias cleanupds="sudo find . -type f -name '*.DS_Store' -ls -delete"
alias reload='source ~/.bash_profile && clear';

# Work
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias www="cd $WORKSPACE";


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# UTILS
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Compress files
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function z () {
    zip -r "$1".zip "$1"/ -x "*.DS_Store";
}

# Count files
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function count_files () {
    FILES=`ls ./ | grep -v ^l | wc -l | awk '{print $1}'`;
    printf "[${Gre}INFO${NC}] This directory has $FILES files.${NC}\n";
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
# Set git autocompletion and PS1 integration
# curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f /Users/$USER/.git-completion.bash ]; then
    . /Users/$USER/.git-completion.bash;
fi

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
# PS1=''"${Cya}$USER${NS}"' '"${Gre}@ \w${NC}"' $(__git_ps1 "(${Yel}%s${NC}${Red}${NC}) ") \n\$ '
# PS1='┌─ [ '"${Cya}$USER${NS}"' '"${BWhi}@ ${NC}"''"${Cya}\h${NC}"' ] '"${Gre}\w${NC}"' $(__git_ps1 "(${Yel}%s${NC}${Red}${NC}) ") \n└─• ';
PS1="\`if [ \$? = 0 ]; then printf \${Gre}\(\ノ\^\∇\^\)\${NC}; else echo \[\e[31m\]\(\╯\°\□\°\）\╯\︵ \┻\━\┻\[\e[0m\]; fi;\` ${Cya}\u ${BRed}@ ${Cya}\h ${Gre}\w${Yel}\`__git_ps1\`${NC}\n\$ ";


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
    printf "\n${BRed}Diskspace:\n$NC"; df -h / $HOME
    printf "\n${BRed}Current date:\n$NC"; date
    printf "\n${BRed}Machine stats:\n$NC"; uptime
    printf "\n${BRed}Memory stats:\n$NC"; free
    printf "\n${BRed}Local IP Address:\n$NC"; ip
    printf "\n${BRed}Lan IP Address:\n$NC"; iplocal
    printf "\n${BRed}Users logged on:\n$NC"; whoami
    printf "\n${BRed}Open connections:\n$NC"; netstat -pan --inet;
}
