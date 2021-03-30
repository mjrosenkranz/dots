----------------
-- system
----------------
vim.o.clipboard   = "unnamedplus"
vim.o.mouse       = "a"
vim.o.swapfile    = false
vim.o.hidden      = true
----------------
--  keymap
----------------
vim.g.mapleader   = ","

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'k',          'gk',                                    opts)
vim.api.nvim_set_keymap('n', 'j',          'gj',                                    opts)
vim.api.nvim_set_keymap('n', '<leader>s',  ':luafile ~/.config/nvim/init.lua<cr>',  opts)
vim.api.nvim_set_keymap('n', '<leader>r',  ':tabe ~/.config/nvim/init.lua<cr>',     opts)
vim.api.nvim_set_keymap('n', '<leader>p',  ':silent exec "!pdflatex %"<cr>',        opts)
vim.api.nvim_set_keymap('n', '<leader>n',  ':noh <cr>',                             opts)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>',         opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>',          opts)
vim.api.nvim_set_keymap('n', '<leader>b',  '<cmd>Telescope live_grep<cr>',          opts)
vim.api.nvim_set_keymap('n', '<leader>h',  '<cmd>Telescope help_tags<cr>',          opts)
----------------
--  edit
----------------
vim.o.ignorecase  = true
vim.o.infercase   = true
vim.o.smartcase   = true

vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
-- vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
----------------
-- plugins
----------------
require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use 'junegunn/goyo.vim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'wlangstroth/vim-racket'
  use 'ziglang/zig.vim'

end)
----------------
-- ui
----------------
vim.cmd ('colorscheme color')
vim.bo.syntax       = "on"
vim.wo.number       = true
vim.o.signcolumn    = "number"
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.o.expandtab    = true
vim.o.autoindent   = true
vim.o.copyindent   = true
vim.wo.wrap         = false
--  netrw
vim.g.netrw_liststyle     = 3
vim.g.netrw_banner        = 0
vim.g.netrw_browse_split  = 0
vim.g.netrw_winsize       = 20
-- statusline

--vim.o.laststatus=2
local statusline = ""
statusline      = statusline.."%f "
statusline      = statusline.."%m"
statusline      = statusline.."%="
--local filetype = api.nvim_buf_get_option(0, 'filetype')
--statusline      = statusline..
statusline      = statusline.."%{&ff} "
vim.o.statusline = statusline

-- tabline
vim.o.showtabline=2
----------------
-- misc
----------------
-- lsp
----------------
vim.o.completeopt="menuone,noinsert,noselect"
--vim.g.completion_matching_strategry_list = ['exact', 'substring', 'fuzzy']
local nvim_lsp = require('lspconfig')
-- general lsp stuff
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- completion
  require'completion'.on_attach()

  -- Mappings.
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    augroup lsp_document_highlight
    autocmd!
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

-- c#
nvim_lsp.omnisharp.setup {
  cmd = {
    "/home/xenone/docs/code/omnisharp-linux-x86/run",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid())
  };
  on_attach = on_attach;
}

-- c/c++
nvim_lsp.clangd.setup {
  on_attach = on_attach;
}

-- zig
nvim_lsp.zls.setup {
  on_attach = on_attach;
}

-- racket
nvim_lsp.racket_langserver.setup {
  on_attach = on_attach;
}
