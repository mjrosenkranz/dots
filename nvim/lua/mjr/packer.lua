return require('packer').startup(function()
  -- packaging
  use 'wbthomason/packer.nvim'

  -- git
  use 'tpope/vim-fugitive'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
  }


  -- tmux stuff
  use 'christoomey/vim-tmux-navigator'

  -- colors
  use 'morhetz/gruvbox'
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }

  -- languages
  use 'ziglang/zig.vim'

  use 'tikhomirov/vim-glsl'
  use 'beyondmarc/hlsl.vim'

  -- lisp stuff
  use 'Olical/conjure'
  use 'guns/vim-sexp'
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'


  -- lsp/completion
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- ts
  use(
    'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
  )
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'


end)
