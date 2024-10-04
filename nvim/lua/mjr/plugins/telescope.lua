return {
  -- essentials for navigation
  'christoomey/vim-tmux-navigator',
  'nvim-lua/plenary.nvim',
  'xiyaowong/telescope-emoji.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/popup.nvim'},

    opts = function ()
      local default = {
        theme = "ivy",
      }
      return {
        pickers = {
          find_files = default,
          buffers = default,
          live_grep = default,
        },
      }
    end,

    config = function (_, opts)
      require('telescope').load_extension('emoji')
      local builtin = require('telescope.builtin')

      require('telescope').setup(opts)

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>te', require('telescope').extensions.emoji.emoji, {})

    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('todo-comments').setup({
        signs = false,
        keywords = {
          PRC = { icon = "☝", color = "warning"}
        },
      })
      vim.keymap.set('n', '<leader>ft', ':TodoTelescope<cr>')
    end
  },
}
