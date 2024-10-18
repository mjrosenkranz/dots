return {

  -- languages
  {
    'ziglang/zig.vim',
    config = function()
      vim.g.zig_fmt_autosave = 0
    end
  },
  'beyondmarc/hlsl.vim',
  {
    'habamax/vim-godot',
    -- event = "BufEnter *.gd",
    config = function()
      vim.api.nvim_create_autocmd({"FileType"}, {
        pattern = {"gdscript"},
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end
      })

    end,
  }
}
