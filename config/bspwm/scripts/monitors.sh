#!/bin/bash

extr=$(xrandr --query | grep '^HDMI-1')

if [[ $extr = *\ connected* ]]; then
        bspc monitor eDP-1 -d 1 3 5 6 9
        bspc monitor HDMI-1 -d 2 4 7 8
        # Dynamically create desktops for HDMI-1 if they don't exist
        for desktop in {6..9}; do
            bspc desktop HDMI-1:$desktop -n HDMI-$desktop
        done
        notify-send "HDMI-1 CONNECTED" "Choose your Monitor setup . . ." & 
        bash -c ~/.scripts/monitors.sh &
else
        bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9
        notify-send "HDMI-1 DISCONNECTED" "Running the Laptop setup . . ." &
        bash -c ~/.config/i3/monitors/SingleMon.sh &
fi

sleep 5; notify-send "Welcome to BSPWM :)))" "Have a [REDACTED] day *wink*" &
