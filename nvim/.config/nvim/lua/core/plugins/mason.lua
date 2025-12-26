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
            -- stop mason from launching lsps automatically as it conflicts with lsp.lua
            automatic_enable = false,
            ensure_installed = settings.lsp_servers
        })
    end,
}

return M
