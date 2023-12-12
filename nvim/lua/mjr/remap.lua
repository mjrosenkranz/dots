vim.g.mapleader = " "
vim.g.maplocalleader = ","


-- source init file
vim.keymap.set('n', '<leader>S', ':luafile ~/.config/nvim/init.lua<cr>')

-- stop highlighting
vim.keymap.set('n', '<leader>n', ':noh <cr>')


-- dired.
local function dired_current ()
  -- return "<cmd>Dired" .. vim.fn.expand('%') .. "<cr>"
  return vim.cmd.Dired(vim.fn.expand('%'))
end

vim.keymap.set('n', "<leader>fd", dired_current)

-- navigation
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', 'n', "nzz")
vim.keymap.set('n', 'N', "Nzz")

-- tmux nav
vim.g.tmux_navigator_no_mappings = true
vim.keymap.set('n', '<M-h>', "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set('n', '<M-j>', "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set('n', '<M-k>', "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set('n', '<M-l>', "<cmd>TmuxNavigateRight<cr>")

-- git
vim.keymap.set('n', '<leader>g', "<cmd>Gedit :<cr>")

-- leader p replaces without copying the selected text
vim.keymap.set('x', "<leader>p", "\"_dP")
vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('v', "<leader>d", "\"_d")

vim.keymap.set('n', "Q", "<nop>")

-- move stuff around in chunk
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")

-- append line without moving to end
vim.keymap.set('n', "J", "mzJ`z")

-- disable horizontal scrolling
vim.keymap.set("n", "<ScrollWheelLeft>", "<nop>")
vim.keymap.set("n", "<ScrollWheelRight>", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
