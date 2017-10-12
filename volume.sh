#!/bin/sh


SINK=$(pacmd list-sinks | grep -e 'name:' -e 'index' | head -n 1 | sed 's:.*\:::')
case "$1" in
    up)
        pactl set-sink-volume ${SINK} +5%
        ;;
    down)
        pactl set-sink-volume ${SINK} -5%
        ;;
    mute)
         pactl set-sink-mute ${SINK} toggle
        ;;
    *)
         pactl set-sink-mute ${SINK} toggle
esac
#pacmd list-sinks | grep -e 'name:' -e 'index'

#VOLUME=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
#VOLUME="VOLUME ${VOLUME}"
#notify-send test --expire-time=200

exit 0
