local utils = require('utils')

utils.opt('o', 'signcolumn',  "number")
utils.opt('w', 'wrap', true)
utils.opt('w', 'breakindent', true)

-- set hybrid numbers
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'number', true)

-- theme
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'background', 'dark')
vim.cmd 'colorscheme gruvbox'

-- bar
utils.opt('o', 'showtabline', 2)

-- syntax highlighting
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- cmd to make it so that only the current file has relative
--
--vim.cmd([[
--augroup toggle_number
--    autocmd!
--    autocmd BufEnter, FocusGained, InsertLeave * set relativenumber
--    autocmd BufLeave, FocusLost, InsertEnter   * set norelativenumber
--augroup END
--]])

-- make the gutter bigger
utils.opt('g', 'signcolumn', 'auto:2')
