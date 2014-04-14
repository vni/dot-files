# use only external monitor. ns9 is connects throught micro-hdmi port.
if xrandr | grep -q 'HDMI1 connected'; then
	xrandr --output HDMI1 --auto --output LVDS1 --off
	#xrandr --output LVDS1 --auto --output HDMI1 --auto --above LVDS1
	#xrandr --output HDMI1 --auto --output LVDS1 --auto
	#wallpapers.sh ~/local/wallpapers/1920x1200/ &
	#wallpapers.sh ~/local/wallpapers/1920x1200/ &
#else
	#sirds-wallpaper.sh &
	#wallpapers.sh ~/local/wallpapers/1600x900/ &
fi

#### SCREEN RESOLUTION ################################################################################
### jk@seq:~$ cvt 1920 1080 60
### # 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
### Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --newmode 1920x1080_60.00  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode VGA1 1920x1080_60.00
#xrandr --output VGA1 --mode 1920x1080_60.00

xset -dpms
xset s off
xset s noblank

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

#xrandr --dpi 138/eDP1

# brightness
#sudo set-brightness.sh

#### DWM STATUS LINE ##################################################################################
### STATUS LINE FUNCTIONS ###

battery() {
	local BATPATH=/sys/class/power_supply/BAT0
	local ACPATH=/sys/class/power_supply/AC
	local current=`cat $BATPATH/energy_now`
	local full=`cat $BATPATH/energy_full`
	local percentage=$(($current * 100 / $full))

	local status=`cat $BATPATH/status`
	local mstat="" # mini status
	case $status in
		Charging)
			mstat="+"
			;;
		Discharging)
			mstat="-"
			;;
		Full)
			mstat=""
			;;
		Unknown)
			mstat="?"
			mstat="" # fixes ?, cause it's common when battery will not charge on
			;;
		*)
			mstat="?$BATPATH/status?"
			;;
	esac

	local ac=`cat $ACPATH/online`
	local mac="" # mini ac
	if ((ac == 1)); then
		mac="AC"
	else
		mac="BAT"
	fi

	echo -n "$mac $mstat$percentage%"
}

date_and_time() {
	echo -n `date '+%Y-%b-%d    %H:%M'`
}

time_wgt() {
	echo -n `date '+%H:%M'`
}

date_wgt() {
	echo -n `date '+%Y-%b-%d'`
}

memory() {
	local used=$(free -m | awk '/^Mem:/ {print $3}')
	echo -n "${used}MB"
}

while true; do
	#xsetroot -name "[`date_and_time`]::[`battery`]::[`memory`]"
	xsetroot -name "`time_wgt`    `date_wgt`    `battery`    `memory`"
	sleep 10
done &

exec dwm
