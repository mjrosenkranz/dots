return {
  -- lsp and completion
  {
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    config = function ()


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
        virtual_text = {
          severity = {
            max = vim.diagnostic.severity.WARN,
          },
        },
        -- virtual_lines = {
        --   severity = {
        --     min = vim.diagnostic.severity.ERROR,
        --   },
        -- },
        jump = {
          float = true,
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('mjr.lsp', {}),
        callback = function(args)

          local bufnr = args.buf

          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

          buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, opts)

          vim.keymap.set("n", "<leader>h", ":LspClangdSwitchSourceHeader<cr>")
        end
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities;
      })
      vim.lsp.enable("pyright")

      -- clang
      vim.lsp.config("clangd", {
        capabilities = capabilities;
      })
      vim.lsp.enable("clangd")

      -- typescript
      vim.lsp.config("ts_ls", {
        capabilities = capabilities;
      })
      vim.lsp.enable("ts_ls")

      -- rust
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities;
      })
      vim.lsp.enable("rust_analyzer")

      -- zig
      vim.lsp.config("zls", {
        capabilities = capabilities;
      })
      vim.lsp.enable("zls")

    end
  },
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin

}
