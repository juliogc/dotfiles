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

