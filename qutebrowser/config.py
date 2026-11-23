from pathlib import Path
import os

config.load_autoconfig(False)
c.input.insert_mode.auto_load = True
c.input.insert_mode.auto_leave = True
c.colors.webpage.bg = "#212121"
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.tabs.bar.bg = "#212121"
c.colors.tabs.even.bg = "#212121"
c.colors.tabs.odd.bg = "#212121"
c.colors.tabs.selected.even.bg = "#212121"
c.colors.tabs.selected.odd.bg = "#212121"
config.set("colors.webpage.darkmode.enabled", True, "*://youtube.com/*")
config.set("colors.webpage.darkmode.enabled", True, "*://*.youtube.com/*")
config.set("colors.webpage.darkmode.enabled", True, "*://orion.hogent.be/*")
c.tabs.position = "top"
c.url.start_pages = [(Path.home() / ".config" / "qutebrowser" / "startpage" / "index.html").as_uri()]
c.url.default_page = c.url.start_pages[0]
c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/fanboy-annoyance.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
]
play = os.path.expanduser('~/.local/bin/qb-ytplay')
config.bind(',m', f'spawn kitty -e {play} {{url}}')
config.bind(',M', f'hint links spawn kitty -e {play} {{hint-url}}')