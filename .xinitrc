# italian keymap
setxkbmap it

# remove cursor after a while
unclutter &

# status bar
slstatus 2> /dev/null &

# restore wallpaper
feh --bg-fill ~/Pictures/want-a-gem.png

# merge local Xresources to global ones
xrdb -merge ~/.Xresources

# start wm
exec cowm
