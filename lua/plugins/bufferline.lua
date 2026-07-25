return {
  {
    'akinsho/bufferline.nvim',
    ft = "*",
    -- config session will execute when plugin loads
    ---@type fun(plugin, opts: table)
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          separator_style = "thick",
          numbers = "none",
          indicator = {
            icon = "▎",
            style = "underline" -- "icon" | "underline" | "none"
          },
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function (_, _, diag)
            local icons = {
              ERROR = " ",
              WARN = " "
            }
            local sign = ( diag.error and icons.ERROR .. diag.error .. " " or "" )
              .. ( diag.warning and icons.WARN .. diag.warning or "" )
            return  vim.trim(sign)
          end,

          -- neo-tree
          mode = "buffers",
          offsets = {
            {
              filetype = "neo-tree",
              text = "   File Explorer",
              -- highlight = "Directory",
              text_align = "left",
            }
          },
        },
        highlights = {
          -- fill = { bg = "" },
        }
      })
    end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
}
