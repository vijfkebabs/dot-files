# dot-files

Personal dotfiles and configuration files for my setup.

## Contents

| Folder | What it configures |
| --- | --- |
| [`WezTerm`](./WezTerm) | Config for [WezTerm](https://wezterm.org/), a GPU-accelerated terminal emulator (fonts, colors, keybindings, pane/tab management) for all operating systems |
| [`kitty`](./kitty) | Config for [kitty](https://sw.kovidgoyal.net/kitty/), a GPU-accelerated terminal emulator for Linux |
| [`hyprland`](./hypr) | Config for [Hyprland](https://hypr.land/), a tiling window manager |
| [`rofi`](./rofi) | Config and theme for [Rofi](https://github.com/davatorium/rofi), an application launcher and window switcher |
| [`fastfetch`](./fastfetch) | Config for [fastfetch](https://github.com/fastfetch-cli/fastfetch), a system information tool |
| [`Spicetify`](./Spicetify/Ziro) | [Spicetify](https://spicetify.app/) theme/config ("Ziro") for customizing the Spotify client |
| [`vencord`](./vencord) | Config for [Vencord](https://vencord.dev/), a Discord client mod |
| [`windhawk`](./windhawk) | Mod settings for [Windhawk](https://windhawk.net/), a Windows customization tool |
| [`yasb`](./yasb) | Config for [YASB](https://github.com/amnweb/yasb), a highly configurable Windows status bar |

## Usage

Clone the repo:

```bash
git clone https://github.com/vijfkebabs/dot-files.git
```

Then copy or symlink the relevant config into place for each tool. Exact target paths depend on the tool and operating system — see below for the ones that live in fixed locations.

### WezTerm

Copy or symlink `WezTerm/wezterm.lua` to:

- **Windows:** `%USERPROFILE%\.config\wezterm\wezterm.lua` or `%USERPROFILE%\.wezterm.lua`
- **macOS/Linux:** `~/.config/wezterm/wezterm.lua`

### kitty

Copy or symlink the config to:

- **Linux/macOS:** `~/.config/kitty/kitty.conf`
- **Windows (WSL):** the same path inside your WSL distribution

### Hyprland

Copy or symlink the contents of `hypr` to:

```text
~/.config/hypr/
```

Then reload the config from within Hyprland:

```bash
hyprctl reload
```

### Rofi

Install Rofi on CachyOS or another Arch-based distribution:

```bash
sudo pacman -S rofi-wayland
```

Copy or symlink the contents of `rofi` to:

```text
~/.config/rofi/
```

The Rofi configuration contains the launcher behavior and the theme contains the colors and styling. Make sure the theme file is loaded by the configuration or by the launch command.

Launch Rofi's application menu with:

```bash
rofi -show drun
```

If you want to launch it with a specific theme:

```bash
rofi -show drun -theme ~/.config/rofi/config.rasi
```

For a Hyprland keybind, use for example:

```ini
bind = SUPER, D, exec, rofi -show drun
```

If the theme has a different filename, replace `config.rasi` with the correct filename.

The Rofi theme uses a blue color scheme. Normal and alternate rows use dark blue backgrounds, while the row selected or hovered with the mouse uses a lighter blue background:

```rasi
element normal.normal {
    background-color: #22344aff;
    text-color: #dbeafeff;
}

element alternate.normal {
    background-color: #22344aff;
    text-color: #dbeafeff;
}

element selected.normal {
    background-color: #315a7dff;
    text-color: #f0f9ffff;
}
```

### fastfetch

Copy or symlink the config to:

```text
~/.config/fastfetch/config.jsonc
```

### Spicetify

Follow the [Spicetify install instructions](https://spicetify.app/docs/getting-started), then apply the `Ziro` theme from the `Spicetify/Ziro` folder by placing it in your Spicetify `Themes` directory.

Then run:

```bash
spicetify config current_theme Ziro
spicetify apply
```

### Vencord

Copy the contents of `vencord` into the Vencord QuickCSS settings in Discord.

### Windhawk

Copy the contents from `windhawk` into the Advanced tab of the respective Windhawk mods.

### YASB

The `yasb` folder contains the YASB configuration, stylesheet, theme, and wallpapers.

Copy or symlink the contents of `yasb` to your YASB configuration directory.

If you do not have YASB installed yet, install it with:

```powershell
winget install --id AmN.yasb
```

The configuration folder usually lives at:

```text
%USERPROFILE%\.config\yasb\
```

The folder contains:

- `config.yaml` — YASB bar and widget configuration
- `styles.css` — YASB styling
- `theme.json` — theme configuration
- `Wallpapers/` — wallpapers used by the wallpaper widget

Any wallpaper added to this folder can be shown by the wallpaper widget. You may need to update the wallpaper path in `config.yaml`.

## Notes

- These configs are tailored to my own setup and preferences — feel free to fork and adapt them.
- There is no guarantee that these configs will work for everyone, and they may break your setup.
- Use these dotfiles at your own risk.