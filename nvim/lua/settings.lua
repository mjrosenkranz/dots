local utils = require('utils')
local cmd = vim.cmd

-- system
-- yank to both system and internal clipboard
utils.opt('o', 'clipboard', "unnamedplus")
-- use da mouse
utils.opt('o', 'mouse', "a")
-- turn off swapfiles (annoying)
utils.opt('o', 'swapfile', false)
-- allow us to quit even if there are hidden files
utils.opt('o', 'hidden', true)


-- whole lotta tabs
cmd('set tabstop=4')
cmd('set softtabstop=4')
cmd('set shiftwidth=4')
utils.opt('o', 'expandtab', true)
utils.opt('o', 'autoindent', true)
utils.opt('o', 'copyindent', true)

vim.g.slime_target = "tmux"
