
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    local git_bash_launcher = {
        label = "Git Bash",
        args = { "C:\\Program Files\\Git\\bin\\bash.exe", "-li" },
    }

    local msys2_launcher = {
        label = "MSYS2",
        args = {
            'C:\\tools\\msys64\\msys2_shell.cmd',
            '-defterm',
            '-here',
            '-no-start',
            '-ucrt64',
            '-shell', 'bash',
            '-use-full-path'
        },
    }

    local wsl_launcher = {
        label = "WSL",
        args = { "wsl.exe" },
    }

    local powershell_launcher = {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' },
    }

    config.launch_menu = { git_bash_launcher, msys2_launcher, wsl_launcher, powershell_launcher }
    config.default_prog = git_bash_launcher.args
else
    config.default_prog = { '/usr/bin/bash', '-i' }
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

-- Base on Dark Material Theme (https://materialshell.carloscuesta.me)
local colors = {
    foreground = '#A1B0B8',
    background = '#151515',
    black = '#505050', -- Original #252525 did not have much contrast in combination with `background`
    red = '#FF443E',
    green = '#C3D82C',
    yellow = '#FFC135',
    blue = '#42A5F5',
    magenta = '#D81B60',
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
        colors.magenta,
        colors.cyan,
        colors.white,
    },

    brights = {
        colors.black,
        colors.red,
        colors.green,
        colors.yellow,
        colors.blue,
        colors.magenta,
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
        key = '|',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods =  'CTRL|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = '_',
        mods =  'CTRL|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = '<',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { "Left", 1 },
    },
    {
        key = '>',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.AdjustPaneSize { "Right", 1 },
    },
}

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
