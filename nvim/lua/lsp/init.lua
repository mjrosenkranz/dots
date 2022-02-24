local utils = require('utils')
local nvim_lsp = require('lspconfig')
-- general lsp stuff
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  utils.map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  utils.map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  utils.map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  utils.map('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  utils.map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  utils.map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  utils.map('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  utils.map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  utils.map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  utils.map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    utils.map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    utils.map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
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

-- python
nvim_lsp.pyright.setup {
  on_attach = on_attach;
}

-- clang
nvim_lsp.clangd.setup {
  on_attach = on_attach;
}

-- ocamllsp
nvim_lsp.ocamllsp.setup {
  on_attach = on_attach;
}

-- typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach;
}

-- zig
nvim_lsp.zls.setup {
  on_attach = on_attach;
}
vim.g.zig_fmt_autosave = 1;
