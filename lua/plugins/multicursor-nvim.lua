return {
  {
    "jake-stewart/multicursor.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- opts = {
    --   keys = {
    --     { "x",          "S",              mc.splitCursors,                         desc = "Split visual selections by regex"  },
    --     { "x",          "M",              mc.matchCursors,                         desc = "match new cursors within visual selections by regex"  },
    --     { "n",          "<leader>a",      mc.alignCursors,                         desc = "Align cursor columns"  },
    --     { "n",          "<M-leftmouse>",  mc.handleMouse,                          desc = "Handle mouse"  },
    --     { "n",          "<M-leftdrag>",   mc.handleMouseDrag,                      desc = "Handle mouse drag"  },
    --     { "n",          "<M-leftrelease>",mc.handleMouseRelease,                   desc = "Handle mouse release"  },
    --     { { "n", "x" }, "ga",             mc.addCursorOperator,                    desc = "Add cursor when select at visual mode"  },
    --     { { "n", "x" }, "<M-q>",          mc.toggleCursor,                         desc = "Disable and enable cursors"  },
    --     { { "n", "x" }, "<leader>o",      mc.operator,                             desc = "Adds a cursor for every match found in a region"  },-- see `:h multicursor-operator` for detail
    --     { { "n", "x" }, "<M-up>",         function () mc.lineAddCursor(-1)   end,  desc = "Add cursor up"  },
    --     { { "n", "x" }, "<M-down>",       function () mc.lineAddCursor(1)    end,  desc = "Add cursor down"  },
    --     { { "n", "x" }, "<M-C-up>",       function () mc.lineSkipCursor(-1)  end,  desc = "Skip cursor up"  },
    --     { { "n", "x" }, "<M-C-down>",     function () mc.lineSkipCursor(1)   end,  desc = "Skip cursor down"  },
    --     { { "n", "x" }, "<leader>mn",     function () mc.matchAddCursor(1)   end,  desc = "Add cursor match down"  },
    --     { { "n", "x" }, "<leader>mN",     function () mc.matchAddCursor(-1)  end,  desc = "Add cursor match up"  },
    --     { { "n", "x" }, "<leader>ms",     function () mc.matchSkipCursor(1)  end,  desc = "skip cursor match down"  },
    --     { { "n", "x" }, "<leader>mS",     function () mc.matchSkipCursor(-1) end,  desc = "skip cursor match up"  }
    --   }
    -- },
    config = function ()
      local mc = require("multicursor-nvim")
      mc.setup()

      -- keymaps
      -- local set = vim.keymap.set
      -- local keys = opts.keys
      -- for _, key in ipairs(keys) do
      --   set(key[1], key[2], key[3], { desc = keys.desc })
      -- end

      local key = vim.keymap.set
      key( "x",          "<leader>ms",       function () mc.splitCursors() end,                    { desc = "Split visual selections by regex" } )
      key( "x",          "<leader>mm",       function () mc.matchCursors() end,                    { desc = "match new cursors within visual selections by regex" } )
      key( "n",          "<leader>a",        function () mc.alignCursors() end,                    { desc = "Align cursor columns" } )
      key( "n",          "<M-leftmouse>",    function () mc.handleMouse() end,                     { desc = "Handle mouse" } )
      key( "n",          "<M-leftdrag>",     function () mc.handleMouseDrag() end,                 { desc = "Handle mouse drag" } )
      key( "n",          "<M-leftrelease>",  function () mc.handleMouseRelease() end,              { desc = "Handle mouse release" } )
      key( { "n", "x" }, "ga",               function () mc.addCursorOperator() end,               { desc = "Add cursor when select at visual mode" } )
      key( { "n", "x" }, "<M-q>",            function () mc.toggleCursor() end,                    { desc = "Disable and enable cursors" } )
      key( { "n", "x" }, "<leader>o",        function () mc.operator() end,                        { desc = "Adds a cursor for every match found in a region" } )-- see `:h multicursor-operator` for detail
      key( { "n", "x" }, "<M-up>",           function () mc.lineAddCursor(-1)   end,    { desc = "Add cursor up" } )
      key( { "n", "x" }, "<M-down>",         function () mc.lineAddCursor(1)    end,    { desc = "Add cursor down" } )
      key( { "n", "x" }, "<M-C-up>",         function () mc.lineSkipCursor(-1)  end,    { desc = "Skip cursor up" } )
      key( { "n", "x" }, "<M-C-down>",       function () mc.lineSkipCursor(1)   end,    { desc = "Skip cursor down" })
      key( { "n", "x" }, "<M-m>",            function () mc.matchAddCursor(1)   end,    { desc = "Add cursor match down" } )
      key( { "n", "x" }, "<M-M>",            function () mc.matchAddCursor(-1)  end,    { desc = "Add cursor match up" } )
      key( { "n", "x" }, "<M-s>",            function () mc.matchSkipCursor(1)  end,    { desc = "skip cursor match down" } )
      key( { "n", "x" }, "<M-S>",            function () mc.matchSkipCursor(-1) end,    { desc = "skip cursor match up" } )

      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({"n", "x"}, "<left>", mc.prevCursor)
        layerSet({"n", "x"}, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursor look
      local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn"})
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
    end
  }
}
