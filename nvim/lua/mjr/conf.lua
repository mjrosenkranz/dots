vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = "a"

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = 'yes'

vim.opt.showtabline = 2

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 60
vim.opt.timeoutlen = 350

vim.api.nvim_command "packadd cfilter"

vim.opt.shortmess = "filnxtToOFSW"

vim.opt.syntax = "enable"
vim.opt.spell = true
