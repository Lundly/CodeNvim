return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Neovim Dashboard by snacks
      dashboard = {
        -- enabled = false,
        width = 80, ---@type number nil for center
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
          { text = { "" } },
          { section = "header" },
          { text = { "NVIM v0.12.4", hl = "Character" }, align = "center" },
          { text = { "" } },
          {
            {
              text = {
                { "[ Find File<f>]", hl = "MoreMsg", width = 20, align = "right" },
                { "[ New File<n>]", hl = "Title", width = 23, align = "center" },
                { "[󰚰 Restore Session<s>]", hl = "DiagnosticSignInfo", width = 20, align = "left" },
              },
              align = "center",
            }
          },
          { text = { "" } },
          { section = "startup" },
          { text = { "" } },
          { text = { "", hl = "CursorLineNr" }, align = "center" },
          { section = "recent_files", title = "󰑓 Recent Files (r)", indent = 2, padding = 1 },
          {
            { text = "", action = ":lua Snacks.dashboard.pick('files')", key = "f" },
            { text = "", action = ":ene | startinsert", key = "n" },
            { text = "", action = ":lua require('persistence').load({ last = true })", key = "s" },
            { text = "", action = ":qa", key = "q" },
          },
          { text = { "" } },
          { text = { "Welcome Back! Press q to quit.", hl = "Comment" }, align = "center" },
        }
      },
    },
    -- config = function (_, opts)
    --   vim.api.nvim_set_hl(0, "DashboardLine", { fg = "#34a3f3" })
    -- end
  },
}
