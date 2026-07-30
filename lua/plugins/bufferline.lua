return {
  {
    'akinsho/bufferline.nvim',
    ft = "*",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<PageUp>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "<PageDown>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
    },
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
