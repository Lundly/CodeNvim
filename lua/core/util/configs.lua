---@class Core.util.configs
---@field colorscheme string
-- -@field extra extratoggle
local configs = {}

configs.icons = {
  diagnostics = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
  },
  git = {
    Added     = " ",
    Conflict  = " ",
    Deleted   = " ",
    Ignored   = " ",
    Modified  = " ",
    Staged    = "󱓳 ",
    Unstaged  = "U ",
    Untracked = " ",
  },
  kinds = {
    Class         = " ",
    Color         = "󰏘 ",
    Constant      = "󰏿 ",
    Constructor   = "󰊕",
    Enum          = " ",
    EnumMember    = " ",
    Event         = " ",
    Field         = "󰽏 ",
    File          = "󰈔 ",
    Folder        = "󰉋 ",
    FolderOpen    = "󰝰 ",
    Function      = "󰊕 ",
    Interface     = " ",
    Keyword       = " ",
    Method        = "󰊕 ",
    Module        = " ",
    Operator      = " ",
    Property      = "󰜢 ",
    Reference     = " ",
    Snippet       = "󱄽 ",
    Struct        = "󰙅 ",
    Text          = "󰉿 ",
    TypeParameter = " ",
    Unit          = " ",
    Value         = "󰎠 ",
    Variable      = "󰂡 ",
  },
  shape = {
    Circle   = " ",
    Square   = " ",
    Triangle = "󰔶 ",
    Pentagon = "󰜁 ",
    Hexagon  = " ",
  },
  debug = {
    Breakpoint = " ",
    Bug        = " ",
    Start      = " ",
    Stop       = " ",
    Stackframe = " ",
    Restart    = " ",
    Pause      = " ",
    Stepback   = " ",
    Stpeinto   = " ",
    Stepout    = " ",
    Stepover   = " ",
  },
  point = {
    Large        = " ",
    Big          = "",
    Medium       = "󰧞",
    Small        = "",
    Minial       = "󰧟",
    Dot          = " ",
    Dots         = "󰇘 ",
    DotsVertical = "󰇙 ",
  }
}

---@class extratoggle
configs.extra = {
  overwrite = true
}

return configs
