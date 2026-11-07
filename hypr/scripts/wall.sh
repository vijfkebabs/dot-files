#!/bin/bash
wall="$1"
awww img "$wall" --transition-type fade
ln -sfn -- "$wall" "$HOME/.config/qutebrowser/startpage/current-wallpaper"
wallust run "$wall"
hyprctl reload