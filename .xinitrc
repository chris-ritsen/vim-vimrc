#!/bin/sh
# ~/.xinitrc

/usr/bin/numlockx on # enable numlock
xmodmap $HOME/.xmodmap # map keyboard
xrdb -load $HOME/.Xresources # gui settings
xsetroot -cursor_name left_ptr # enable cursor

exec /usr/bin/xmonad # start xmonad window manager

