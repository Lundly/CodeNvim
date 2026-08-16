return {
  {
    "Isrothy/neominimap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>mt", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
      { "<leader>mf", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
      { "<leader>mw", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
    },
    init = function ()
      local mw = 20
      vim.g.neominimap = {
        auto_enable = true,
        -- minimap style
        layout = "float",
        split = {
          minimap_width = mw,
          fix_width = false,
          close_if_last_window = true,
          direction = "right",
        },
        float = {
          minimap_width = mw,
          max_minimap_height = nil,
        },
        -- cursor action
        click = {
          enabled = true
        },
        -- mark sign
        mark = {
          enabled = true
        },
        diagnostic = {
          enabled =  true,
          mode = "icon", ---@type string include "line" | "sign" | "icon"
          priority = {
            ERROR = 100, ---@type integer
            WARN  = 90, ---@type integer
            INFO  = 80, ---@type integer
            HINT  = 70, ---@type integer
          },
          icon = {
            ERROR = "▎", ---@type string
            WARN  = "▎", ---@type string
            INFO  = "▎", ---@type string
            HINT  = "▎", ---@type string
          },
        },
        curren_line_pistion = "center",
      }
    end
  }
}
