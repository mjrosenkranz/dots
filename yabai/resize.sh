#!/usr/bin/env bash

# $1 is the direction to move
# $2 is the amount to move

amt="$2"

case "$1" in
    left)
        /opt/homebrew/bin/yabai -m window --resize right:"-$amt":0 2> /dev/null || /opt/homebrew/bin/yabai -m window --resize left:"-$amt":0 2> /dev/null
    ;;
    right)
        /opt/homebrew/bin/yabai -m window --resize right:"$amt":0 2> /dev/null || /opt/homebrew/bin/yabai -m window --resize left:"$amt":0 2> /dev/null
    ;;
    top)
        /opt/homebrew/bin/yabai -m window --resize bottom:0:"-$amt" 2> /dev/null || /opt/homebrew/bin/yabai -m window --resize top:0:"-$amt" 2> /dev/null
    ;;
    bottom)
        /opt/homebrew/bin/yabai -m window --resize bottom:0:"$amt" 2> /dev/null || /opt/homebrew/bin/yabai -m window --resize top:0:"$amt" 2> /dev/null
    ;;
    *) echo "bad input: $1";  exit 1;;
esac

