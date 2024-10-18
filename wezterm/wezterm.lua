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
  config.color_scheme = 'kanagawabones'
else
  config.color_scheme = 'neobones_light'
end

-- keybinds
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- ui stuff
config.default_cursor_style = 'SteadyBar'
config.cursor_blink_rate = 0

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_color = "Auto"
config.enable_tab_bar = false
config.window_padding = {
  -- get dpi??
  top = 30,
  -- top = wezterm.dpi * 2,
}

config.font = wezterm.font_with_fallback {
  { family = 'Roboto Mono', weight = 'Regular' },
  'Apple Color Emoji',
}
config.font_size = 14
config.font_rules = {
  {
    italic = true,
    font = wezterm.font_with_fallback {
      {family = 'Iosevka Term Extended', weight = 'Medium', style = 'Italic',},
      'Apple Color Emoji',
    },
  },
}

config.term = 'wezterm'

return config
