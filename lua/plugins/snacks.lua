-- Terminal Mappings
local function term_nav(dir)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end

return {
  {
    "folke/snacks.nvim",
    -- enabled = false,
    lazy = false,
    priority=1000,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },

      win = {
        -- background drop()
        backdrop = false
      },

      indent = {
        chunk = {
          -- when enabled, scopes will be rendered as chunks, except for the
          -- top-level scope which will be rendered as a scope.
          enabled = true,
          -- only show chunk scopes in the current window
          only_current = false,
          priority = 200,
          hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
          char = {
            -- corner_top = "┌",
            -- corner_bottom = "└",
            corner_top = "╭",
            corner_bottom = "╰",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
        },
      },

      terminal = {
        win = {
          keys = {
            nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
            nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
            nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
            nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
            hide_slash = { "<C-/>", "hide", desc = "Hide Terminal", mode = "t" },
            hide_underscore = { "<c-_>", "hide", desc = "which_key_ignore", mode = "t" },
          },
        },
      },

      statuscolumn = {
        left = { "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold", "git" }, -- priority of signs on the right (high to low)
        folds = {
          open = true, -- show open fold icons
          git_hl = true, -- use Git Signs hl for fold icons
        },
      }

    },

    keys = {
      -- Top Pickers & Explorer
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
      -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
      -- find
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- gh
      { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
      { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
      { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
      -- Grep
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      -- search
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
      { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- Other
      { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },

    config = function (_, opts)
      local sn = require("snacks")
      local sn_dashboard = require("snacks.dashboard")

      -- custom Nvim version
      sn_dashboard.sections.nvim_ver = function ()
        local ver = "NVIM " .. vim.version().build
        return { text = { ver, hl = "Character" }, align = "center" }
      end

      -- custom startup
      sn_dashboard.sections.custom_startup = function()
        local lazy_stats = require("lazy").stats()
        local time = string.format("%.2f", lazy_stats.startuptime):gsub("%.?0+$", "")
        return {
          align = "center",
          text = {
            { " ", hl = "Grey" },
            { lazy_stats.loaded .. "/" .. lazy_stats.count, hl = "Grey" },
            { " plugins loaded. Started in ", hl = "Grey" },
            { time .. "ms", hl = "Grey" },
          },
        }
      end
      sn.setup(opts)

      local overwrite = false
      if overwrite then
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

    end

  }
}
