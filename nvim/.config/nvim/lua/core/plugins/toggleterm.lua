local M = {
    -- "akinsho/nvim-toggleterm.lua",
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    opts = {
      open_mapping = "<C-t>",
      shade_filetypes = {},
      persist_mode = true,
      insert_mappings = false,
      direction = "horizontal",
      close_on_exit = true,
      size = function(term)
      if term.direction == "horizontal" then
        return 15
          elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
        end
      end,
      winbar = {
        enabled = true,
      },
    },
    config = function(_, opts)
      local map = vim.api.nvim_set_keymap
      local buf_map = vim.api.nvim_buf_set_keymap
      -- TODO get highlights working
      require("toggleterm").setup(opts)
    end,
}

return M
