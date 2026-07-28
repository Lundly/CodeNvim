return {
  {
    "Isrothy/neominimap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    init = function ()
      vim.g.neominimap = {
        auto_enable = true
      }
    end
  }
}
