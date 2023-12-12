local dired = require("dired")
dired.setup({
  path_separator = "/",
  show_banner = false,
  show_hidden = true,
  show_dot_dirs = true,
  show_colors = true,
  sort_order = "name",

  keybinds = {
    dired_enter = "l",
    dired_back = "h",
--    dired_up = "_",
--    dired_rename = "R",
    -- ... (add more keybindings as needed)
    dired_quit = "q",
  },
})
