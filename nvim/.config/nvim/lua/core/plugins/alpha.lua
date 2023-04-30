local M = {
    "goolord/alpha-nvim",
    even = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("core.plugins.alpha.alpha")
    end,
}

return M