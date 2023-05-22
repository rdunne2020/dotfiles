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
    -- If you press one of these keys then you will load the plugin
    keys = {
        -- search methods
        { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Strings" },
        { "<leader>s?", "<cmd>Telescope help_tags<cr>", desc = "Help" },
        { "<leader>sh", "<cmd>Telescope heading<cr>", desc = "Headings" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
        { "<leader>sO", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
        { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
        { "<leader>sR", "<cmd>Telescope regiesters<cr>", desc = "Registers" },
        { "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Text under cursor" },
        { "<leader>sS", "<cmd>Telescope symbols<cr>", desc = "Emoji" },
        { "<leader>s:", "<cmd>Telescope search_history<cr>", desc = "Search History" },
        { "<leader>s;", "<cmd>Telescope command_history<cr>", desc = "Command history" },
        {
          "<leader>sf",
          "<cmd>lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' }<cr>",
          desc = "Fuzzy search",
        },
        -- Git
        { "<leader>gh", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
        { "<leader>gg", "<cmd>Telescope git_status<cr>", desc = "Status" },
        { "<leader>gm", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
        -- files
        { "<leader>fb", "<cmd>Telescope file_browser grouped=true<cr>", desc = "Filebrowser" },
        { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
        { "<leader>ff", "<cmd>" .. require("config.utils.functions").project_files() .. "<cr>", desc = "Open file" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
        -- misc
        { "<leader>mt", "<cmd>Telescope<cr>", desc = "Telescope" },
        -- Other
        { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Bufferlist" },
        { "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in buffer" },
    },
    config = function()
        local telescope = require("telescope")
        local telescopeConfig = require("telescope.config")
        local filebrowser_actions = require("telescope").extensions.file_browser.actions

        -- Clone the default Telescope configuration
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
        -- Let RG search hidden files
        table.insert(vimgrep_arguments, "--hidden")

        telescope.setup({
            extensions = {
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = false,
                    hidden = true,
                    mappings = {
                        i = {
                          ["<c-n>"] = filebrowser_actions.create,
                          ["<c-r>"] = filebrowser_actions.rename,
                          -- ["<c-h>"] = actions.which_key,
                          ["<c-h>"] = filebrowser_actions.toggle_hidden,
                          ["<c-x>"] = filebrowser_actions.remove,
                          ["<c-p>"] = filebrowser_actions.move,
                          ["<c-y>"] = filebrowser_actions.copy,
                          ["<c-a>"] = filebrowser_actions.select_all,
                        },
                    },
                },
            },
        })
    end
}

return M
