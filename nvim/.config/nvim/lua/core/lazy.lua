local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Remap space as leader key
-- Must be before lazy
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- plugins should be a table of plugins, or a string of where to find your plugin spec
-- opts is this https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration, but can be updated
require("lazy").setup("core.plugins", {
  install = {
    -- Install missing deps on startup when true
    missing = false,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
})
