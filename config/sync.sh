#!/bin/sh
dot=~/dotfiles
cp -r ~/.config/{alacritty,bspwm,cava,mpd,neofetch,polybar,rofi,sxhkd,ranger,dunst,picom.conf} $dot/config/
cp -r ~/{.Xresources,.xprofile} $dot/config/
cp -r /etc/environment $dot/config/
