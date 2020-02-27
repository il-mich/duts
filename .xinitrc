# italian keymap
setxkbmap it

# activate num lock
numlockx &

# remove cursor after a while
unclutter &

# compositor for transparency
picom -b

# [tower only] select resolution and refresh rate
xrandr --output HDMI-0 --mode 1920x1080 --rate 120

# status bar
slstatus 2>&1> /dev/null &

# restore colorscheme
wal -R

# start wm
exec dwm
