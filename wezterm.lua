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
local theme = wezterm.color.get_builtin_schemes()['Vs Code Dark+ (Gogh)']
theme.background = 'black'

config.color_scheme = 'Custom'
config.color_schemes = {
  ['Custom'] = theme,
}

config.force_reverse_video_cursor = true

-- config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Book' })
config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 18

-- better underline
config.underline_position = -4

-- avoid using underline_thickness for cursor_thickness
config.cursor_thickness = 1
config.default_cursor_style = 'BlinkingBar'

-- disable ligatures
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}

-- disable padding
config.window_padding = {
  left = 2,
  right = 0,
  top = 0,
  bottom = 0,
}

-- tab bar
config.window_frame = {
  font = wezterm.font { family = 'San Francisco Display' },
  font_size = 14.0,
}
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config

