-- Autocomplete Config
local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-calc",
        "lukas-reineke/cmp-rg",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    with_text = false,
                    maxwidth = 50,
                    mode = "symbol",
                    menu = {
                        buffer = "BUF",
                        rg = "RG",
                        nvim_lsp = "LSP",
                        path = "PATH",
                        luasnip = "SNIP",
                        calc = "CALC",
                    },
                }),
            },
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end 
            },
            -- TODO: Add in Mappings, the defaults are poo
            mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                    cmp.select_next_item()
                    else
                    fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function()
                    if cmp.visible() then
                    cmp.select_prev_item()
                    end
                end, { "i", "s" }),
            },
            -- What are sources? Not sure, but read docs for cmp plugins and it lists the source
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help"},
                { name = "buffer" },
                { name = "rg" },
                { name = "luasnip" },
                { name = "calc" },
                { name = "path" },
            }
        })
    end,
}

return M