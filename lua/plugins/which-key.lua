return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    win = {
      height = { min = 4, max = 15 },
    }, spec = {
      {
        mode = { "n", "x" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>c",     group = "code" },
        { "<leader>d",     group = "debug" },
        { "<leader>dp",    group = "profiler" },
        { "<leader>f",     group = "file/find" },
        { "<leader>g",     group = "git" },
        { "<leader>gh",    group = "hunks" },
        { "<leader>l",     group = "lazy" },
        { "<leader>m",     group = "multicursor/minimap" },
        { "<leader>q",     group = "quit/session" },
        { "<leader>s",     group = "search" },
        { "<leader>u",     group = "ui" },
        { "<leader>x",     group = "diagnostics/quickfix" },
        { "[",             group = "prev" },
        { "]",             group = "next" },
        { "g",             group = "goto" },
        { "z",             group = "fold" },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        -- better descriptions
        { "gx", desc = "Open with system app" },
      }
    },
    icons = {
      -- group icon
      group = " +",
      -- icon group define
      rules = {
        { plugin  = "yazi.nvim",            icon = "󰇥 ", color = "Yellow" },
        { plugin  = "multicursor.nvim",     icon = "󰗧",  color = "White" },
        { plugin  = "dropbar.nvim",         icon = " ", color = "Blue" },
        { pattern = "lazy",                 icon = "󰒲 ", color = "purple" },
        { pattern = "multicursor/minimap",  icon = " ", color = "Yellow" },
      }
    }
  },
}
