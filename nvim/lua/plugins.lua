return require('packer').startup(function()
	-- packaging
	use 'wbthomason/packer.nvim'

	-- lsp/completion
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
	use 'nvim-treesitter/nvim-treesitter'

	-- languages
	use 'ziglang/zig.vim'

    -- git
    use 'tpope/vim-fugitive'
	
	-- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

	-- tmux stuff
	use 'christoomey/vim-tmux-navigator'

    -- duh
	use 'morhetz/gruvbox'

    -- debuggin
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'nvim-telescope/telescope-dap.nvim'
end)
