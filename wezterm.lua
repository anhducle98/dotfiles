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

-- VS Code Terminal
theme = {
  ansi = {
    '#000000',
    '#BD3F39',
    '#56B97F',
    '#E5E54D',
    '#3B71C2',
    '#AE48B6',
    '#4CA6C9',
    '#E5E5E5',
  },
  background = '#000000',
  brights = {
    '#767676',
    '#DF5953',
    '#64CE91',
    '#F5F566',
    '#518CE3',
    '#C975D1',
    '#5AB6D7',
    '#E5E5E5',
  },
  cursor_bg = '#CCCCCC',
  cursor_border = '#CCCCCC',
  cursor_fg = '#1E1E1E',
  foreground = '#CCCCCC',
  indexed = {},
}

-- wezterm.log_info(wezterm.to_string(theme))

config.color_scheme = 'Custom'
config.color_schemes = {
  ['Custom'] = theme,
}

config.force_reverse_video_cursor = true

-- config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Book' })
-- config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'DemiBold' })
config.font_size = 20

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
-- config.window_frame = {
--   font = wezterm.font { family = 'San Francisco Display' },
--   font_size = 14.0,
-- }
config.tab_max_width = 16
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.colors = {
  tab_bar = {
    background = "#1C1C1C",

    active_tab = {
      bg_color = '#E5E5E5',
      fg_color = '#000000',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#2A2A2A',
      fg_color = '#CCCCCC',
      intensity = 'Normal',
    },
    inactive_tab_hover = {
      bg_color = '#333333',
      fg_color = '#DDDDDD',
      italic = false,
    },
    new_tab = {
      bg_color = '#2A2A2A',
      fg_color = '#CCCCCC',
      italic = false,
    },
    new_tab_hover = {
      bg_color = '#333333',
      fg_color = '#DDDDDD',
      italic = false,
    },
  },
}

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title:gmatch("%w+")()
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    return '  ' .. title .. ' '
  end
)

-- and finally, return the configuration to wezterm
return config

