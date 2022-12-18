#!/bin/env sh

dunst &
hsetroot -cover $HOME/pics/walls/currbg &
# kitty &
picom --backend glx --vsync &
