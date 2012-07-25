#!/bin/sh
# Script to use both monitors, check resolutions and pos.
# This is for one on top of the other
xrandr --output VGA-0 --mode 1920x1080 --pos 0x800 --output LVDS --mode 1280x800 --pos 0x0
