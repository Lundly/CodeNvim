return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "json",
          "lua",
          "python",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        folds = { enable = true },
      })
      -- vim.api.nvim_create_autocmd('FileType', {
      --   pattern = { 'python', 'javascript', 'lua' },
      --   callback = function()
      --     -- syntax highlighting, provided by Neovim
      --     vim.treesitter.start()
      --     -- folds, provided by Neovim
      --     vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      --     vim.wo.foldmethod = 'expr'
      --     -- indentation, provided by nvim-treesitter
      --     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      --   end,
      -- })
    end,
  }
}
