return {
  "neovim/nvim-lspconfig",
  -- event = "VeryLazy",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
    { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
    { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
    { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
    { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
    { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help" },
    { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "x" } },
    { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "x" } },
    { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode ={"n"} },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
    { "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, desc = "Next Reference" },
    { "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end, desc = "Prev Reference" },
    -- { "<leader>cA", LazyVim.lsp.action.source, desc = "Source Action", has = "codeAction" },
    -- {
    --   "<leader>co",
    --   LazyVim.lsp.action["source.organizeImports"],
    --   desc = "Organize Imports",
    --   has = "codeAction",
    --   enabled = function(buf)
    --     local code_actions = vim.tbl_filter(function(action)
    --       return action:find("^source%.organizeImports%.?$")
    --     end, LazyVim.lsp.code_actions({ bufnr = buf }))
    --     return #code_actions > 0
    --   end
    -- },
  },
  opts = {
    diagnostics = {
      virtual_text = {
        spacing = 4,
        source = true,
        prefix = "●",
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    },
    inlay_hints = {
      enabled = true,
      exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
    },
    codelens = {
      enabled = false,
    },
    folds = {
      enabled = true,
    },
    servers = {
      ["*"] = {
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        -- stylua: ignore
      },
    }
  },
  config = function (_, opts)
    -- vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    -- inlay_hints
    if opts.inlay_hints.enabled then
      Snacks.util.lsp.on({ method = "textDocument/inlayHint" }, function(buffer)
        if
          vim.api.nvim_buf_is_valid(buffer)
          and vim.bo[buffer].buftype == ""
          and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
        then
          vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
        end
      end)
    end

    if opts.servers["*"] then
      vim.lsp.config("*", opts.servers["*"])
    end


  end
}
