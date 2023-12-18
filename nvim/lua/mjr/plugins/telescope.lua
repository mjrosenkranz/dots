return {
  -- essentials for navigation
  'christoomey/vim-tmux-navigator',
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/popup.nvim'},

    config = function ()

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    end,
  },
}
