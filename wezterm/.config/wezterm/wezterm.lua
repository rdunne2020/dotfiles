-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'tender (base16)'
-- 'Chalk (Gogh)'
-- 'Rapture'
config.font = wezterm.font 'JetBrains Mono'

config.enable_tab_bar = false

-- Update the domain for WSL
-- config.default_domain = 'WSL:Fedora39'

config.window_background_opacity = 0.8

-- Keybinds
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds=1000}
config.keys = {
    { key = '%', mods = 'LEADER', action = wezterm.action.SplitHorizontal{ domain = 'CurrentPaneDomain' }},
    { key = '"', mods = 'LEADER', action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' }},
    { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

    -- Cycle through panes
    { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },

    -- Resize Panes
    { key = 'L', mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 5 }},
    { key = 'H', mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 5 }},
    { key = 'J', mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 5 }},
    { key = 'K', mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 5 }},

    -- Resize Panes
    { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },

    -- Kill Pane
    { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true }},
    -- Kill Tab
    { key = 'q', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true }},
    -- Kill Wezterm
    { key = 'q', mods = 'LEADER|SHIFT', action = wezterm.action.QuitApplication }
}

-- and finally, return the configuration to wezterm
return config
