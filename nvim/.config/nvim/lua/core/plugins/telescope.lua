local M = {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.1",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "crispgm/telescope-heading.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "ptethng/telescope-makefile",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").setup()
    end
}

return M
