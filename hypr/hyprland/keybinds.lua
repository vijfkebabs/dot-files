local mainMod = "SUPER"

hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + up", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("command -v swaync-client >/dev/null 2>&1 && swaync-client -t"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("qs -c ipc call themeswitch cycle"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("qutebrowser"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("code --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl switchxkblayout current next"))
hl.bind(mainMod .. " + twosuperior", function()
	hl.plugin.hyprtasking.toggle("cursor")
end)
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("~/.local/share/quickshell-lockscreen/lock.sh"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprshot -m region -s"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd([[hyprpicker -a | xargs -I{} notify-send "Color copied" "{}"]]))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("waypaper --random"))
hl.bind(mainMod .. " + ALT + I", hl.dsp.exec_cmd("poweroff"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("reboot"))
hl.bind("ALT + TAB", hl.dsp.layout("cyclenext"))
hl.bind("ALT + SHIFT + TAB", hl.dsp.layout("cycleprev"))
hl.bind("ALT + F4", hl.dsp.window.close())

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))

for i = 1, 10 do
	local key = "code:" .. (9 + i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"),
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
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
