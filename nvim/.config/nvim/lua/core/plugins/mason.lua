local settings = require("config.settings")

local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
        require("mason").setup()

        -- Install LSPs
        require("mason-lspconfig").setup({
            ensure_installed = settings.lsp_servers
        })
    end,
}

return M
