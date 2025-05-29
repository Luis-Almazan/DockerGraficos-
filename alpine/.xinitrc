#!/bin/sh
export DISPLAY=:1
xsetroot -solid "#444444" &
sleep 1
#tint2 &
tint2 -c /dev/null &
sleep 1
xterm &
#openbox &
exec openbox
