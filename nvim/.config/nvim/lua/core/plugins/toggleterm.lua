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
      direction = "float",
      float_opts = {
          border = "double",
          winblend = 2,
      },
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
      -- Better navigation to and from terminal
      local set_terminal_keymaps = function()
          local opts = { noremap = true }
          buf_map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
          buf_map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
          buf_map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
          buf_map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
          buf_map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
      end
      vim.api.nvim_create_autocmd("TermOpen", {
          pattern = "term://*toggleterm#*",
          callback = function()
              set_terminal_keymaps()
          end,
          desc = "Mapping for navigation in terminal",
      })
    end,
}

return M
