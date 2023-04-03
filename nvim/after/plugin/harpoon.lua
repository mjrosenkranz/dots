require("telescope").load_extension('harpoon')
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>a', mark.add_file, {})
vim.keymap.set('n', '<leader>r', mark.rm_file, {})
vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, {})
vim.keymap.set('n', '<leader>j', ui.nav_next, {})
vim.keymap.set('n', '<leader>f', ui.nav_prev, {})

