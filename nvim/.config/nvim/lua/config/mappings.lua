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
wk.add({
    {"sa", desc = "Add surrounding"},
    {"sd", desc = "Delete surrounding"},
    {"sh", desc = "Highlight surrounding"},
    {"sn", desc = "Surround update n lines"},
    {"sr", desc = "Replace surrounding"},
    {"sF", desc = "Find left surrounding"},
    {"sf", desc = "Replace right surrounding"},
    {"ss", desc = "<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>", "Jump to character"},
    {"st", desc = "<cmd>lua require('tsht').nodes()<cr>", "TS hint textobject"},
})

-- Register leader based mappings
wk.add({
    { "<leader><tab>", "<cmd>e#<cr>", desc = "Prev buffer" },
    { "<leader>b", group = "Buffers" },
    { "<leader>bD", "<cmd>%bd|e#|bd#<cr>", desc = "Close all but the current buffer" },
    { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Close buffer" },
    { "<leader>f", group = "Files" },
    { "<leader>fs", "<cmd>w<cr>", desc = "Save Buffer" },
    { "<leader>l", desc = "LSP" },
    { "<leader>lw", desc = "Workspaces" },
    { "<leader>m", group = "Misc" },
    { "<leader>mC", "<cmd>:CBcatalog<cr>", desc = "Commentbox Catalog" },
    { "<leader>ml", "<cmd>source ~/.config/nvim/snippets/*<cr>", desc = "Reload snippets" },
    { "<leader>mp", "<cmd>Lazy check<cr>", desc = "Lazy check" },
    { "<leader>q", group = "Quickfix" },
    { "<leader>qj", "<cmd>cnext<cr>", desc = "Next Quickfix Item" },
    { "<leader>qk", "<cmd>cprevious<cr>", desc = "Previous Quickfix Item" },
    { "<leader>qq", "<cmd>lua require('config.utils.functions').toggle_qf()<cr>", desc = "Toggle quickfix list" },
    { "<leader>qt", "<cmd>TodoQuickFix<cr>", desc = "Show TODOs" },
    { "<leader>s", desc = "Search" },
    { "<leader>t", group = "Toggles" },
    { "<leader>w", desc = "Windows" },
    { "<leader>z", desc = "Spelling" },
})
