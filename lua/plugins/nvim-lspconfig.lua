return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  keys = {
    { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "x" } },
    { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
  },
}
