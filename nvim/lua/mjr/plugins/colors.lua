return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function ()
      require("catppuccin").setup({
          flavor = "macchiato",
          integrations = {
            gitgutter = true,
          }
      })
      vim.cmd('colorscheme catppuccin-macchiato')
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    priority = 1000,
    lazy = false,
    config = function ()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd('colorscheme zenbones')
    end
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd('colorscheme catppuccin-macchiato')
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd('colorscheme zenbones')
      end,
    },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function () 
      vim.api.nvim_create_user_command("HlColor",
        function () require("nvim-highlight-colors").turnOn()
      end, {})
    end
  }
}
