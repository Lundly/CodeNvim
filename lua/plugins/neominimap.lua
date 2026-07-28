return {
  {
    "Isrothy/neominimap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    init = function ()
      vim.g.neominimap = {
        auto_enable = true,
        layout = "float",
        click = {
          enabled = true
        },
        mark = {
          enabled = true
        },
      }
    end
  }
}
