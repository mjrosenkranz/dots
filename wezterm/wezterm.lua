-- Import the wezterm module
local wezterm = require 'wezterm'
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()


-- colorscheme stuff
local function is_dark()
  if wezterm.gui then
    return wezterm.gui.get_appearance():find("Dark") 
  end

  return true
end

if is_dark() then
  config.color_scheme = 'Catppuccin Macchiato'
else
  config.color_scheme = 'zenbones'
end

-- keybinds
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- ui stuff
config.default_cursor_style = 'SteadyBar'
config.cursor_blink_rate = 0

config.enable_tab_bar = false

-- font
config.font = wezterm.font { family = 'Roboto Mono' }
config.font_size = 14
config.font_rules = {
  {
    italic = true,
    font = wezterm.font {
      family = 'Iosevka Term Extended',
      weight = 'Medium',
      style = 'Italic',
    },
  },
}

config.term = 'wezterm'

return config
