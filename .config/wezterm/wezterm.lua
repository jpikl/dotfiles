
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.executable_dir:sub(1, 1) == '/' then
    -- Linux
    config.default_prog = { '/usr/bin/bash', '-i' }
else
    -- Windows
    config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '-i', '-l' }
end

config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

config.font_dirs = { 'fonts' }
config.font = wezterm.font 'LiterationMono Nerd Font'
config.font_size = 11

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 600
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.window_padding = {
    left = 1,
    right = 1,
    top = 0,
    bottom = 0,
}

local colors = {
    background = '#263238',
    foreground = '#A1B0B8',
    black = '#000000',
    red = '#FF5252',
    green = '#C3D82C',
    yellow = '#FFC135',
    blue = '#42A5F5',
    magneta = '#D81B60',
    cyan = '#00ACC1',
    white = '#F5F5F5',
}

config.window_frame = {
    font_size = config.font_size,
    active_titlebar_bg = colors.black,
    inactive_titlebar_bg = colors.black,
}

config.colors = {
    background = colors.background,
    foreground = colors.foreground,

    ansi = {
        colors.black,
        colors.red,
        colors.green,
        colors.yellow,
        colors.blue,
        colors.magneta,
        colors.cyan,
        colors.white,
    },

    brights = {
        colors.black,
        colors.red,
        colors.green,
        colors.yellow,
        colors.blue,
        colors.magneta,
        colors.cyan,
        colors.white,
    },

    cursor_bg = colors.foreground,
    cursor_border = colors.foreground,
    split = colors.foreground,


    tab_bar = {
        background = colors.background,
        inactive_tab_edge = colors.foreground,

    
        active_tab = {
           bg_color = colors.background,
           fg_color = colors.foreground,
        },
    
        inactive_tab = {
           bg_color = colors.black,
           fg_color = colors.foreground,
        },
    
        inactive_tab_hover = {
            bg_color = colors.background,
            fg_color = colors.foreground,
        },
    
        new_tab = {
            bg_color = colors.black,
            fg_color = colors.foreground,
        },

        new_tab_hover = {
            bg_color = colors.background,
            fg_color = colors.foreground,
        },
      },
}

config.keys = {
    {
        key = 'v',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'x',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
  }

return config
