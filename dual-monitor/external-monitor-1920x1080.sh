#!/bin/sh
# Use external VGA monitor and disable laptop montir.
# Check external VGA monitor resolution
xrandr --output VGA-0 --mode 1920x1080 --output LVDS --off
