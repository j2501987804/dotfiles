#!/bin/sh
dot=~/dotfiles
cp -r ~/.config/{alacritty,bspwm,cava,mpd,neofetch,polybar,rofi,sxhkd,ranger,picom.conf,wezterm,awesome} $dot/config/
cp -r ~/{.Xresources,.xprofile} $dot/config/
cp -r /etc/environment $dot/config/
