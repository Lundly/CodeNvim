if not Core.configs.extra.overwrite then return nil end

---@class Core.overwrite
local overwrite = {}

---@class OverwriteConfig
overwrite.config = {
    snacks_statuscolumn = true
}

---@class OverwriteFn
---@field snacks_statuscolumn overwrite.statuscolumn
overwrite.fn = {}
setmetatable(overwrite.fn, {
    __index = function (t, k)
        if k == "init" then return end
        t[k] = require("core.overwrite." .. k)
        return t[k]
    end
})

return overwrite
