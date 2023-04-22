local wezterm = require 'wezterm';

return {
  keys = {
    {
      key = 'v',
      mods = 'CTRL|SUPER',
      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain"},
    },
    {
      key = 'h',
      mods = 'CTRL|SUPER',
      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
  },
  font = wezterm.font("HackGen35 Console NF", {weight = "Bold"}), -- 自分の好きなフォントいれる
  use_ime = true, -- wezは日本人じゃないのでこれがないとIME動かない
  font_size = 13.0,
  color_scheme = "iceberg-dark",
  adjust_window_size_when_changing_font_size = false,
}
