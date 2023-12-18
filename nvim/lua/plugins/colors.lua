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
    end,
    config = function () 
      vim.cmd('colorscheme catppuccin-macchiato')
    end
  },
  'brenoprata10/nvim-highlight-colors',
}
