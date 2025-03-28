return {
  {
    'tpope/vim-fugitive',
    lazy=false,
  },
  {
    'airblade/vim-gitgutter',
    config = function ()
      vim.g.gitgutter_map_keys = false
    end
  },
}
