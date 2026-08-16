return {
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    ft = "*",
    -- dependencies = {
    --   "nvim-telescope/telescope-fzf-native.nvim",
    --   build = "make"
    -- },
    keys = function()
      local dropbar_api = require("dropbar.api")
      local key = {
        { "<Leader>;", dropbar_api.pick,                desc = "Pick symbols in winbar" },
        { "[;",        dropbar_api.goto_context_start,  desc = "Go to start of current context" },
        { "];",        dropbar_api.select_next_context, desc = "Select next context" },
      }
      return key
    end,
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
