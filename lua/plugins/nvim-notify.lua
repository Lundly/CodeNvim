return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    -- enabled = false,
    opts = {
      icons = {
        DEBUG = " ",
        ERROR = " ",
        INFO = " ",
        TRACE = "✎ ",
        WARN = " "
      },
      stages = "slide",
      level = 0,
      timeout = 3000,
      top_down = false,
      render = "default",
    },
    config = function(_, opts)
      vim.notify = require("notify")
      require("notify").setup(opts)
    end,
  }
}
