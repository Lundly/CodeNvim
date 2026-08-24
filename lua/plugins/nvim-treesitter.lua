return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts = {
    -- 默认安装的语言集合
    ensure_installed = {
      "bash", "c", "diff", "html", "javascript", "json",
      "lua", "luadoc", "markdown", "python", "query",
      "regex", "toml", "typescript", "vim", "vimdoc", "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
    folds = { enable = true },
  },
  config = function(_, opts)
    local TS = require("nvim-treesitter")
    TS.setup(opts)

    local function have(lang)
      return vim.tbl_contains(
        require("nvim-treesitter.config").get_installed("parsers"), lang
      )
    end

    -- 自动安装语言解析器
    local install = vim.tbl_filter(function(lang)
      return not have(lang)
    end, opts.ensure_installed or {})
    if #install > 0 then
      vim.schedule(function()
        TS.install(install, { summary = true })
      end)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_features", { clear = true }),
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match)
        if not lang or not have(lang) then
          return
        end
        -- highlight: attach on first interaction so the parser load
        -- doesn't block startup and the first screen update
        if opts.highlight.enable ~= false then
          vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
            buffer = ev.buf,
            once = true,
            callback = function()
              if vim.api.nvim_buf_is_valid(ev.buf) then
                pcall(vim.treesitter.start, ev.buf)
              end
            end,
          })
        end
        -- indent
        if opts.indent.enable ~= false then
          vim.bo[ev.buf].indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
        end
        -- folds
        if opts.folds.enable ~= false then
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end
      end,
    })
  end,
}
