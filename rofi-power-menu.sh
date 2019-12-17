#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

POSITION=0
YOFF=0
XOFF=0
FONT="Fira Sans 14"



if [ -r "$DIR/config" ]; then
  source ./config
elif [ -r "$HOME/.config/rofi/power" ]; then
  source "$HOME/.config/rofi/power"
else
  echo "WARNING: config file not found! Using default values."
fi

LINES="Lock screen|Sleep|Log out|Power off|Restart"
CHENTRY=$(echo "$LINES" | rofi -dmenu -no-custom -p "Power" -sep '|' -location "$POSITION" -yoffset "$YOFF" -xoffset "$XOFF" -font "$FONT")

if [ "$CHENTRY" = "Lock screen" ]; then
  betterlockscreen -l
elif [ "$CHENTRY" = "Sleep"  ]; then
  betterlockscreen -s
elif [ "$CHENTRY" = "Log out"  ]; then
  betterlockscreen -s
elif [ "$CHENTRY" = "Power off"  ]; then
  shutdown -h now
elif [ "$CHENTRY" = "Restart"  ]; then
  reboot
else
  echo "err"
fi
