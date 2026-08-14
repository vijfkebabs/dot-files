# dot-files

Personal dotfiles and configuration files for my setup.

## Contents

| Folder | What it configures |
| --- | --- |
| [`WezTerm`](./WezTerm) | Config for [WezTerm](https://wezterm.org/), a GPU-accelerated terminal emulator (fonts, colors, keybindings, pane/tab management) |
| [`kitty`](./kitty) | Config for [kitty](https://sw.kovidgoyal.net/kitty/), another GPU-accelerated terminal emulator |
| [`fastfetch`](./fastfetch) | Config for [fastfetch](https://github.com/fastfetch-cli/fastfetch), a system information tool |
| [`Spicetify/Ziro`](./Spicetify/Ziro) | [Spicetify](https://spicetify.app/) theme/config ("Ziro") for customizing the Spotify client |
| [`vencord`](./vencord) | Config for [Vencord](https://vencord.dev/), a Discord client mod |
| [`windhawk`](./windhawk) | Mod settings for [Windhawk](https://windhawk.net/), a Windows customization tool |

## Usage

Clone the repo:

```bash
git clone https://github.com/vijfkebabs/dot-files.git
```

Then copy or symlink the relevant config into place for each tool. Exact target paths depend on the tool and OS — see below for the ones that live in fixed locations.

### WezTerm

Copy or symlink `WezTerm/wezterm.lua` to:

- **Windows:** `%USERPROFILE%\.config\wezterm\wezterm.lua` (or `%USERPROFILE%\.wezterm.lua`)
- **macOS/Linux:** `~/.config/wezterm/wezterm.lua`

### kitty

Copy or symlink the config to:

- **Linux/macOS:** `~/.config/kitty/kitty.conf`
- **Windows (WSL):** same as Linux, inside your WSL distro

### fastfetch

Copy or symlink the config to:

- `~/.config/fastfetch/config.jsonc`

### Spicetify

Follow the [Spicetify install instructions](https://spicetify.app/docs/getting-started), then apply the `Ziro` theme from the `Spicetify/Ziro` folder by placing it in your Spicetify `Themes` directory and running:

```bash
spicetify config current_theme Ziro
spicetify apply
```

### Vencord

Copy the contents of `vencord` into the Vencord quickcss discord settings.

### Windhawk

Import the mod settings from `windhawk` via the Windhawk app's import feature.

## Notes

- These configs are tailored to my own setup and preferences — feel free to fork and adapt them.
- No warranty, no guarantees it won't break your rice. Use at your own risk.
