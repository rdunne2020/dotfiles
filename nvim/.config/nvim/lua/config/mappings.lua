local map = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true, silent = true }
local utils = require("config.utils.functions")

--Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

--Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- paste over currently selected text without yanking it
map("v", "p", '"_dp', default_options)
map("v", "P", '"_dP', default_options)

-- Tab switch buffer
map("n", "<tab>", ":bnext<CR>", default_options)
map("n", "<S-tab>", ":bprev<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<esc>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- move over a closing element in insert mode
map("i", "<C-l>", function()
  return require("core.utils.functions").escapePair()
end)

-- toggles
map("n", "<leader>th", function()
  utils.notify("Toggling hidden chars", vim.log.levels.INFO, "config.mappings")
  vim.o.list = vim.o.list == false and true or false
end, { desc = "Toggle hidden chars" })
map("n", "<leader>tl", function()
  utils.notify("Toggling signcolumn", vim.log.levels.INFO, "config.mappings")
  vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
end, { desc = "Toggle signcolumn" })
map("n", "<leader>tv", function()
  utils.notify("Toggling virtualedit", vim.log.levels.INFO, "config.mappings")
  vim.o.virtualedit = vim.o.virtualedit == "all" and "block" or "all"
end, { desc = "Toggle virtualedit" })
map("n", "<leader>ts", function()
  utils.notify("Toggling spell", vim.log.levels.INFO, "config.mappings")
  vim.o.spell = vim.o.spell == false and true or false
end, { desc = "Toggle spell" })
map("n", "<leader>tw", function()
  utils.notify("Toggling wrap", vim.log.levels.INFO, "config.mappings")
  vim.o.wrap = vim.o.wrap == false and true or false
end, { desc = "Toggle wrap" })
map("n", "<leader>tc", function()
  utils.notify("Toggling cursorline", vim.log.levels.INFO, "config.mappings")
  vim.o.cursorline = vim.o.cursorline == false and true or false
end, { desc = "Toggle cursorline" })
map(
  "n",
  "<leader>to",
  "<cmd>lua require('config.utils.functions').toggle_colorcolumn()<cr>",
  { desc = "Toggle colorcolumn" }
)
map(
  "n",
  "<leader>tt",
  "<cmd>lua require('config.plugins.lsp.utils').toggle_virtual_text()<cr>",
  { desc = "Toggle Virtualtext" }
)
map("n", "<leader>ts", "<cmd>SymbolsOutline<cr>", { desc = "Toggle SymbolsOutline" })

local wk = require("which-key")

-- register non leader based mappings
wk.register({
   sa = "Add surrounding",
   sd = "Delete surrounding",
   sh = "Highlight surrounding",
   sn = "Surround update n lines",
   sr = "Replace surrounding",
   sF = "Find left surrounding",
   sf = "Replace right surrounding",
   ss = { "<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>", "Jump to character" },
   st = { "<cmd>lua require('tsht').nodes()<cr>", "TS hint textobject" },
})

-- Register leader based mappings
wk.register({
  ["<tab>"] = { "<cmd>e#<cr>", "Prev buffer" },
  b = {
    name = "Buffers",
    D = {
      "<cmd>%bd|e#|bd#<cr>",
      "Close all but the current buffer",
    },
    d = { "<cmd>Bdelete<cr>", "Close buffer" },
  },
  l = { "LSP" }, -- core.plugins.lsp.keys
  lw = { "Workspaces" }, -- core.plugins.lsp.keys
  f = {
    name = "Files",
    s = { "<cmd>w<cr>", "Save Buffer" },
  },
  m = {
    name = "Misc",
    C = { "<cmd>:CBcatalog<cr>", "Commentbox Catalog" },
    l = { "<cmd>source ~/.config/nvim/snippets/*<cr>", "Reload snippets" },
    p = { "<cmd>Lazy check<cr>", "Lazy check" },
  },
  q = {
    name = "Quickfix",
    j = { "<cmd>cnext<cr>", "Next Quickfix Item" },
    k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
    q = { "<cmd>lua require('config.utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
    t = { "<cmd>TodoQuickFix<cr>", "Show TODOs" },
  },
  t = { name = "Toggles" },
  -- hydra heads
  s = { "Search" },
  w = { "Windows" },
  z = { "Spelling" },
}, { prefix = "<leader>", mode = "n", {} })
