# something about getting all my colors from color script
import sys
sys.path.append('/home/xenone/dots/scripts') 
import clrctl

c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save', 'cs' : "config-source"}

#tab things
c.tabs.title.alignment = 'left'
c.tabs.indicator.width = 0
c.tabs.background = True
c.tabs.last_close = "close"
c.tabs.close_mouse_button = "middle"
c.tabs.padding = {'top' : 15, 'bottom': 5, 'left' : 5, 'right' : 5}
c.tabs.max_width = 200
c.tabs.favicons.show = "never"
c.tabs.select_on_remove = "last-used"

c.tabs.title.format = "{perc}{audio}{current_title}"

# colors
cm = clrctl.get_colors()
c.colors.tabs.even.bg = cm['bg_alt']
c.colors.tabs.odd.bg  = cm['bg_alt']
c.colors.tabs.even.fg = cm['bg']
c.colors.tabs.odd.fg  = cm['bg']

c.colors.tabs.selected.even.bg = cm['primary']
c.colors.tabs.selected.odd.bg  = cm['primary']
c.colors.tabs.selected.even.fg = cm['bg']
c.colors.tabs.selected.odd.fg  = cm['bg']

c.colors.tabs.bar.bg= cm['bg_alt']


# status bar
c.statusbar.widgets = ["keypress", "scroll"]
c.statusbar.hide = True
c.statusbar.position = "top"

