return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      {
        "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Buffers (root dir)",
      },
    },
  }
}
