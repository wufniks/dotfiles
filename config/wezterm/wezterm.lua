local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Gruvbox Material (Gogh)'
-- config.color_scheme = 'Gruvbox Dark (Gogh)'
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.font_size = 13.0

return config

