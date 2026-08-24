return {
  {
    "Saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v1",
    -- if version is v2, it needs "blink.lib"
    -- dependencies = {
    --   'saghen/blink.lib',
    -- },
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = {
        preset = "super-tab"
      },

      completion = {
        keyword = {
          range = "full",
        },
        accept = {
          auto_brackets = { enabled = false },
        },
        documentation = {
          window = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpKindText,FloatBorder:Grey,EndOfBuffer:BlinkCmpMenuSelection,BlinkCmpDocSeparator:Grey",
          scrollbar = false,
          },
          auto_show = true,
        },
        menu = {
          border = "rounded",
          auto_show = true,
          winhighlight = "Normal:BlinkCmpKindText,FloatBorder:Grey,CursorLine:BlinkCmpMenuSelection,Search:None",
          scrollbar = false,
          -- menu style
          draw = {
            columns = {
              { "kind_icon" },
              { "separator" },
              { "label", "label_description", gap = 1 },
            },
            -- 组件
            components = {
              separator = {
                text = function()
                  return ""
                end,
                highlight = "Comment",
              }
            },
            treesitter = { enabled = true },
          },
        },
      },

      cmdline = {
        completion = {
          menu = { auto_show = true }
        },
        keymap = {
          preset = "super-tab"
        }
      },

      snippets = { preset = "luasnip" },

      -- (Default) list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = { default = { "lsp", "path", "snippets", "buffer", } },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"`
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "rust" }
    },
  }
}
