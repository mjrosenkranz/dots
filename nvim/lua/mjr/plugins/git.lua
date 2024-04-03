return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  'tpope/vim-fugitive',
  {
    'sindrets/diffview.nvim',
    opts = {
        use_icons = false, 
        icons = {
          folder_closed = "📂",
          folder_open = "📁",
        },
        signs = {
          fold_closed = ">",
          fold_open = "_",
          done = "✓",
        },
      },
  },
  {
    'airblade/vim-gitgutter',
    config = function ()
      vim.g.gitgutter_map_keys = false
    end
  },
}
