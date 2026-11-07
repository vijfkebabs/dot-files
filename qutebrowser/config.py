from pathlib import Path

config.load_autoconfig(False)
c.input.insert_mode.auto_load = True
c.input.insert_mode.auto_leave = True
c.colors.webpage.preferred_color_scheme = "dark"
config.set("colors.webpage.darkmode.enabled", True, "*://youtube.com/*")
config.set("colors.webpage.darkmode.enabled", True, "*://*.youtube.com/*")
c.tabs.position = "top"
c.url.start_pages = [(Path.home() / ".config" / "qutebrowser" / "startpage" / "index.html").as_uri()]
c.url.default_page = c.url.start_pages[0]
