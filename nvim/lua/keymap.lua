local utils = require('utils')

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
-- remap j and k for linewrapped movement
utils.map('n', 'j', "gj")
utils.map('n', 'k', "gk")

-- source init file
utils.map('n', '<leader>s', ':luafile ~/.config/nvim/init.lua<cr>')

-- stop highlighting
utils.map('n', '<leader>n', ':noh <cr>')

-- telescope shortcuts
utils.map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
utils.map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- navigation
vim.g.tmux_navigator_no_mappings = true
utils.map('n', '<M-h>', "<cmd>TmuxNavigateLeft<cr>")
utils.map('n', '<M-j>', "<cmd>TmuxNavigateDown<cr>")
utils.map('n', '<M-k>', "<cmd>TmuxNavigateUp<cr>")
utils.map('n', '<M-l>', "<cmd>TmuxNavigateRight<cr>")

-- git
utils.map('n', '<leader>g', "<cmd>Gtabedit :<cr>")

-- dap
utils.map('n', '<leader>bp', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
utils.map('n', '<leader>dp', "<cmd>lua require'dap'.continue()<cr>")
