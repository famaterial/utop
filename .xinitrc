#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output DP-1 --mode 5120x1440 &
feh --bg-fill --randomize $HOME/wallpapers/
wal -i $(cat ~/.fehbg | grep 'feh' | awk '{print $4}' | sed "s/'//g") && $HOME/.local/bin/update-dunst-colors.sh
picom -b
dunst &
numlockx &
unclutter -idle 4 &
sxhkd &
exec bspwm
