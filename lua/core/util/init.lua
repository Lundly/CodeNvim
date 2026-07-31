---@class Core
---@field neovim Core.startup
---@field configs Core.configs
local M = {}

M.configs = require("core.util.configs")

setmetatable(M, {
  __index = function (m, key)
    m[key] = require("core.util." .. key)
    return m[key]
  end
})

return M
