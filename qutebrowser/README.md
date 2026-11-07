# Qutebrowser-config

My personal qutebrowser setup - minimal, keyboard-driven, anime-themed startpage.

![startpage](Image/image.png)

## Structure

```
~/.config/qutebrowser/
├── config.py
├── autoconfig.yml
├── quickmarks
├── bookmarks/
│   └── urls
└── startpage/
    ├── index.html
    ├── style.css
    ├── script.js
    └── current-wallpaper -> active desktop wallpaper
```

## Startpage

- Live clock & date in French
- Categorized quicklinks — dev, social, learn
- Search bar with custom shortcuts
- Fonts: [Syne](https://fonts.google.com/specimen/Syne) + [DM Mono](https://fonts.google.com/specimen/DM+Mono)
- The start page follows the active desktop wallpaper through a generated `current-wallpaper` link.
- Wallust regenerates `startpage/wallust.css` when the wallpaper changes, keeping the page colors synchronized.

### Search shortcuts

| Prefix | Engine |
|--------|--------|
| `gh ` | GitHub search |
| `aw ` | Arch wiki |
| `yt ` | YouTube |
| `ddg ` | DuckDuckGo |
| `od` | OSDev wiki |
| `cd` | Claude |

## Install

```bash
git clone https://github.com/nathanWorkout/Qutebrowser-config.git ~/.config/qutebrowser
```

> Change the wallpaper path in `style.css` if needed.
