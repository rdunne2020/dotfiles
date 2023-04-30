local M = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    cmd = "Neotree",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-tree/nvim-web-devicons", lazy = true }, -- not strictly required, but recommended
        { "MunifTanjim/nui.nvim", lazy = true },
    },
    keys = {
        { "<leader>fp", "<cmd>Neotree reveal toggle<cr>", desc = "Toggle Filetree" },
    },
}

return M