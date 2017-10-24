#!/bin/bash

to_json() {
        echo "{\"full_text\":\"$1\"}"
}

get_spotify() {
        title=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata | grep title | sed 's/xesam:title: //g')
        artist=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata | grep artist | sed 's/xesam:artist: //g')
        status="⏹"

        [ "$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player PlaybackStatus)" = "Playing" ] && status="⏵"
        sp_string="$status $artist: $title"

        [ "$title" != "" ] && echo $sp_string

}



i3status -c /home/linus/.config/i3/i3status_bar.conf | while :
do
    sp=$(get_spotify)
    spJson=$(to_json "${sp}")

    read line
    echo "${line}" || exit 1
done
