return {
  {
    'nvim-lualine/lualine.nvim',
    -- enabled = false,
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enable = true,
          theme = "auto",
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = {
            'mode'
          },
          lualine_b = {
            'branch', 'diff'
          },
          lualine_c = {
            {
              "diagnostics",
              -- symbols = {
              --   error = icons.diagnostics.Error,
              --   warn = icons.diagnostics.Warn,
              --   info = icons.diagnostics.Info,
              --   hint = icons.diagnostics.Hint,
              -- },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            "filename",
          },
          lualine_x = {
            'encoding',
            function()
              return "Indent " .. vim.bo.shiftwidth
            end,
          },
          lualine_y = {
            { "progress", separator = "" , padding = { left = 1, right = 0 } },
            'location',
          },
          lualine_z = {
            -- current time
            function()
              return " " .. os.date("%R")
            end,
          }
        },
      })
    end
  }
}
