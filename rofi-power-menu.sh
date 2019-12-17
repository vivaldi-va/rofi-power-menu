#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

POSITION=0
YOFF=0
XOFF=0
FONT="Fira Sans 14"

_rofi() {
  rofi \
    -dmenu \
    -no-custom true \
    -disable-history true \
    -cycle true \
    -p "Power" \
    -sep '|' \
    -location "$POSITION" \
    -yoffset "$YOFF" \
    -xoffset "$XOFF" \
    -font "$FONT" \
    "$@"
}



if [ -r "$DIR/config" ]; then
  source ./config
elif [ -r "$HOME/.config/rofi/power" ]; then
  source "$HOME/.config/rofi/power"
else
  echo "WARNING: config file not found! Using default values."
fi

LINES="Lock screen|Sleep|Log out|Power off|Restart"
CHENTRY=$(echo "$LINES" | _rofi)

if [ "$CHENTRY" = "Lock screen" ]; then
  confirm=$(echo "yes|no" | _rofi -mesg "are you sure?")
  if [ "$confirm" = "yes" ]; then
    betterlockscreen -l
  fi
elif [ "$CHENTRY" = "Sleep"  ]; then
  confirm=$(echo "yes|no" | _rofi -mesg "are you sure?")
  if [ "$confirm" = "yes" ]; then
    betterlockscreen -s
  fi
elif [ "$CHENTRY" = "Log out"  ]; then
  betterlockscreen -s
elif [ "$CHENTRY" = "Power off"  ]; then
  confirm=$(echo "yes|no" | _rofi -mesg "are you sure?")
  if [ "$confirm" = "yes" ]; then
    systemctl poweroff
  fi
elif [ "$CHENTRY" = "Restart"  ]; then
  confirm=$(echo "yes|no" | _rofi -mesg "are you sure?")
  if [ "$confirm" = "yes" ]; then
    reboot
  fi
else
  echo "err"
fi
