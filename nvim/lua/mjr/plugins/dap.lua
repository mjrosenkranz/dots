return {
  -- dap and keymap
  {
	  'mfussenegger/nvim-dap',
    config = function ()
      local dap = require('dap');
      vim.keymap.set('n', "<leader>db", dap.toggle_breakpoint)
      vim.keymap.set('n', "<leader>dB", function ()
                                          dap.set_breakpoint(
                                            vim.fn.input("Breakpoint condition: ")
                                          )
                                        end)
      vim.keymap.set('n', "<leader>dC", dap.clear_breakpoints)
      vim.keymap.set('n', "<leader>dc", dap.continue)
      vim.keymap.set('n', "<leader>dn", dap.step_over)
      vim.keymap.set('n', "<leader>dj", dap.step_into)
      vim.keymap.set('n', "<leader>dk", dap.step_out)
      vim.keymap.set('n', "<leader>dh", dap.step_back)
      vim.keymap.set('n', "<leader>dL", dap.run_last)
      vim.keymap.set('n', "<leader>dT", dap.terminate)

      require('dap.ext.vscode').load_launchjs()
    end,
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function ()
      require('telescope').load_extension('dap')
      vim.keymap.set('n', "<leader>dl", require('telescope').extensions.dap.list_breakpoints)
    end
  },

  {
    'rcarriga/cmp-dap',
    config = function ()
      require("cmp").setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
              or require("cmp_dap").is_dap_buffer()
        end
      })

      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end
  },

  -- language specific
  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function() 
      -- TODO: make this based on current venv??
      require('dap-python').setup('~/code/slicer/_venv/bin/python')
    end,
  },

  -- ui
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
    config = true,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },

    config = function()
      require("dapui").setup({
        icons = { expanded = "", collapsed = "", current_frame = "" },
        layouts = {
          {
            elements = { {
              id = "scopes",
              size = 0.25
            }, {
              id = "breakpoints",
              size = 0.25
            }, {
              id = "stacks",
              size = 0.25
            }, {
              id = "watches",
              size = 0.25
            } },
            position = "left",
            size = 40
         },
         {
            elements = {
              {
              id = "repl",
              size = 1.0
            },
          },
          position = "bottom",
          size = 10
        }
    },
    })

      local dap, dapui = require("dap"), require("dapui")
      vim.keymap.set('n', "<leader>dt", dapui.toggle)
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  },
}
