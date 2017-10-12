#!/bin/sh


i3status -c /home/linus/.config/i3/i3status.conf | while :
do
    read line
    echo "test | $line" || exit 1
done
