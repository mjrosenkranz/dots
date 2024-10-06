vim.opt.showmode = false
vim.opt.showcmd = false

require('mini.statusline').setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
      local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })

      local full_search = function ()
        if vim.v.hlsearch == 0 then return '' end
        -- `searchcount()` can return errors because it is evaluated very often in
        -- statusline. For example, when typing `/` followed by `\(`, it gives E54.
        local ok, result = pcall(vim.fn.searchcount, { maxcount=-1, recompute = true })
        if not ok or result.current == nil or result.total == 0 then return '' end

        if result.incomplete == 1 then return '?/?' end

        local too_many = '>' .. result.maxcount
        local current = result.current > result.maxcount and too_many or result.current
        local total = result.total > result.maxcount and too_many or result.total
        return result.current .. '/' .. result.total
      end

      local visual = function ()


        local output = ""

        local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

        if vim.fn.mode() == 'V' or vim.fn.mode() == CTRL_V then
          local starts = vim.fn.line('v')
          local ends = vim.fn.line('.')
          local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
          output = output .. tostring(lines)
        end

        if vim.fn.mode() == CTRL_V then
          local starts = vim.fn.col('v')
          local ends = vim.fn.col('.')
          local cols = starts <= ends and ends - starts + 1 or starts - ends + 1
          output =  output .. "x" .. cols
        end

        return output
      end

      -- vim.api.statusline

      return MiniStatusline.combine_groups({
        { hl = 'Statusline',                  strings = { mode } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineSearchInfo', strings = { full_search() } },
        { hl = 'MiniStatuslineModeVisual',               strings = { visual() } },
        -- location
        { hl = 'Statusline',               strings = { '%l,%v' } },
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
