-- Split Hyprland configuration.
-- The complete monolithic config is backed up at hyprland.lua.bak.

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

require("hyprland.animations")
require("hyprland.decoration")
require("hyprland.env")
require("hyprland.execs")
require("hyprland.general")
require("hyprland.gestures")
require("hyprland.input")
require("hyprland.keybinds")
require("hyprland.misc")
require("hyprland.rules")
