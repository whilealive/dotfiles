#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  desktop
# INFO     Executed by startx
#
# DATE     17.03.2021
# OWNER    Bischofberger
# ==================================================================

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# -----------everything from here belongs to the awesome setup-----------------

# set X11 keymap
setxkbmap -layout ch

# mute the stupid "Bing" sound
xset b off

# set NumLock
numlockx &

# start conky
conky &

# exec awesome WM
exec awesome
