return {
  -- essentials for navigation
  'christoomey/vim-tmux-navigator',
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/popup.nvim'},
  },

  -- git 
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
  'airblade/vim-gitgutter',

  -- colors
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  'brenoprata10/nvim-highlight-colors',

  -- languages
  'ziglang/zig.vim',
  'beyondmarc/hlsl.vim',

  -- lsp and completion
  'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin

  -- treesitter
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'nvim-treesitter/nvim-treesitter-context',
}
