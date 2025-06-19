return {
  -- lsp and completion
  {
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    config = function ()

      local lspconfig = require('lspconfig')
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

      local nvim_lsp = require('lspconfig')
      -- general lsp stuff
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, opts)
      end

      -- python
      nvim_lsp.pyright.setup {
        on_attach = on_attach;
        capabilities = capabilities;
      }

      -- clang
      nvim_lsp.clangd.setup {
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<cr>")
          on_attach(client, bufnr)
        end;
        capabilities = capabilities;
      }

      -- typescript
      nvim_lsp.ts_ls.setup {
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

      -- godot
      nvim_lsp.gdscript.setup {
        on_attach = function(client, bufnr) 
          local port = os.getenv('GDScript_Port') or '6005'
          local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
          local pipe = '/tmp/godot.pipe'

          vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
          on_attach(client, bufnr)
        end;
        capabilities = capabilities;
      }
    end
  },
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin

}
