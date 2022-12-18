vim.g.mapleader = " "
vim.g.maplocalleader = ","


-- remap j and k for linewrapped movement
vim.keymap.set('n', 'j', "gj")
vim.keymap.set('n', 'k', "gk")

-- source init file
vim.keymap.set('n', '<leader>s', ':luafile ~/.config/nvim/init.lua<cr>')

-- stop highlighting
vim.keymap.set('n', '<leader>n', ':noh <cr>')

vim.keymap.set('n', "<leader>fd", vim.cmd.Ex);

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
vim.keymap.set('n', '<leader>g', "<cmd>Gtabedit :<cr>")

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

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
