return {
  {
    'akinsho/bufferline.nvim',
    ft = "*",
    -- config session will execute when plugin loads
    ---@type fun(plugin, opts: table)
    config = function()
      require("bufferline").setup({
        options = {
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
