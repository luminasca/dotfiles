local wezterm = require "wezterm"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local tmux = require "tmux"
tmux.apply(config)

config.automatically_reload_config = true
config.use_ime = true

config.color_scheme = "nord"
config.window_background_opacity = 0.75

config.font = wezterm.font("HackGen35 Console NF", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 13.0

config.hide_tab_bar_if_only_one_tab = true

return config
