local wezterm = require 'wezterm';

return {
  keys = {
    {
      key = 'v',
      mods = 'CTRL|SUPER',
      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain"},
    },
    {
      key = 'h',
      mods = 'CTRL|SUPER',
      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
    },
  },
  font = wezterm.font("HackGen35 Console NF", {weight = "Regular"}), -- 自分の好きなフォントいれる
  use_ime = true, -- wezは日本人じゃないのでこれがないとIME動かない
  font_size = 13.0,
  color_scheme = "nord",
  enable_wayland = false,
  window_background_opacity = 0.8,
  adjust_window_size_when_changing_font_size = false,
  colors = {
      split = "#32a887",

  },
}
