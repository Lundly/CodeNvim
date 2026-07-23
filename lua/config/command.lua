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

vim.cmd(":command! Dm :delmarks! ")

