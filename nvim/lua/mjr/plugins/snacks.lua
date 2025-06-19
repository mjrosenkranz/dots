return { 
  {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    picker = {
      enabled = true,
      layout = {
        cycle = true,
        preset = "ivy",
      }
    },
  },
  keys = {
    { '<leader>ff', function() Snacks.picker.files() end},
    { '<leader>fg', function() Snacks.picker.grep() end},
    {'<leader>b', function() Snacks.picker.buffers() end },
    { '<leader>fh', function Snacks.picker.help() end },
    {'<leader>te', function() Snacks.picker.icons({
      icon_sources = {"emoji"},
      -- layout = { preset = "ivy", },
    }) end}

	}


},


  {
    "folke/todo-comments.nvim",
    -- dependencies = { "nvim-lua/plenary.nvim" },
    -- event = "ColorScheme",
    keys = {
      {'<leader>ft', function() Snacks.picker.todo_comments() end},
    },
  },

}
