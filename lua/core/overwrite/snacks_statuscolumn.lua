---@class overwrite.statuscolumn
local sc = {}

function sc.overwrite()
  local sn = require("snacks")
  local M = sn.statuscolumn
  function M._get()
    M.setup()
    local config = sn.config.statuscolumn
    local win = vim.g.statusline_winid
    local nu = vim.wo[win].number
    local rnu = vim.wo[win].relativenumber
    local show_signs = vim.v.virtnum == 0 and vim.wo[win].signcolumn ~= "no"
    local show_folds = vim.v.virtnum == 0 and vim.wo[win].foldcolumn ~= "0"
    local buf = vim.api.nvim_win_get_buf(win)
    local left_c = type(config.left) == "function" and config.left(win, buf, vim.v.lnum) or config.left --[[@as snacks.statuscolumn.Component[] ]]
    local right_c = type(config.right) == "function" and config.right(win, buf, vim.v.lnum) or config.right --[[@as snacks.statuscolumn.Component[] ]]

    ---@type snacks.statuscolumn.Wanted
    local wanted = { sign = show_signs }
    for _, c in ipairs(left_c) do
      wanted[c] = wanted[c] ~= false
    end
    for _, c in ipairs(right_c) do
      wanted[c] = wanted[c] ~= false
    end

    local components = { "", "", "" } -- left, middle, right
    if not (show_signs or nu or rnu) then
      return ""
    end

    if (nu or rnu) and vim.v.virtnum == 0 then
      local num ---@type number
      if rnu and nu and vim.v.relnum == 0 then
        num = vim.v.lnum
      elseif rnu then
        num = vim.v.relnum
      else
        num = vim.v.lnum
      end
      components[2] = "%=" .. num .. " "
    end

    if show_signs or show_folds then
      local signs = M.line_signs(win, buf, vim.v.lnum, wanted)

      if #signs > 0 then
        local signs_by_type = {} ---@type table<snacks.statuscolumn.Sign.type,snacks.statuscolumn.Sign>
        for _, s in ipairs(signs) do
          signs_by_type[s.type] = signs_by_type[s.type] or s
        end

        ---@param types snacks.statuscolumn.Sign.type[]
        local function find(types)
          ---@type table<snacks.statuscolumn.Sign.type,snacks.statuscolumn.Sign>
          local sign_types = {}
          for _, t in ipairs(types) do
            if signs_by_type[t] then
              table.insert(sign_types, signs_by_type[t])
            end
          end
          return sign_types
        end

        local left, right = find(left_c), find(right_c)

        local function total_icon(sign_list, pos)
          local text = ""
          if #sign_list == 0 then return "    " end
          if sign_list[1].type ~= pos[1] then
            text = text .. "  " .. M.icon(sign_list[1])
          else
            for i = 1, 2 do
              local s = sign_list[i]
              local icon = s and M.icon(s) or "  "
              text = text .. icon
            end
          end
          -- return #sign_list == 2 and text or text .. "  "
          return text
        end

        -- if config.folds.git_hl then
        --   local git = signs_by_type.git
        --   if git and left and left.type == "fold" then
        --     left.texthl = git.texthl
        --   end
        --   if git and right and right.type == "fold" then
        --     right.texthl = git.texthl
        --   end
        -- end
        -- components[1] = left and M.icon(left) or "  " -- left
        -- components[3] = right and M.icon(right) or "  " -- right
        components[1] = total_icon(left, left_c)
        components[3] = total_icon(right, right_c)
      else
        components[1] = "    "
        components[3] = "    "
      end
    end
    components[1] = vim.b[buf].snacks_statuscolumn_left ~= false and components[1] or ""
    components[3] = vim.b[buf].snacks_statuscolumn_right ~= false and components[3] or ""

    local ret = table.concat(components, "")
    return "%@v:lua.require'snacks.statuscolumn'.click_fold@" .. ret .. "%T"
  end
end

return sc
