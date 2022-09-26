return require('packer').startup(function()
  -- packaging
  use 'wbthomason/packer.nvim'

  -- lsp/completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- languages
  use 'ziglang/zig.vim'

  -- git
  use 'tpope/vim-fugitive'
  use 'LnL7/vim-nix'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }


  -- tmux stuff
  use 'christoomey/vim-tmux-navigator'

  -- colors
  use 'morhetz/gruvbox'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- debuggin
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'nvim-telescope/telescope-dap.nvim'

  use 'jpalardy/vim-slime'

  use 'tikhomirov/vim-glsl'
  use 'beyondmarc/hlsl.vim'
end)
