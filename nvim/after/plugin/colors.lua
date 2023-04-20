require("catppuccin").setup({
    flavor = "macchiato",
    integrations = {
      gitgutter = true,
    }
})
vim.cmd('colorscheme catppuccin-macchiato')

require('nvim-highlight-colors').setup {}
