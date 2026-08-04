return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      {
        "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Buffers (root dir)",
      },
    },
    opts = {
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          {
            source = "filesystem",
            display_name = " 󰉓 Files "
          },
          {
            source = "buffers",
            display_name = " 󰈚 Buffers "
          },
          {
            source = "git_status",
            display_name = " 󰊢 Git "
          },
        },
        separator = { left = "▏", right= "▕" },
        separator_active = { left = "┃" },
        show_separator_on_edge = true,
      },
      filesystem = {
        filtered_items = {
          visible = true
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- change type
            added     = Core.configs.icons.git.Added,
            deleted   = Core.configs.icons.git.Deleted,
            modified  = Core.configs.icons.git.Modified,
            -- Status type
            untracked = Core.configs.icons.git.Untracked,
            ignored   = Core.configs.icons.git.Ignored,
            unstaged  = Core.configs.icons.git.Unstaged,
            staged    = Core.configs.icons.git.Staged,
            conflict  = Core.configs.icons.git.Conflict,
          }
        },
        diagnostics = {
          symbols = {
            error = Core.configs.icons.diagnostics.Error,
            warn  = Core.configs.icons.diagnostics.Warn,
            hint  = Core.configs.icons.diagnostics.Hint,
            info  = Core.configs.icons.diagnostics.Info,
          },
          highlights = {
            error = "DiagnosticSignError",
            warn  = "DiagnosticSignWarn",
            hint  = "DiagnosticSignHint",
            info  = "DiagnosticSignInfo",
          },
        }
      },
    },
    -- config = function (_, opts)
    --   local nt = require("neo-tree")
    --   nt.setup(opts.options)
    -- end
  }
}
