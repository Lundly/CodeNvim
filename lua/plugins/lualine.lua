return {
  {
    "nvim-lualine/lualine.nvim",
    -- enabled = false,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enable = true,
          theme = "auto",
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
          component_separators = { left = "", right = ""},
          section_separators = { left = "", right = ""},
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = {
                added = Core.configs.icons.git.Added,
                modified = Core.configs.icons.git.Modified,
                removed = Core.configs.icons.git.Deleted,
              }
            },
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = Core.configs.icons.diagnostics.Error,
                warn  = Core.configs.icons.diagnostics.Warn,
                info  = Core.configs.icons.diagnostics.Info,
                hint  = Core.configs.icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            "filename",
          },
          lualine_x = {
             {
              -- showcmd
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            },
            "encoding",
            function()
              return "Indent " .. vim.bo.shiftwidth
            end,
          },
          lualine_y = {
            { "progress", separator = "" , padding = { left = 1, right = 0 } },
            "location",
          },
          lualine_z = {
            -- current time
            function()
              return " " .. os.date("%R")
            end,
          }
        },
        extensions = { "neo-tree", "fzf", "lazy" },
      })
    end
  }
}
