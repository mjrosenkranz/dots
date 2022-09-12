local utils = require('utils')

utils.opt('o', 'signcolumn',  "number")
utils.opt('w', 'wrap', true)
utils.opt('w', 'breakindent', true)

-- set hybrid numbers
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'number', true)

-- theme
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'background', 'dark')

vim.g.catppuccin_flavour = "macchiato"
require('catppuccin').setup();

vim.cmd 'colorscheme catppuccin'

-- bar
utils.opt('o', 'showtabline', 2)

-- syntax highlighting
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
}
-- add context stuff at the top

-- cmd to make it so that only the current file has relative
--
--vim.cmd([[
--augroup toggle_number
--    autocmd!
--    autocmd BufEnter, FocusGained, InsertLeave * set relativenumber
--    autocmd BufLeave, FocusLost, InsertEnter   * set norelativenumber
--augroup END
--]])

-- make the gutter bigger
-- utils.opt('g', 'signcolumn', 'yes:2')
utils.opt('g', 'signcolumn', 'number')
