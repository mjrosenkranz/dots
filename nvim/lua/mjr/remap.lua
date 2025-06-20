-- source init file
vim.keymap.set('n', '<leader>S', ':luafile ~/.config/nvim/init.lua<cr>')

-- stop highlighting
vim.keymap.set('n', '<leader>n', ':noh <cr>')
vim.keymap.set('n', "<leader>fd", ':Oil <cr>');

-- navigation
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', 'n', "nzz")
vim.keymap.set('n', 'N', "Nzz")

-- git
vim.keymap.set('n', '<leader>g', "<cmd>Gedit :<cr>")

-- leader p replaces without copying the selected text
vim.keymap.set('x', "<leader>p", "\"_dP")
vim.keymap.set('n', "<leader>d", "\"_d")

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

vim.keymap.set("n", "<leader>qo", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<cr>")

vim.keymap.set("n", "gD", "<C-w>v<cmd>lua vim.lsp.buf.definition()<cr>", opts)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-l>", "<C-w><C-l>")
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><cmd>TmuxNavigateDown<cr>")
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><cmd>TmuxNavigateUp<cr>")
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><cmd>TmuxNavigateRight<cr>")
