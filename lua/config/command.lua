-- This file will be loade by config.lazy
--
-- Add any custom command here with:
-- vim.api.nvim_create_user_command()
-- Parameter -> (name: string, command: string|fun(args), opt)
-- Attention: CmdName must start whih a capital letter!!! -> A.B.C.D
--
-- vim.cmd(":command! name_of_command cmd_detail") also work well
--

-- set shift and tab width
vim.api.nvim_create_user_command("SetIndent", function(opts)
  local size = opts.args == "" and 2 or tonumber(opts.args)
  vim.bo.shiftwidth, vim.bo.tabstop = size, size
  print(string.format("set shift width -> %s; tab width -> %s", size, size))
end, { nargs = "?" })

-- delete all marks
vim.cmd(":command! Dm :delmarks! ")
-- dashboard
vim.cmd(":command! Dashboard :lua Snacks.dashboard()")

-- toggle inlay hints
vim.api.nvim_create_user_command("ToggleInlayHints", function (opts)
  local global = opts.bang and true or false
  if global then
    local inlay_hints = Core.configs.lsp.inlay_hints.enabled
    vim.lsp.inlay_hint.enable(not inlay_hints)
    Core.configs.lsp.inlay_hints.enabled = not inlay_hints
  else
    local inlay_hints_bufnr = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    vim.lsp.inlay_hint.enable(not inlay_hints_bufnr, { bufnr = 0 })
  end
end, { desc = "Toggle inlay hints", bang = true })

-- toggle color code hilight_mode
vim.api.nvim_create_user_command(
  "ToggleColorCodeHl",
  function (opts)
    local hl_mode = { "bg", "fg", "virtual", "background", "foreground" }
    local args = opts.args
    if not vim.tbl_contains(hl_mode, args) then
      vim.notify("Unknown command: " .. args, "error")
    else
      require("ccc.config").options.highlight_mode = args
      vim.cmd("do ColorScheme")
      vim.notify("Color code highlight_mode: " .. args)
    end
  end,
  {
    nargs = 1,
    complete = function ()
      return { "bg", "fg", "virtual", "background", "foreground" }
    end
  }
)
