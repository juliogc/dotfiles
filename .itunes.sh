#!/bin/sh
#
####################################
# iTunes Command Line Control v1.0
# adapted by Júlio Corradi
# created 2001.11.08
# thanks to David Schlosnagle
####################################

function iTunes () {
    if [[ $1 ]]; then
        opt=$1;
    else
        showHelp;
        read opt;
    fi

    case $opt in
        "status" ) state=`osascript -e 'tell application "iTunes" to player state as string'`;
            echo "iTunes is currently $state.";
            if [ $state = "playing" ]; then
                currentsong;
            fi
        ;;

        "play"    ) echo "Playing iTunes.";
            osascript -e 'tell application "iTunes" to play';
            currentsong;
        ;;

        "pause"    ) echo "Pausing iTunes.";
            osascript -e 'tell application "iTunes" to pause';
            currentsong;
        ;;

        "next"    ) echo "Going to next track." ;
            osascript -e 'tell application "iTunes" to next track';
            currentsong;
        ;;

        "prev"    ) echo "Going to previous track.";
            osascript -e 'tell application "iTunes" to previous track';
            currentsong;
        ;;

        "mute"    ) echo "Muting iTunes volume level.";
            osascript -e 'tell application "iTunes" to set mute to true';
        ;;

        "unmute" ) echo "Unmuting iTunes volume level.";
            osascript -e 'tell application "iTunes" to set mute to false';
        ;;

        "vol"    ) echo "Changing iTunes volume level.";
            vol=`osascript -e 'tell application "iTunes" to sound volume as integer'`;
            if [ $2 = "up" ]; then
                newvol=$(( vol+10 ));
            fi

            if [ $2 = "down" ]; then
                newvol=$(( vol-10 ));
            fi

            if [ $2 -gt 0 ]; then
                newvol=$2;
            fi
            osascript -e "tell application \"iTunes\" to set sound volume to $newvol";
        ;;

        "stop"    ) echo "Stopping iTunes.";
            osascript -e 'tell application "iTunes" to stop';
        ;;
            
        "exit"    ) echo "Exiting iTunes.";
            osascript -e 'tell application "iTunes" to exit';
            exit 1 ;;

        "help" | * ) echo "help:";
            showHelp;
        ;;
    esac
}

showHelp () {
    printf "${Red}$DIVIDER${NC}\n";
    printf "[${Gre}iTunes${NC}] ${Whi}Command Line Interface${NC}\n";
    printf "${Red}$DIVIDER${NC}\n";
    echo;
    echo "status   = Shows iTunes' status, current artist and track.";
    echo "play     = Start playing iTunes.";
    echo "pause    = Pause iTunes.";
    echo "next     = Go to the next track.";
    echo "prev     = Go to the previous track.";
    echo "mute     = Mute iTunes' volume.";
    echo "unmute   = Unmute iTunes' volume.";
    echo "vol up   = Increase iTunes' volume by 10%";
    echo "vol down = Increase iTunes' volume by 10%";
    echo "vol #    = Set iTunes' volume to # [0-100]";
    echo "stop     = Stop iTunes.";
    echo "exit     = Exit iTunes.";
}

currentsong () {
    artist=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
    track=`osascript -e 'tell application "iTunes" to name of current track as string'`;
    echo "$artist:  $track";
}