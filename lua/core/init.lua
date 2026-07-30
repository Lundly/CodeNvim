_G.Core = require("core.util")

local M = {}
Core.neovim = M

function M.setup()
  local group = vim.api.nvim_create_augroup("CodeNvim", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = function ()
      if not M.load_files.autocmd then
        require("config.autocmd")
        M.load_files.autocmd = true
      end

      require("config.keymaps")
      M.load_files.keymaps = true
      require("config.command")
      M.load_files.command = true

    end
  })

  -- load lazy.nvim
  if not M.load_files.lazy then
    require("config.lazy")
    M.load_files.lazy = true
  end

  -- load colorscheme
  local colorscheme, _ = pcall(vim.cmd.colorscheme, Core.configs.colorscheme)
  if not colorscheme then
    vim.cmd.colorscheme("habamax")
    vim.notify("Load colorscheme failed, use default.", vim.log.levels.ERROR)  -- nvim-notify not load
  end
end

M.is_init = false
M.load_files = {}
function M.init()
  if M.is_init then
    return
  end
  M.is_init = true

  require("config.options")
  M.load_files.options = true

  if vim.fn.argc(-1) ~= 0 then
    require("config.autocmd")
    M.load_files.autocmd = true
  end

  M.setup()
end

return M
