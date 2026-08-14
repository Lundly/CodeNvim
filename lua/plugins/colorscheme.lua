return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- configurations with everforest below
      vim.g.everforest_background = "medium"
      vim.g.everforest_diagnostic_virtual_text = 'colored'
      -- vim.g.everforest_transparent_background = 2
      vim.g.everforest_diagnostic_text_highlight = 1
      vim.g.everforest_current_word = "high contrast background"
      vim.g.everforest_enable_italic = 1
      -- 当切换到 everforest 主题时，自动设置当前行号颜色
      vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "everforest",
          callback = function()
              vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E69875", bold = true })
          end,
      })
    end
  },

}

