return {
  {
    "Isrothy/neominimap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    init = function ()
      vim.g.neominimap = {
        auto_enable = true,
        -- minimap style
        layout = "float",-- include "float" | "split", "split" have to quit twice when execute ":q"
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
