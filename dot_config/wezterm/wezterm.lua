local wezterm = require 'wezterm'
local appearance = require 'appearance'

local config = {
    set_environment_variables = {
        EDITOR = 'cursor',
        PATH = '/opt/homebrew/bin:' .. os.getenv('PATH'),
        BAT_THEME = appearance.is_dark() and "Catppuccin-mocha" or "Catppuccin-latte",
    },
    color_scheme = appearance.is_dark() and "Catppuccin Mocha" or "Catppuccin Frappe",
    font = wezterm.font({ family = 'Fira Code' }),
    font_size = 15,
    line_height = 1.1,
    initial_cols = 180,
    initial_rows = 60,
    window_decorations = 'RESIZE',
    window_background_opacity = 0.9,
    macos_window_background_blur = 20,
    hide_tab_bar_if_only_one_tab = false,
    tab_bar_at_bottom = false,
    use_fancy_tab_bar = false,
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },

    -- Keys
    leader = { key = 'a', mods = 'OPT', timeout_milliseconds = 1500 },
    keys = {
        -- Sends ESC + b and ESC + f sequence, which is used
        -- for telling your shell to jump back/forward.
        {
            key = 'LeftArrow',
            mods = 'OPT',
            action = wezterm.action.SendString '\x1bb',
        },
        {
            key = 'RightArrow',
            mods = 'OPT',
            action = wezterm.action.SendString '\x1bf',
        },
        -- Remapping to accomodate Aerospace ergonomics (capslock -> opt instead of ctrl)
        {
            key = 'd',
            mods = 'OPT',
            action = wezterm.action.SendKey {
                key = 'd',
                mods = 'CTRL',
            },
        },
        {
            key = 'r',
            mods = 'OPT',
            action = wezterm.action.SendKey {
                key = 'r',
                mods = 'CTRL',
            },
        },
        {
            key = 'e',
            mods = 'OPT',
            action = wezterm.action.SendKey {
                key = 'e',
                mods = 'CTRL',
            },
        },
        {
            key = 'c',
            mods = 'OPT',
            action = wezterm.action.SendKey {
                key = 'c',
                mods = 'CTRL',
            },
        },
        -- Vim style pane and tab manipulation
        {
            mods = "LEADER",
            key = "c",
            action = wezterm.action.SpawnTab "CurrentPaneDomain",
        },
        {
            mods = "LEADER",
            key = "x",
            action = wezterm.action.CloseCurrentPane { confirm = true }
        },
        {
            mods = "LEADER",
            key = "b",
            action = wezterm.action.ActivateTabRelative(-1)
        },
        {
            mods = "LEADER",
            key = "n",
            action = wezterm.action.ActivateTabRelative(1)
        },
        {
            mods = "LEADER",
            key = "\\",
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
        },
        {
            mods = "LEADER",
            key = "-",
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
        },
        {
            mods = "LEADER",
            key = "h",
            action = wezterm.action.ActivatePaneDirection "Left"
        },
        {
            mods = "LEADER",
            key = "j",
            action = wezterm.action.ActivatePaneDirection "Down"
        },
        {
            mods = "LEADER",
            key = "k",
            action = wezterm.action.ActivatePaneDirection "Up"
        },
        {
            mods = "LEADER",
            key = "l",
            action = wezterm.action.ActivatePaneDirection "Right"
        },
        {
            mods = "LEADER",
            key = "LeftArrow",
            action = wezterm.action.AdjustPaneSize { "Left", 5 }
        },
        {
            mods = "LEADER",
            key = "RightArrow",
            action = wezterm.action.AdjustPaneSize { "Right", 5 }
        },
        {
            mods = "LEADER",
            key = "DownArrow",
            action = wezterm.action.AdjustPaneSize { "Down", 5 }
        },
        {
            mods = "LEADER",
            key = "UpArrow",
            action = wezterm.action.AdjustPaneSize { "Up", 5 }
        },
        -- Reload dotfiles (TODO: Just copies them, still need to be reloaded)
        {
            mods = 'LEADER',
            key = 'r',
            action = wezterm.action.RotatePanes 'CounterClockwise',
        },
        { key = 'R', mods = 'LEADER', action = wezterm.action.RotatePanes 'Clockwise' },
        {
            key = ',',
            mods = 'SUPER',
            action = wezterm.action.SpawnCommandInNewTab {
                cwd = wezterm.home_dir,
                args = { 'chezmoi', 'edit' },
            },
        },
        {
            key = 'r',
            mods = 'SUPER',
            action = wezterm.action.SpawnCommandInNewTab {
                cwd = wezterm.home_dir,
                args = { 'chezmoi', 'apply' },
            },
        },
    }
}

for i = 1, 9 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i),
    })
end

return config
