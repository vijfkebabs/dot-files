local ok, c = pcall(dofile, os.getenv("HOME") .. "/.config/hypr/colors.lua")
if not ok then
	c = { accent = "71cead", inactive = "53685b" }
end

hl.config({
	cursor = {
		no_hardware_cursors = 1,
	},

	general = {
		gaps_in = 2,
		gaps_out = 2,
		border_size = 1,
		col = {
			active_border = "rgba(" .. c.accent .. "ff)",
			inactive_border = "rgba(" .. c.inactive .. "aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "master",
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},
})
