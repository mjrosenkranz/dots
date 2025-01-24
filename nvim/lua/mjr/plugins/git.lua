return {
  {
    'tpope/vim-fugitive',
    config = function ()
    vim.api.nvim_create_autocmd({"FileType"}, {
        pattern = {"gitcommit"},
        callback = function()
          vim.opt_local.spell = true
        end
    })
    end
  },
  {
    'airblade/vim-gitgutter',
    config = function ()
      vim.g.gitgutter_map_keys = false
    end
  },
}
