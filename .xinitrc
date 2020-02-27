#!/bin/sh

# italian keymap
setxkbmap it

# activate num lock
numlockx &

# remove cursor after a while
unclutter &

# compositor for transparency
picom -b

# merge home .Xresources to global ones
xrdb -merge ~/.Xresources

# [tower only] select resolution and refresh rate
xrandr --output HDMI-0 --mode 1920x1080 --rate 120

# status bar
slstatus 2>&1> /dev/null &

# restore colorscheme
feh --bg-center f40.jpg

# start wm
exec dwm
