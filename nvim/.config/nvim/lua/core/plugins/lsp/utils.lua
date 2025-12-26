local utils = require("config.utils.functions")
M = {}

-- TODO: refactor
-- must be global or the initial state is not working
VIRTUAL_TEXT_ACTIVE = true
-- toggle displaying virtual text
M.toggle_virtual_text = function()
  VIRTUAL_TEXT_ACTIVE = not VIRTUAL_TEXT_ACTIVE
  utils.notify(
    string.format("Virtualtext %s", VIRTUAL_TEXT_ACTIVE and "on" or "off"),
    vim.log.levels.INFO,
    "lsp/utils.lua"
  )
  vim.diagnostic.show(nil, 0, nil, { virtual_text = VIRTUAL_TEXT_ACTIVE })
end

-- TODO: refactor
-- must be global or the initial state is not working
AUTOFORMAT_ACTIVE = true
-- toggle null-ls's autoformatting
M.toggle_autoformat = function()
  AUTOFORMAT_ACTIVE = not AUTOFORMAT_ACTIVE
  utils.notify(
    string.format("Autoformatting %s", AUTOFORMAT_ACTIVE and "on" or "off"),
    vim.log.levels.INFO,
    "lsp.utils"
  )
end

-- detect python venv
-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-851247107
M.get_python_path = function(workspace)
  local lsp_util = require("lspconfig/util")
  local path = lsp_util.path
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end
  -- Find and use virtualenv in workspace directory.
  -- now `workspace` is showing as `nil`
  local ws = workspace or vim.loop.cwd()
  local match = vim.fn.glob(path.join(ws, 'poetry.lock'))
  if match ~= "" then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end
  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return M
