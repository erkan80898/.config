-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Google Dark (Gogh)'

config.tab_bar_at_bottom = true
config.use_dead_keys = false

config.keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
        key = 'LeftArrow',
        mods = 'SHIFT|CMD',
        action = wezterm.action.MoveTabRelative(-1) -- move left a tab
    },


    {
        key = 'RightArrow',
        mods = 'SHIFT|CMD',
        action = wezterm.action.MoveTabRelative(1) -- move right a tab
    },
    {
        key = 'v',
        mods = 'CTRL',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, -- Split Verrically
    },
    {
        key = 'h',
        mods = 'CTRL',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, -- move right a tab
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = 'W',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentTab { confirm = false },
    },
}
-- and finally, return the configuration to wezterm
return config
