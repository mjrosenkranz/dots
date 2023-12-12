require("catppuccin").setup({
    flavor = "macchiato",
    integrations = {
      gitgutter = true,
    }
})
vim.cmd('colorscheme catppuccin-macchiato')

require('nvim-highlight-colors').setup {}

-- vim.g.ayucolor = "light"
-- vim.cmd('colorscheme ayu')
-- local group = 'Comment'
-- local old_hl = vim.api.nvim_get_hl_by_name( group, true )
-- local new_hl = vim.tbl_extend( 'force', old_hl, { italic=true } )
-- vim.api.nvim_set_hl( 0, group, new_hl )
