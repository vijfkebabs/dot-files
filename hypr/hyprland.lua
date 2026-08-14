hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- hyprctl monitor
-------------------------------------------------
-- Dedicate workspaces per monitor
-- Main monitor at (0,0)
-- hl.monitor({
--     output = "DP-1",
--     mode = "preferred",
--     position = "0x0",
--     scale = 1,
-- })
--
-- -- Second monitor to the right of the first
-- hl.monitor({
--     output = "HDMI-A-1",
--     mode = "preferred",
--     position = "1920x0",
--     scale = 1,
-- })
--
-- -- Workspaces 1-3 belong to DP-1
-- hl.raw("workspace = 1, monitor:DP-1")
-- hl.raw("workspace = 2, monitor:DP-1")
-- hl.raw("workspace = 3, monitor:DP-1")
--
-- -- Workspaces 4-6 belong to HDMI-A-1
-- hl.raw("workspace = 4, monitor:HDMI-A-1")
-- hl.raw("workspace = 5, monitor:HDMI-A-1")
-- hl.raw("workspace = 6, monitor:HDMI-A-1")
-------------------------------------------------
-- Move workspaces between monitors
-- Next workspace
-- hl.bind("SUPER", "Tab", "workspace", "e+1")
--
-- -- Move current workspace to next monitor
-- hl.bind("SUPER SHIFT", "Tab", "movecurrentworkspacetomonitor", "+1")
-------------------------------------------------
-- mirror
-- hl.raw("monitor = HDMI-A-1, preferred, auto, 1, mirror, DP-1")
-------------------------------------------------
-- Default workspace on each monitor
-- hl.raw("workspace = 1, monitor:DP-1, default:true")
-- hl.raw("workspace = 2, monitor:HDMI-A-1, default:true")
-------------------------------------------------
local terminal = "kitty"

hl.on("hyprland.start", function()
	hl.exec_cmd("swaybg -m fill -i ~/.config/hypr/adwaita-d.jpg")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("hyprpaper & udiskie")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd(terminal .. " tmux new-session -A -s main")
	hl.exec_cmd("syncthing")
	hl.exec_cmd("bongocat -c /home/huseyin/.config/bongocat/bongocat.conf -w")
	hl.exec_cmd("waybar -c ~/.config/waybar/top.jsonc -s ~/.config/waybar/style.css")
	hl.exec_cmd("waybar -c ~/.config/waybar/bottom.jsonc -s ~/.config/waybar/style.css")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 2,

		col = { --cdd6f4
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "master",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

hl.config({
	input = {
		kb_layout = "tr",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind("ALT + up", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + up", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("swaylock"))

hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal .. " tmux new-session -A -s main"))
hl.bind("CTRL + ALT + U", hl.dsp.exec_cmd(terminal .. " tmux new-session -A -s background"))
hl.bind("CTRL + ALT + Y", hl.dsp.exec_cmd(terminal .. " tmux"))
hl.bind("CTRL + ALT + I", hl.dsp.exec_cmd("poweroff"))
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd("reboot"))
hl.bind("CTRL + ALT + O", hl.dsp.exec_cmd("swaylock; systemctl suspend"))
--hl.bind("CTRL + ALT + O", hl.dsp.exec_cmd(""))
hl.bind("CTRL + ALT + KP_Home", hl.dsp.exec_cmd("firefox"))
hl.bind("CTRL + ALT + KP_Begin", hl.dsp.exec_cmd("wofi --show run"))
hl.bind("CTRL + ALT + right", hl.dsp.exec_cmd("wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("CTRL + ALT + left", hl.dsp.exec_cmd("wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("CTRL + ALT + up", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("CTRL + ALT + down", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("CTRL + ALT + Return", hl.dsp.exec_cmd("~/.local/bin/cliphist-rofi"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("~/.local/bin/cliphist-rofi d"))
hl.bind("ALT + TAB", hl.dsp.layout("cyclenext"))
hl.bind("ALT + SHIFT + TAB", hl.dsp.layout("cyclenext", "prev"))
hl.bind("ALT + F4", hl.dsp.window.close())

-- bind = $mainMod, S, exec, grim -g "$(slurp)" "$HOME/Pictures/Screenshots"/"Screenshot_$(date +%Y%m%d-%H%M%S).png" # take a screenshot
-- bind = $mainMod, PRINT, exec, hyprshot -m window
--
--
-- bind = CTRL ALT SHIFT, Delete, exec, cliphist wipe && notify-send "Clipboard" "History Cleared"

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

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

-- hl.window_rule({
-- 	match = { class = "^(camoufox-default)$" }, -- Replace with your browser's class name
-- 	workspace = "9 silent",
-- })
