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
    {
        key = '[',
        mods = 'CTRL',
        action = wezterm.action.PaneSelect
    },
  },
  font = wezterm.font("HackGen35 Console NF", {weight = "Regular"}), 
  use_ime = true, -- wezは日本人じゃないのでこれがないとIME動かない
  font_size = 13.0,
  color_scheme = "nord",
  enable_wayland = false,
  window_background_opacity = 0.7,
  adjust_window_size_when_changing_font_size = false,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,
  window_frame = {
      inactive_titlebar_bg = "none",
      active_titlebar_bg = "none",
  },
  colors = {
      split = "#32a887",
      tab_bar = {
          background = "none",
          inactive_tab_edge = "none",
      },
  },
}
