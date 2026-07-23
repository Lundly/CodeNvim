return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  dependencies = { "blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright" },
      handlers = {
        function(server_name)
          if server_name == "lua_ls" then return end
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
      },
    })
  end,
}
