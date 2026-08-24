---@class Core
---@field neovim Core.neovim
---@field overwrite Core.overwrite
---@field configs Core.util.configs
local M = {}

M.configs = require("core.util.configs")

setmetatable(M, {
  __index = function (t, k)
    if k == "init" then return end
    t[k] = require("core.util." .. k)
    return t[k]
  end
})

-- neovim

---@class Core.neovim
---@field load_files neovim.load_files
local neovim = {}
M.neovim = neovim

---@class neovim.load_files
neovim.load_files = {}
neovim.is_init = false

-- [TODO] 加载配置模块
function neovim.startup()
  local group = vim.api.nvim_create_augroup("CodeNvim", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = function ()
      if not neovim.load_files.autocmd then
        require("config.autocmd")
        neovim.load_files.autocmd = true
      end

      require("config.keymaps")
      neovim.load_files.keymaps = true
      require("config.command")
      neovim.load_files.command = true

    end
  })

  -- load lazy.nvim
  if not neovim.load_files.lazy then
    require("config.lazy")
    neovim.load_files.lazy = true
  end

  -- load colorscheme
  local colorscheme, _ = pcall(vim.cmd.colorscheme, Core.configs.colorscheme)
  if not colorscheme then
    vim.cmd.colorscheme("habamax")
    vim.notify("Load colorscheme failed, use default.", vim.log.levels.ERROR)  -- nvim-notify not load
  end
end

function neovim.init()
  if neovim.is_init then
    return
  end
  neovim.is_init = true

  require("config.options")
  neovim.load_files.options = true

  if vim.fn.argc(-1) ~= 0 then
    require("config.autocmd")
    neovim.load_files.autocmd = true
  end

  neovim.startup()
end

return M
