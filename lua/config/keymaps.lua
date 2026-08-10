-- ======= keymap ========

local key = vim.keymap.set

-- goto head of line or end of line
key( { "n", "v", "o" }, "gl", "$", { desc = "Goto end of line" } )
key( { "n", "v", "o" }, "gh", "^", { desc = "Goto head of line" } )

-- scroll speed
key( "n", "<C-u>", "10k" )
key( "n", "<C-d>", "10j" )

-- better cursor movement
key({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'",      { desc = "Down", expr = true, silent = true })
key({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
key({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'",      { desc = "Up", expr = true, silent = true })
key({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'",   { desc = "Up", expr = true, silent = true })

-- move line
key("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==",                   { desc = "Move Down" })
key("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",             { desc = "Move Up" })
key("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi",                                   { desc = "Move Down" })
key("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi",                                   { desc = "Move Up" })
key("v", "<A-j>", "<cmd><C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",       { desc = "Move Down" })
key("v", "<A-k>", "<cmd><C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- better indent
key("x", "<", "<gv")
key("x", ">", ">gv")


-- Move to window using the <ctrl> hjkl keys
key("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
key("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
key("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
key("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
key("n", "<C-Up>",    "<cmd>resize +2<cr>",             { desc = "Increase Window Height" })
key("n", "<C-Down>",  "<cmd>resize -2<cr>",             { desc = "Decrease Window Height" })
key("n", "<C-Left>",  "<cmd>vertical resize -2<cr>",    { desc = "Decrease Window Width" })
key("n", "<C-Right>", "<cmd>vertical resize +2<cr>",    { desc = "Increase Window Width" })

-- buffers
key("n", "<S-h>",      "<cmd>bprevious<cr>",          { desc = "Prev Buffer" })
key("n", "<S-l>",      "<cmd>bnext<cr>",              { desc = "Next Buffer" })
key("n", "<leader>bD", "<cmd>:bd<cr>",                { desc = "Delete Buffer and Window" })
key("n", "<PageUp>",   "<cmd>BufferLineMovePrev<CR>", { desc = "Buffer line move prev" } )
key("n", "<PageDown>", "<cmd>BufferLineMoveNext<CR>", { desc = "Buffer line move next" } )

-- Clear search on escape
key({ "i", "n", "s" }, "<esc>", function() vim.cmd("noh") return "<esc>" end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Lazy.nvim UI
key("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
key("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
key("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
key("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
key("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
key("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
key("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
key("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
key("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- windows
key("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
key("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
key("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- tabs
key("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
key("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
key("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
key("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
key("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
key("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
key("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- =====================================================================









