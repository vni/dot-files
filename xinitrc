#### SCREEN RESOLUTION ################################################################################
### jk@seq:~$ cvt 1920 1080 60
### # 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
### Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --newmode 1920x1080_60.00  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode VGA1 1920x1080_60.00
#xrandr --output VGA1 --mode 1920x1080_60.00
#
#### FONT PATH ########################################################################################
xset +fp $HOME/local/fonts
xset fp rehash

# left handed mouse config
#xmodmap -e 'pointer = 3 2 1'
# see: $ xmodmap -pp
#xmodmap -e 'pointer = 3 2 1 4 5 6 7 8 9 10'


#### RUSSIAN KEYBOARD LAYOUT ##########################################################################
setxkbmap -option "grp:caps_toggle,grp_led:scroll,compose:ralt" -layout "us,ru"

#### WALLPAPER ########################################################################################
#$HOME/local/bin/wallpaper-switcher.sh &
#feh --bg-scale $HOME/local/wallpapers/monster-energy-debian-dark-cool-506080.jpg
#feh --bg-scale $HOME/local/wallpapers/3d-planet-and-sun-1920x1080-wallpaper-1261.jpg
#xsetroot -solid '#003322'
xsetroot -solid '#223333'

xrdb ~/.Xresources

#### DWM STATUS LINE ##################################################################################
while true; do
	xsetroot -name "`date '+%Y-%b-%d    %H:%M'`"
	sleep 1
done &

exec $HOME/local/bin/dwm
