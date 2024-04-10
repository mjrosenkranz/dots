return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- init = function ()
    --   require("catppuccin").setup({
    --       flavor = "macchiato",
    --       integrations = {
    --         gitgutter = true,
    --       }
    --   })
    --   vim.cmd('colorscheme catppuccin-macchiato')
    -- end,
  },
  {
    "rebelot/kanagawa.nvim",
    -- init = function ()
    --    vim.cmd('colorscheme kanagawa')
    -- end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = true,
    --opts = ...
    init = function ()
       vim.cmd('colorscheme gruvbox')
       vim.cmd('set background=light')
    end
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
