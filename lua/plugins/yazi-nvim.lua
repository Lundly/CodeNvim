return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>y", "<cmd>Yazi<cr>"    , desc = "Open Yazi (root dir)" },
      { "<leader>Y", "<cmd>Yazi cwd<cr>", desc = "Open Yazi (cwd)" },
    }
  },
}
