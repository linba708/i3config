#!/bin/sh

case "$1" in
    up)
        pactl set-sink-volume 0 +5%
        ;;
    down)
        pactl set-sink-volume 0 -5%
        ;;
    mute)
         pactl set-sink-mute 0 toggle
        ;;
    *)
         pactl set-sink-mute 0 toggle
esac
#VOLUME=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
#VOLUME="VOLUME ${VOLUME}"
#notify-send test --expire-time=200

exit 0
