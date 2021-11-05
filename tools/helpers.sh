DIVIDER=`printf %81s |tr " " "="`;

__display_header() {
  printf "\n${BYel}$DIVIDER\n${NC}"
  printf "${BGre}  $1\n${NC}"
  printf "${BYel}$DIVIDER\n${NC}"
}

__display_message() {
  printf "${Blu}==>${NC}${BWhi} $1\n${NC}";
}

__display_warn() {
  printf "${Blu}==>${NC}${BYel} $1\n${NC}";
}