# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   COLORS
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

#  HELP
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Bold White on red background
ALERT=${BWhi}${On_Red};

#  Show available colors
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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