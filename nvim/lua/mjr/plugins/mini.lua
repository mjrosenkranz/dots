return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      -- don't show the mode we're in twice
      vim.opt.showmode = false
      require('mini.statusline').setup({
        content = {
          -- Content for active window
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location      = MiniStatusline.section_location({ trunc_width = 1000 })
            local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                  strings = { mode } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineSearchInfo', strings = { search } },
              { hl = mode_hl,                  strings = { location } },
            })
          end
          ,
          -- Content for inactive window(s)
          inactive = nil,
        },

        -- Whether to use icons by default
        use_icons = true,

        -- Whether to set Vim's settings for statusline (make it always shown)
        set_vim_settings = true,
      })
    end
  },
}
