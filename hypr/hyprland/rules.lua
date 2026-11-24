local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "fit-helium-window",
	match = { class = "^helium$" },
	tile = true,
})

hl.window_rule({
	name = "kando",
	match = {
		class = "menu.kando.Kando",
		title = "Kando Menu",
	},
	no_blur = true,
	opaque = true,
	move = { 0, 0 },
	rounding = 0,
	size = { "100%", "100%" },
	border_size = 0,
	no_anim = true,
	float = true,
	pin = true,
})
