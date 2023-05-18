local settings = require("core.settings")
local nvim_lsp = require("lspconfig")
local utils = require("core.plugins.lsp.utils")
-- local lsp_settings = require("core.plugins.lsp.settings")

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- enable autoclompletion via nvim-cmp
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- What does this do?
require("core.utils.functions").on_attach(function(client, buffer)
    require("core.plugins.lsp.keys").on_attach(client, buffer)
end)

-- Install the lsp servers
for _, lsp in ipairs(settings.lsp_servers) do
    nvim_lsp[lsp].setup({
        before_init = function(_, config)
            -- If python make sure the venv is taken into acct
            if lsp == "pyright" then
                config.settings.python.pythonPath = utils.get_python_path(config.root_dir)
            end
        end
        --capabilities = capabilities,
        --flags = { debounce_text_changes = 150 }
    })
end
