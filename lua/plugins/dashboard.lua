return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        ---@type boolean dashboard toggle
        enabled = true,

        width = 80, ---@type number width of dashboard
        row = nil, ---@type number nil for center
        col = nil, ---@type number nil for center
        preset = {
          header = [[
 ______           __         _______         __           
|      |.-----.--|  |.-----.|    |  |.--.--.|__|.--------.
|   ---||  _  |  _  ||  -__||       ||  |  ||  ||        |
|______||_____|_____||_____||__|____| \___/ |__||__|__|__|]],
        },

        sections = {
          { text = "", padding = 10 },
          { section = "header" },
          { section = "nvim_ver", padding = 1 },
          {
            {
              text = {
                { "[  Find File<f> ]", hl = "MoreMsg", width = 20, align = "right" },
                { "[ 󰚰 Restore Session<s> ]", hl = "DiagnosticSignInfo", width = 26, align = "center" },
                { "[ 󰻭 New File<n> ]", hl = "Title", width = 20, align = "left" },
              },
              align = "center",
              padding = 2,
            }
          },
          { text = { string.rep("", 82), hl = "LineNr" } },
          { section = "recent_files", title = " Recent Files<r>", indent = 2 },
          {
            { text = "", action = ":lua Snacks.dashboard.pick('files')", key = "f" },
            { text = "", action = ":ene | startinsert", key = "n" },
            { text = "", action = ":lua require('persistence').load({ last = true })", key = "s" },
            { text = "", action = ":lua Snacks.dashboard.pick('oldfiles')", key = "r" },
            { text = "", action = ":qa", key = "q" },
          },
          { text = { "Welcome Back! Press q to quit.", hl = "Comment" }, align = "center" },
          { section = "custom_startup", padding = 1 },
        }
      }
    },
    config = function (_, opts)
      opts = opts or {}
      local sn = require("snacks")

      -- cusom section
      local sn_dashboard = require("snacks").dashboard

      -- custom Nvim version
      sn_dashboard.sections.nvim_ver = function ()
        local ver = "NVIM " .. vim.version().build
        return { text = { ver, hl = "Character" }, align = "center" }
      end

      -- custom startup
      sn_dashboard.sections.custom_startup = function()
        local lazy_stats = require("lazy").stats()
        local time = string.format("%.2f", lazy_stats.startuptime):gsub("%.?0+$", "")
        return {
          align = "center",
          text = {
            { " ", hl = "Grey" },
            { lazy_stats.loaded .. "/" .. lazy_stats.count, hl = "Grey" },
            { " plugins loaded. Started in ", hl = "Grey" },
            { time .. "ms", hl = "Grey" },
          },
        }
      end

      sn.setup(opts)
    end
  },
}
