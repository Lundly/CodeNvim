return {
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    event = "VeryLazy",
    -- dependencies = {
    --   "nvim-telescope/telescope-fzf-native.nvim",
    --   build = "make"
    -- },
    keys = {
      { "<Leader>;", function() require("dropbar.api").pick() end, desc = "Pick symbols in winbar" },
      { "[;", function() require("dropbar.api").goto_context_start() end, desc = "Go to start of current context" },
      { "];", function() require("dropbar.api").select_next_context() end, desc = "Select next context" },
    },
    opts = {
      menu = {
        keymaps = {
          ["h"] = "<c-w>q",
          ["l"] = function()
            local menu = require("dropbar.utils.menu").get_current()
            if not menu then
              return
            end
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
            if component then
              menu:click_on(component, nil, 1, 'l')
            end
          end,
        }
      }
    }
  }
}
