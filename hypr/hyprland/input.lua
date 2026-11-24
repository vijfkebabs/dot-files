hl.config({
	input = {
		kb_layout = "be,us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		accel_profile = "flat",
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.device({
	name = "ven_0488:00-0488:101e-touchpad",
	accel_profile = "adaptive",
})
