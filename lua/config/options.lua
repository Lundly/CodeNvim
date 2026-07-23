-- abbreviation
local opt = vim.opt

-- color scheme
vim.cmd.colorscheme "everforest"

-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disabled auto format when open files
vim.g.autoformat = false

-- numbers
opt.number = true
opt.relativenumber = true

-- set true to display invisible char
opt.list = true

-- 0: do not show status line;
-- 1: show status line when mutiple windows exist;
-- 2: always show status line for each windows
-- 3: show a global line at bottom
opt.laststatus = 3

-- indent
local indentWidth = 4
opt.tabstop = indentWidth
opt.shiftwidth = indentWidth
opt.expandtab = true
opt.autoindent = true

-- auto write
opt.autowrite = true

-- clipboard
opt.clipboard = ""

-- scrolloff
opt.scrolloff = 4 -- row
opt.sidescrolloff = 8 -- column

-- wrap
opt.wrap = false
-- spell
opt.spell = false

-- displaycursorline
opt.cursorline = true

-- enable mouse action -> all
opt.mouse:append("a")

opt.smartindent = true

-- split window
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
-- minimum window width
opt.winminwidth = 5

opt.smoothscroll = true

-- confirm when exit
opt.confirm = true
-- persistence history 持久化历史记录
opt.undofile = true
opt.undolevels = 5000

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- fold
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = "" -- 空字符串表示禁用自定义折叠文本

opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- Allow cursor to move where there is no text in visual block mode
opt.virtualedit = "block"

-- ignore case(大小写) and smart distinction
opt.ignorecase = true
opt.smartcase = true

-- terminal true color
opt.termguicolors =true

-- 始终显示符号列（避免文字偏移）
opt.signcolumn = "yes"





