#!/bin/sh
# Just use the laptop monitor when connected to an external VGA monitor
xrandr --output LVDS --mode 1280x800 --output VGA-0 --off
