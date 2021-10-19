#!/bin/sh
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Spotify Command Line Control v1.0
#  created by Júlio Corradi - 2016.08.08
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  COLORS
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Regular Colors
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Bla='\e[0;30m'; 
Red='\e[0;31m';
Gre='\e[0;32m';
Yel='\e[0;33m';
Blu='\e[0;34m';
Pur='\e[0;35m';
Cya='\e[0;36m';
Whi='\e[0;37m';

# No Color
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NC='\e[0m'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Spotify
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function Spotify () {
    if [[ $1 ]]; then
        opt=$1;
    else
        __spotify_showHelp;
        read opt;
    fi

    case $opt in
        "open" ) echo "Opening Spotify.";
            open -a Spotify;
        ;;

        "status" ) state=`osascript -e 'tell application "Spotify" to player state as string'`;
            echo "Spotify is currently $state.";
            if [ $state = "playing" ]; then
                __spotify_currentsong;
            fi
        ;;

        "play" ) echo "Playing Spotify.";
            osascript -e 'tell application "Spotify" to play';
            __spotify_currentsong;
        ;;

        "pause" ) echo "Pausing Spotify.";
            osascript -e 'tell application "Spotify" to pause';
            __spotify_currentsong;
        ;;

        "next" ) echo "Going to next track." ;
            osascript -e 'tell application "Spotify" to next track';
            __spotify_currentsong;
        ;;

        "prev" ) echo "Going to previous track.";
            osascript -e 'tell application "Spotify" to previous track';
            __spotify_currentsong;
        ;;

        "mute" ) echo "Muting Spotify volume level.";
            osascript -e 'tell application "Spotify" to set mute to true';
        ;;

        "unmute" ) echo "Unmuting Spotify volume level.";
            osascript -e 'tell application "Spotify" to set mute to false';
        ;;

        "vol" ) echo "Changing Spotify volume level.";
            vol=`osascript -e 'tell application "Spotify" to sound volume as integer'`;
            if [[ $2 = "up" ]]; then
                newvol=$(( vol+10 ));
            fi

            if [[ $2 = "down" ]]; then
                newvol=$(( vol-10 ));
            fi

            if [[ $2 -gt 0 ]]; then
                newvol=$2;
            fi
            osascript -e "tell application \"Spotify\" to set sound volume to $newvol";
        ;;

        "share" ) state=`osascript -e 'tell application "Spotify" to player state as string'`;
            if [ $state = "playing" ]; then
                if [[ -z "$t" ]]; then
                    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
                    track=`osascript -e 'tell application "Spotify" to name of current track as string'`;
                    currenttrack="$artist - $track";

                    t update "♫ #NowPlaying $currenttrack";
                fi
            fi
        ;;

        "stop" ) echo "Stopping Spotify.";
            osascript -e 'tell application "Spotify" to stop';
        ;;

        "quit" ) echo "Exiting Spotify.";
            killall Spotify;
        ;;

        "help" | * ) echo "help:";
            __spotify_showHelp;
        ;;
    esac
}

__spotify_showHelp () {
    printf "${Red}$DIVIDER${NC}\n";
    printf "[${Gre}Spotify${NC}] ${Whi}Command Line Interface${NC}\n";
    printf "${Red}$DIVIDER${NC}\n";
    echo;
    echo "status   = Shows Spotify' status, current artist and track.";
    echo "open     = Opens Spotify.";
    echo "play     = Start playing Spotify.";
    echo "pause    = Pause Spotify.";
    echo "next     = Go to the next track.";
    echo "prev     = Go to the previous track.";
    echo "mute     = Mute Spotify' volume.";
    echo "unmute   = Unmute Spotify' volume.";
    echo "vol up   = Increase Spotify' volume by 10%";
    echo "vol down = Increase Spotify' volume by 10%";
    echo "vol #    = Set Spotify' volume to # [0-100]";
    echo "share    = Share Spotify.";
    echo "stop     = Stop Spotify.";
    echo "quit     = Quit Spotify.";
}

__spotify_currentsong () {
    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
    track=`osascript -e 'tell application "Spotify" to name of current track as string'`;
    echo `printf "♫ ${Gre}$artist${NC} - ${Blu}$track ${NC}"`;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  Shorthand control aliases
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias spotify="Spotify";
alias spotify.open="Spotify open";
alias spotify.status="Spotify status";
alias spotify.play="Spotify play";
alias spotify.pause="Spotify pause";
alias spotify.next="Spotify next";
alias spotify.prev="Spotify prev";
alias spotify.mute="Spotify mute";
alias spotify.mute="Spotify mute";
alias spotify.unmute="Spotify unmute";
alias spotify.stop="Spotify stop";
alias spotify.volup="Spotify vol up";
alias spotify.voldown="Spotify vol down";
alias spotify.setvol="Spotify vol $1";
alias spotify.sharetrack="Spotify share";
alias spotify.stop="Spotify stop";
alias spotify.quit="Spotify quit";
