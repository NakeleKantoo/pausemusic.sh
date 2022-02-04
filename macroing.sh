#!/bin/bash

MOUSE_ID=$(xinput --list | grep -i -m 1 'USB OPTICAL MOUSE' | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')

STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[9\]' | sort)
while true; do
    sleep 0.2
    STATE2=$(xinput --query-state $MOUSE_ID | grep 'button\[9\]' | sort)
    #comm -13 <(echo "$STATE1") <(echo "$STATE2")
    if [ $STATE2 = 'button[9]=down' ]
    then
        pausething
    fi
    STATE1=$STATE2
done

 pausething() {
    pausemusic.sh &
    sleep 2
 }
