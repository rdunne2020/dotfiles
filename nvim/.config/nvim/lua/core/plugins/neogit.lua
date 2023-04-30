local M = {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        disable_signs = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        signs = {
            -- { CLOSED, OPENED }
            section = { ">", "v" },
            item = { ">", "v" },
            hunk = { "", "" },
        },
        integrations = { diffview = true },
    },
}

return M