-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/cibile/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/cibile/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/cibile/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/cibile/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cibile/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["caw.vim"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/caw.vim",
    url = "https://github.com/tyru/caw.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["fzf.vim"] = {
    commands = { ":FZFToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/opt/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gundo.vim"] = {
    commands = { ":GundoToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/opt/gundo.vim",
    url = "https://github.com/sjl/gundo.vim"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/indent-guides.nvim",
    url = "https://github.com/glepnir/indent-guides.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  tagbar = {
    commands = { ":TagbarToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["vim-alignta"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-alignta",
    url = "https://github.com/h1mesuke/vim-alignta"
  },
  ["vim-anzu"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-anzu",
    url = "https://github.com/osyo-manga/vim-anzu"
  },
  ["vim-operator-replace"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-operator-replace",
    url = "https://github.com/kana/vim-operator-replace"
  },
  ["vim-operator-surround"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-operator-surround",
    url = "https://github.com/rhysd/vim-operator-surround"
  },
  ["vim-operator-user"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-operator-user",
    url = "https://github.com/kana/vim-operator-user"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-quickrun"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-smartinput"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-smartinput",
    url = "https://github.com/kana/vim-smartinput"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tags"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-tags",
    url = "https://github.com/szw/vim-tags"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-trailing-whitespace"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/vim-trailing-whitespace",
    url = "https://github.com/bronson/vim-trailing-whitespace"
  },
  ["yankround.vim"] = {
    loaded = true,
    path = "/home/cibile/.local/share/nvim/site/pack/packer/start/yankround.vim",
    url = "https://github.com/LeafCage/yankround.vim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[au CmdUndefined :TagbarToggle ++once lua require"packer.load"({'tagbar'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :FZFToggle ++once lua require"packer.load"({'fzf.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :GundoToggle ++once lua require"packer.load"({'gundo.vim'}, {}, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
