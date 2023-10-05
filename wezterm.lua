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
config.color_scheme = 'kanagawabones'
-- config.color_scheme = 'ayu'
-- config.color_scheme = 'Catppuccin Mocha'
config.force_reverse_video_cursor = true

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Regular' })
config.font_size = 20

-- better underline
config.underline_thickness = 3
config.underline_position = -4

-- avoid using underline_thickness for cursor_thickness
config.cursor_thickness = 1
config.default_cursor_style = 'SteadyBar'

-- disable ligatures
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}

-- disable padding
config.window_padding = {
  left = 2,
  right = 0,
  top = 0,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config

