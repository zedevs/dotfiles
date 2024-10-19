local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local appearance = require 'appearance'
local projects = require 'projects'
config.set_environment_variables = {
    EDITOR = 'zed',
    PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}

if appearance.is_dark() then
    config.color_scheme = "Catppuccin Mocha"
else
    config.color_scheme = "Catppuccin Frappe"
end


config.font = wezterm.font({ family = 'Fira Code' })
config.font_size = 15
config.initial_cols = 180
config.initial_rows = 60
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
-- Removes the title bar, leaving only the tab bar
config.window_decorations = 'RESIZE'
config.window_frame = {
    font = wezterm.font({ family = 'Helvetica Neue', weight = 'Bold' }),
    font_size = 13,
}

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
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
    {
        key = 'p',
        mods = 'LEADER',
        action = projects.choose_project(),
    },
    {
        key = 'd',
        mods = 'LEADER',
        action = wezterm.action.SpawnCommandInNewTab {
            cwd = wezterm.home_dir,
            args = { 'brew', 'bundle', 'dump', '--file=~/.local/share/chezmoi/Brewfile', '--force' },
        },
    },
}

return config
