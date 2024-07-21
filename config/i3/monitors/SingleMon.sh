#!/bin/sh

xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rate 60 --rotate normal  --output HDMI-1 --off &

nitrogen --restore &
