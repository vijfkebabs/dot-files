#!/bin/bash
wall="$1"
awww img "$wall" --transition-type fade
wallust run "$wall"
hyprctl reload