local M = {
    "folke/which-key.nvim",
    config = function()
      local icons = require("config.utils.icons")
      -- Set in options.lua
      -- vim.o.timeout = true
      -- vim.o.timeoutlen = 300
      require("which-key").setup({
        icons = {
            breadcrumb = icons.arrows.DoubleArrowRight, -- symbol used in the command line area that shows your active key combo
            separator = icons.arrows.SmallArrowRight, -- symbol used between a key and it's label
            group = icons.ui.Plus, -- symbol prepended to a group
        },
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 0, 10, 3, 10 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
            spacing = 3,
            align = center,
        },
        hidden = { 
            "<silent>",
            "<cmd>",
            "<Cmd>",
            "<CR>",
            "<cr>",
            "call",
            "lua",
            "require",
            "Plug",
            "^:",
            "^ ",
        }, -- hide mapping boilerplate
      })
    end,
}

return M
