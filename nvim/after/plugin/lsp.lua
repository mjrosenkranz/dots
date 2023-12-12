local lspconfig = require('lspconfig')
local navic = require('nvim-navic')

navic.setup {
  lsp = {
    auto_attach = true,
    preference = nil,
  },
  highlight = false,
  separator = " > ",
  depth_limit = 5,
  depth_limit_indicator = "..",
  safe_output = true,
  lazy_update_context = false,
  click = false,
  format_text = function(text)
    return text
  end,
}

--
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

vim.diagnostic.config({
  signs = true,
  virtual_text = false,
})

local nvim_lsp = require('lspconfig')
-- general lsp stuff
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- utils.map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  -- utils.map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  -- utils.map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  -- utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- utils.map('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  -- utils.map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  -- utils.map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- utils.map('n', '<leader>rr', '<cmd>lua vim.lsp.buf.references()<CR>')
  -- utils.map('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  -- utils.map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  -- utils.map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  -- utils.map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')


  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)


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

  navic.attach(client, bufnr)
end

-- python
nvim_lsp.pyright.setup {
  on_attach = on_attach;
  capabilities = capabilities;
}

-- clang
nvim_lsp.clangd.setup {
  on_attach = on_attach;
  capabilities = capabilities;
}

-- typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach;
  capabilities = capabilities;
}

-- rust
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach;
  capabilities = capabilities;
}

-- zig
nvim_lsp.zls.setup {
  on_attach = on_attach;
  capabilities = capabilities;
}
