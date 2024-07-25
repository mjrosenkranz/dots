return {
  'tpope/vim-fugitive',
  {
    'airblade/vim-gitgutter',
    config = function ()
      vim.g.gitgutter_map_keys = false
    end
  },
}
