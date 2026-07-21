local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

local M = {}

-- ============================================
-- Keybinds
-- ============================================
M.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

M.keys = {
  -- Tab operations
  { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },          -- new tab
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },                -- next tab
  { key = 'b', mods = 'LEADER', action = act.ActivateTabRelative(-1) },               -- previous tab
  { key = 'c', mods = 'LEADER', action = act.CloseCurrentTab { confirm = true } }, -- close tab
  { key = 'w', mods = 'LEADER', action = act.ShowTabNavigator },                      -- list tabs
  { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },                        -- go to tab 1-9
  { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },

  -- Pane operations
  { key = 'v', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } }, -- split horizontal
  { key = 'h', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },   -- split vertical
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },   -- close pane
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },                   -- toggle zoom
  { key = 'o', mods = 'LEADER', action = act.ActivatePaneDirection 'Next' },          -- next pane
  { key = ';', mods = 'LEADER', action = act.ActivatePaneDirection 'Prev' },          -- previous pane
  { key = 'LeftArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },  -- navigate panes (arrow)
  { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },

  -- Resize panes (vim style with Shift)
  { key = 'H', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'J', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },
  { key = 'K', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'L', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },

  -- Copy mode
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },                      -- enter copy mode
  { key = ']', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },                 -- paste

  -- Search & Quick Select
  { key = '/', mods = 'LEADER', action = act.Search 'CurrentSelectionOrEmptyString' }, -- search
  { key = 's', mods = 'LEADER', action = act.QuickSelect },                           -- quick select
  { key = 'u', mods = 'LEADER', action = act.QuickSelectArgs {                        -- open URL
    label = 'open url',
    patterns = { 'https?://\\S+' },
    action = wezterm.action_callback(function(window, pane)
      local url = window:get_selection_text_for_pane(pane)
      wezterm.open_with(url)
    end),
  }},

  -- Workspace / Project
  { key = 'f', mods = 'LEADER', action = wezterm.action_callback(function(window, pane) -- project launcher
    local choices, _ = build_project_choices()

    if #choices == 0 then
      window:toast_notification('WezTerm', 'No projects found in ' .. projects_dir, nil, 3000)
      return
    end

    window:perform_action(
      act.InputSelector {
        title = 'Switch to Project',
        choices = choices,
        fuzzy = true,
        action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
          if id then
            switch_or_start_project(inner_window, inner_pane, id)
          end
        end),
      },
      pane
    )
  end)},

  -- Misc
  { key = 'd', mods = 'LEADER', action = act.QuitApplication },                       -- detach (quit)
  { key = ':', mods = 'LEADER|SHIFT', action = act.ActivateCommandPalette },          -- command palette
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },                   -- reload config
  { key = 'b', mods = 'LEADER|CTRL', action = act.SendKey { key = 'b', mods = 'CTRL' } }, -- send Ctrl+b
}

M.key_tables = {
  copy_mode = {
    -- Movement
    { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },

    -- Word movement
    { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
    { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },

    -- Line movement
    { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },

    -- Page movement
    { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'u', mods = 'CTRL', action = act.CopyMode 'PageUp' },
    { key = 'd', mods = 'CTRL', action = act.CopyMode 'PageDown' },

    -- Selection
    { key = 'v', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'v', mods = 'CTRL', action = act.CopyMode { SetSelectionMode = 'Block' } },

    -- Copy and exit
    { key = 'y', mods = 'NONE', action = act.Multiple {
      { CopyTo = 'ClipboardAndPrimarySelection' },
      { CopyMode = 'Close' },
    }},

    -- Exit copy mode
    { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },

    -- Search
    { key = '/', mods = 'NONE', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'n', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    { key = 'N', mods = 'SHIFT', action = act.CopyMode 'PriorMatch' },
  },
}

-- ============================================
-- Apply to config
-- ============================================
function M.apply(config)
  config.leader = M.leader
  config.keys = M.keys
  config.key_tables = M.key_tables
end

return M
