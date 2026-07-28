return {
  {
    "rafamadriz/friendly-snippets",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "L3MON4D3/LuaSnip",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  }
}
