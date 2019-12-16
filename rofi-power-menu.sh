#!/usr/bin/env bash

# Starts a scan of available broadcasting SSIDs
# nmcli dev wifi rescan

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

echo -e "$LINES"

CHENTRY=$(echo "$LINES" | rofi -dmenu -no-custom -p "Power" -sep '|' -location "$POSITION" -yoffset "$YOFF" -xoffset "$XOFF" -font "$FONT")

echo "$CHENTRY"
