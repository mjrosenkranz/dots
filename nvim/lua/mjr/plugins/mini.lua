return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      -- a / i text objects
      require('mini.ai').setup()
      -- w and fam past the end of a line
      require('mini.jump').setup()
      require('mini.comment').setup({
        options = {
          ignore_blank_line = true,
        }
      })
      require('mini.cursorword').setup({delay = 400,})
      require('mini.splitjoin').setup()
      require('mini.surround').setup({
        update_n_lines = '',
      })
    end
  },
}
