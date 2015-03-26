#!/bin/sh
#
# ################################ #
# iTunes Command Line Control v1.0
# adapted by Júlio Corradi
# created 2001.11.08
# thanks to David Schlosnagle
# ################################ #
# Now I'm using Twitter CLI to
# share current track
# https://github.com/sferik/t
# Don't worry, if you dont want to
# add this CLI it won't will break
# your terminal ;)
# ################################ #

function iTunes () {
    if [[ $1 ]]; then
        opt=$1;
    else
        __itunes_showHelp;
        read opt;
    fi

    case $opt in
        "open" ) echo "Opening iTunes.";
            open -a iTunes;
        ;;

        "status" ) state=`osascript -e 'tell application "iTunes" to player state as string'`;
            echo "iTunes is currently $state.";
            if [ $state = "playing" ]; then
                __itunes_currentsong;
            fi
        ;;

        "play" ) echo "Playing iTunes.";
            osascript -e 'tell application "iTunes" to play';
            __itunes_currentsong;
        ;;

        "pause" ) echo "Pausing iTunes.";
            osascript -e 'tell application "iTunes" to pause';
            __itunes_currentsong;
        ;;

        "next" ) echo "Going to next track." ;
            osascript -e 'tell application "iTunes" to next track';
            __itunes_currentsong;
        ;;

        "prev" ) echo "Going to previous track.";
            osascript -e 'tell application "iTunes" to previous track';
            __itunes_currentsong;
        ;;

        "mute" ) echo "Muting iTunes volume level.";
            osascript -e 'tell application "iTunes" to set mute to true';
        ;;

        "unmute" ) echo "Unmuting iTunes volume level.";
            osascript -e 'tell application "iTunes" to set mute to false';
        ;;

        "vol" ) echo "Changing iTunes volume level.";
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

        "share" ) state=`osascript -e 'tell application "iTunes" to player state as string'`;
            if [ $state = "playing" ]; then
                if [[ -z "$t" ]]; then
                    artist=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
                    track=`osascript -e 'tell application "iTunes" to name of current track as string'`;
                    currenttrack="$artist - $track";

                    t update "♫ #NowPlaying $currenttrack";
                fi
            fi
        ;;

        "stop" ) echo "Stopping iTunes.";
            osascript -e 'tell application "iTunes" to stop';
        ;;

        "quit" ) echo "Exiting iTunes.";
            killall iTunes;
        ;;

        "help" | * ) echo "help:";
            __itunes_showHelp;
        ;;
    esac
}

__itunes_showHelp () {
    printf "${Red}$DIVIDER${NC}\n";
    printf "[${Gre}iTunes${NC}] ${Whi}Command Line Interface${NC}\n";
    printf "${Red}$DIVIDER${NC}\n";
    echo;
    echo "status   = Shows iTunes' status, current artist and track.";
    echo "open     = Opens iTunes.";
    echo "play     = Start playing iTunes.";
    echo "pause    = Pause iTunes.";
    echo "next     = Go to the next track.";
    echo "prev     = Go to the previous track.";
    echo "mute     = Mute iTunes' volume.";
    echo "unmute   = Unmute iTunes' volume.";
    echo "vol up   = Increase iTunes' volume by 10%";
    echo "vol down = Increase iTunes' volume by 10%";
    echo "vol #    = Set iTunes' volume to # [0-100]";
    echo "share    = Share iTunes.";
    echo "stop     = Stop iTunes.";
    echo "quit     = Quit iTunes.";
}

__itunes_currentsong () {
    artist=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
    track=`osascript -e 'tell application "iTunes" to name of current track as string'`;
    echo `printf "♫ ${Gre}$artist${NC} - ${Blu}$track ${NC}"`;
}

# Shorthand controls alias
# ######################## #
alias itunes="iTunes";
alias itunes.open="iTunes open";
alias itunes.status="iTunes status";
alias itunes.play="iTunes play";
alias itunes.pause="iTunes pause";
alias itunes.next="iTunes next";
alias itunes.prev="iTunes prev";
alias itunes.mute="iTunes mute";
alias itunes.mute="iTunes mute";
alias itunes.unmute="iTunes unmute";
alias itunes.stop="iTunes stop";
alias itunes.volup="iTunes vol up";
alias itunes.voldown="iTunes vol down";
alias itunes.setvol="iTunes vol $1";
alias itunes.sharetrack="iTunes share";
alias itunes.stop="iTunes stop";
alias itunes.quit="iTunes quit";