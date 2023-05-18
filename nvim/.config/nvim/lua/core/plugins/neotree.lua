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
    opts = {
        close_if_last_window = true,
        close_floats_on_escape_key = true,
        git_status_async = true,
        sources = {
            "filesystem",
            "buffers",
            "git_status",
        },
        default_source = "filesystem",
        -- source_selector provides clickable tabs to switch between sources.
        source_selector = {
            winbar = true, -- toggle to show selector on winbar
            statusline = false, -- toggle to show selector on statusline
            show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
                                                   -- of the top visible node when scrolled down.
            sources = {
              -- { source = " Filesystem" },
              -- { source = " Buffers" },
              -- { source = " Git" },
              { source = "filesystem" },
              { source = "buffers" },
              { source = "git_status" },
            },
            content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
            --                start  : |/ 裡 bufname     \/...
            --                end    : |/     裡 bufname \/...
            --                center : |/   裡 bufname   \/...
            tabs_layout = "equal", -- start, end, center, equal, focus
            --             start  : |/  a  \/  b  \/  c  \            |
            --             end    : |            /  a  \/  b  \/  c  \|
            --             center : |      /  a  \/  b  \/  c  \      |
            --             equal  : |/    a    \/    b    \/    c    \|
            --             active : |/  focused tab    \/  b  \/  c  \|
            truncation_character = "…", -- character to use when truncating the tab label
            tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
            tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
            padding = 0, -- can be int or table
            -- padding = { left = 2, right = 0 },
            -- separator = "▕", -- can be string or table, see below
             separator = { left = "▏", right= "▕" },
            -- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
            -- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
            -- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
            -- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
            -- separator = "|",                                              -- ||  a  |  b  |  c  |...
            separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
            show_separator_on_edge = false,
            --                       true  : |/    a    \/    b    \/    c    \|
            --                       false : |     a    \/    b    \/    c     |
            highlight_tab = "NeoTreeTabInactive",
            highlight_tab_active = "NeoTreeTabActive",
            highlight_background = "NeoTreeTabInactive",
            highlight_separator = "NeoTreeTabSeparatorInactive",
            highlight_separator_active = "NeoTreeTabSeparatorActive",
        },
        defualt_component_configs = {
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "ﰊ",
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = "*",
                highlight = "NeoTreeFileIcon"
            },
            git_status = {
                symbols = {
                  -- Change type
                  added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                  modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                  deleted   = "✖",-- this can only be used in the git_status source
                  renamed   = "",-- this can only be used in the git_status source
                  -- Status type
                  untracked = "",
                  ignored   = "",
                  unstaged  = "",
                  staged    = "",
                  conflict  = "",
                }
            },
            name = {
                trailing_slash = false,
                highlight_opened_files = false, -- Requires `enable_opened_markers = true`.
                                                -- Take values in { false (no highlight), true (only loaded),
                                                -- "all" (both loaded and unloaded)}. For more information,
                                                -- see the `show_unloaded` config of the `buffers` source.
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            -- ["S"] = "split_with_window_picker",
            ["s"] = "open_vsplit",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["R"] = "refresh",
            ["a"] = {
              "add",
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none", -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
            ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
            ["e"] = "toggle_auto_expand_width",
            ["q"] = "close_window",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        }, -- end mappings
        filesystem = {
            window = {
              mappings = {
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                --["/"] = "filter_as_you_type", -- this was the default until v1.28
                ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ["D"] = "fuzzy_sorter_directory",
                ["f"] = "filter_on_submit",
                ["<C-x>"] = "clear_filter",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
              },
              fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ["<down>"] = "move_cursor_down",
                ["<C-n>"] = "move_cursor_down",
                ["<up>"] = "move_cursor_up",
                ["<C-p>"] = "move_cursor_up",
              },
            },
            async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
                                           -- "always" means directory scans are always async.
                                           -- "never"  means directory scans are never async.
            scan_mode = "shallow", -- "shallow": Don't scan into directories to detect possible empty directory a priori
                                   -- "deep": Scan into directories to detect empty or grouped empty directories a priori.
            bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
            cwd_target = {
              sidebar = "tab",   -- sidebar is when position = left or right
              current = "window" -- current is when position = current
            },
            -- The renderer section provides the renderers that will be used to render the tree.
            --   The first level is the node type.
            --   For each node type, you can specify a list of components to render.
            --       Components are rendered in the order they are specified.
            --         The first field in each component is the name of the function to call.
            --         The rest of the fields are passed to the function as the "config" argument.
            filtered_items = {
              visible = false, -- when true, they will just be displayed differently than normal items
              force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
              show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
              hide_dotfiles = true,
              hide_gitignored = true,
              hide_hidden = true, -- only works on Windows for hidden files/directories
              hide_by_name = {
                ".DS_Store",
                "thumbs.db"
                --"node_modules",
              },
              hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json"
              },
              always_show = { -- remains visible even if other settings would normally hide it
                --".gitignored",
              },
              never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                --".DS_Store",
                --"thumbs.db"
              },
              never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
              },
            },
            find_by_full_path_words = false,  -- `false` means it only searches the tail of a path.
                                              -- `true` will change the filter into a full path
                                              -- search with space as an implicit ".*", so
                                              -- `fi init`
                                              -- will match: `./sources/filesystem/init.lua
            --find_command = "fd", -- this is determined automatically, you probably don't need to set it
            --find_args = {  -- you can specify extra args to pass to the find command.
            --  fd = {
              --  "--exclude", ".git",
              --  "--exclude",  "node_modules"
            --  }
            --},
            ---- or use a function instead of list of strings
            --find_args = function(cmd, path, search_term, args)
            --  if cmd ~= "fd" then
            --    return args
            --  end
            --  --maybe you want to force the filter to always include hidden files:
            --  table.insert(args, "--hidden")
            --  -- but no one ever wants to see .git files
            --  table.insert(args, "--exclude")
            --  table.insert(args, ".git")
            --  -- or node_modules
            --  table.insert(args, "--exclude")
            --  table.insert(args, "node_modules")
            --  --here is where it pays to use the function, you can exclude more for
            --  --short search terms, or vary based on the directory
            --  if string.len(search_term) < 4 and path == "/home/cseickel" then
            --    table.insert(args, "--exclude")
            --    table.insert(args, "Library")
            --  end
            --  return args
            --end,
            group_empty_dirs = false, -- when true, empty folders will be grouped together
            search_limit = 50, -- max number of search results when using filters
            follow_current_file = false, -- This will find and focus the file in the active buffer every time
                                         -- the current file is changed while the tree is open.
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                    -- in whatever position is specified in window.position
                                  -- "open_current",-- netrw disabled, opening a directory opens within the
                                                    -- window like netrw would, regardless of window.position
                                  -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                            -- instead of relying on nvim autocmd events.
        }, -- end filesystem config
		git_status = {
			window = {
		        mappings = {
				    ["A"] = "git_add_all",
				    ["gu"] = "git_unstage_file",
				    ["ga"] = "git_add_file",
				    ["gr"] = "git_revert_file",
				    ["gc"] = "git_commit",
				    ["gp"] = "git_push",
				    ["gg"] = "git_commit_and_push",
			    },
			},
		}, -- end of status mappings
    },
}

return M
