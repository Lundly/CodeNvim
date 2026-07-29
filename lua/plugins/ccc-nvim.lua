return {
  {
    "uga-rosa/ccc.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {"<leader>cp", ":CccPick<CR>", desc = "Creat color code pick" },
    },
    config = function()
      local ccc = require("ccc")
      ccc.setup({
        -- set up to highlight the color code
        highlighter = {
          auto_enable = true,
          lsp = false,
        },
        -- opts
        empty_point_bg = false,
        bar_len = 50,
        inputs = {
          ccc.input.hsl,
          ccc.input.rgb,
          ccc.input.cmyk,
        },
        alpha_show = "hide",
        point_char = "",
        highlight_mode = "virtual",
        virtual_symbol = "  ",
      })
    end,
  }
}
