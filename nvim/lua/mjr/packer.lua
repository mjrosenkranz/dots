return require('packer').startup(function()
  -- packaging
  use 'wbthomason/packer.nvim'

  -- git
  use 'tpope/vim-fugitive'

  -- telescope
  use  'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' } }
  }

  use 'ThePrimeagen/harpoon'

  -- tmux stuff
  use 'christoomey/vim-tmux-navigator'

  -- colors
  use 'morhetz/gruvbox'
  use 'ayu-theme/ayu-vim'
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }
  use 'airblade/vim-gitgutter'
  use 'brenoprata10/nvim-highlight-colors'

  -- languages
  use 'ziglang/zig.vim'

  use 'LnL7/vim-nix'

  use 'tikhomirov/vim-glsl'
  use 'beyondmarc/hlsl.vim'

  -- lisp stuff
  -- use 'Olical/conjure'
  use 'guns/vim-sexp'
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- ts
  use(
  'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
  )
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- dired clone
  use {
    "X3eRo0/dired.nvim",
    requires = "MunifTanjim/nui.nvim",
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

end)
