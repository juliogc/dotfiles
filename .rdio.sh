#!/bin/sh
#
# ################################ #
# Rdio Command Line Control v1.0
# created by Júlio Corradi
# created in 2014.10.23
# ################################ #
# Now I'm using Twitter CLI to
# share current track
# https://github.com/sferik/t
# Don't worry, if you dont want to
# add this CLI it won't will break
# your terminal ;)
# ################################ #

function Rdio () {
    if [[ $1 ]]; then
        opt=$1;
    else
        __rdio_showHelp;
        read opt;
    fi

    case $opt in
        "open" ) echo "Opening Rdio.";
            open -a Rdio;
        ;;

        "status" ) state=`osascript -e 'tell application "Rdio" to player state as string'`;
            echo "Rdio is currently $state.";
            if [ $state = "playing" ]; then
                __rdio_currentsong;
            fi
        ;;

        "play" ) echo "Playing Rdio.";
            osascript -e 'tell application "Rdio" to play';
            __rdio_currentsong;
        ;;

        "pause" ) echo "Pausing Rdio.";
            osascript -e 'tell application "Rdio" to pause';
            __rdio_currentsong;
        ;;

        "next" ) echo "Going to next track." ;
            osascript -e 'tell application "Rdio" to next track';
            __rdio_currentsong;
        ;;

        "prev" ) echo "Going to previous track.";
            osascript -e 'tell application "Rdio" to previous track';
            __rdio_currentsong;
        ;;

        "mute" ) echo "Muting Rdio volume level.";
            osascript -e 'tell application "Rdio" to set mute to true';
        ;;

        "unmute" ) echo "Unmuting Rdio volume level.";
            osascript -e 'tell application "Rdio" to set mute to false';
        ;;

        "vol" ) echo "Changing Rdio volume level.";
            vol=`osascript -e 'tell application "Rdio" to sound volume as integer'`;
            if [ $2 = "up" ]; then
                newvol=$(( vol+10 ));
            fi

            if [ $2 = "down" ]; then
                newvol=$(( vol-10 ));
            fi

            if [ $2 -gt 0 ]; then
                newvol=$2;
            fi
            osascript -e "tell application \"Rdio\" to set sound volume to $newvol";
        ;;

        "share" ) state=`osascript -e 'tell application "Rdio" to player state as string'`;
            if [ $state = "playing" ]; then
                if [[ -z "$t" ]]; then
                    artist=`osascript -e 'tell application "Rdio" to artist of current track as string'`;
                    track=`osascript -e 'tell application "Rdio" to name of current track as string'`;
                    currenttrack="$artist - $track";

                    t update "♫ #NowPlaying $currenttrack";
                fi
            fi
        ;;

        "stop" ) echo "Stopping Rdio.";
            osascript -e 'tell application "Rdio" to stop';
        ;;

        "quit" ) echo "Exiting Rdio.";
            killall Rdio;
        ;;

        "help" | * ) echo "help:";
            __rdio_showHelp;
        ;;
    esac
}

__rdio_showHelp () {
    printf "${Red}$DIVIDER${NC}\n";
    printf "[${Gre}Rdio${NC}] ${Whi}Command Line Interface${NC}\n";
    printf "${Red}$DIVIDER${NC}\n";
    echo;
    echo "status   = Shows Rdio' status, current artist and track.";
    echo "open     = Opens Rdio.";
    echo "play     = Start playing Rdio.";
    echo "pause    = Pause Rdio.";
    echo "next     = Go to the next track.";
    echo "prev     = Go to the previous track.";
    echo "mute     = Mute Rdio' volume.";
    echo "unmute   = Unmute Rdio' volume.";
    echo "vol up   = Increase Rdio' volume by 10%";
    echo "vol down = Increase Rdio' volume by 10%";
    echo "vol #    = Set Rdio' volume to # [0-100]";
    echo "share    = Share Rdio.";
    echo "stop     = Stop Rdio.";
    echo "quit     = Quit Rdio.";
}

__rdio_currentsong () {
    artist=`osascript -e 'tell application "Rdio" to artist of current track as string'`;
    track=`osascript -e 'tell application "Rdio" to name of current track as string'`;
    echo `printf "♫ ${Gre}$artist${NC} - ${Blu}$track ${NC}"`;
}

# Shorthand controls alias
# ######################## #
alias rdio="Rdio";
alias rdio.open="Rdio open";
alias rdio.status="Rdio status";
alias rdio.play="Rdio play";
alias rdio.pause="Rdio pause";
alias rdio.next="Rdio next";
alias rdio.prev="Rdio prev";
alias rdio.mute="Rdio mute";
alias rdio.mute="Rdio mute";
alias rdio.unmute="Rdio unmute";
alias rdio.stop="Rdio stop";
alias rdio.volup="Rdio vol up";
alias rdio.voldown="Rdio vol down";
alias rdio.setvol="Rdio vol $1";
alias rdio.sharetrack="Rdio share";
alias rdio.stop="Rdio stop";
alias rdio.quit="Rdio quit";