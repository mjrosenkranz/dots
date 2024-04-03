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
    init = function ()
       vim.cmd('colorscheme kanagawa')
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
