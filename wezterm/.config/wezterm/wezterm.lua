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
    { key = '%', mods = 'LEADER|SHIFT', action = wezterm.action.SplitHorizontal{ domain = 'CurrentPaneDomain' }},
    { key = '"', mods = 'LEADER|SHIFT', action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' }},
    { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

    -- Cycle through panes
    { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
}

-- and finally, return the configuration to wezterm
return config
