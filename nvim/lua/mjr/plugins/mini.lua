return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      -- a / i text objects
      require('mini.ai').setup()
      -- w and fam past the end of a line
      require('mini.jump').setup()
      require('mini.comment').setup()
      require('mini.cursorword').setup({delay = 1000,})
      require('mini.splitjoin').setup()
      require('mini.surround').setup()
    end
  },
}
