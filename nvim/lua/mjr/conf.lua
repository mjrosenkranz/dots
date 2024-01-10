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

vim.opt.updatetime = 50

vim.api.nvim_command "packadd cfilter"

-- TODO: make a whole statusline setup
-- if vim.v.hlsearch == 1 then
-- 	local sinfo = vim.fn.searchcount { maxcount = 0 }
-- 	local search_stat = sinfo.incomplete > 0 and '[?/?]'
-- 		or sinfo.total > 0 and ('[%s/%s]'):format(sinfo.current, sinfo.total)
-- 		or nil
-- 
-- 	if search_stat ~= nil then
-- 		-- add search_stat to statusline/winbar
--     -- vim.wo.statusline = search_stat
-- 	end
-- end
