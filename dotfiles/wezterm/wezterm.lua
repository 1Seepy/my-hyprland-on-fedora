local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback {
    'Twilio Sans Mono',
}
config.default_prog = { '/bin/fish', '-l' }
config.window_background_opacity = 0.5
config.window_frame = {
    font = wezterm.font { family = 'Ubuntu', weight = 'Bold' },
    font_size = 14.0,
    active_titlebar_bg = '#000f1e',
    inactive_titlebar_bg = '#000f1e',
}

config.colors = {
    background = '#000f1e',
    scrollbar_thumb = '#f8fced',
    tab_bar = {
        inactive_tab_edge = '#77cffd',
    },
}
config.scrollback_lines = 1000000
config.enable_scroll_bar = true

return config
