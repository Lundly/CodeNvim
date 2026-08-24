return {
  {
    "uga-rosa/ccc.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    event = "VeryLazy",
    keys = {
      {"<leader>cp", ":CccPick<CR>", desc = "Creat color code pick" },
    },
    opts = function ()
      local ipt = require("ccc").input
      local ret = {
        -- set up to highlight the color code
        highlighter = {
          auto_enable = true,
          lsp = false,
        },
        -- opts
        empty_point_bg = false,
        bar_len = 50,
        inputs = {
          ipt.hsl,
          ipt.rgb,
          ipt.cmyk,
        },
        alpha_show = "hide",
        point_char = "",
        highlight_mode = "virtual",
        virtual_symbol = "  ",
      }
      return ret
    end,
  }
}
