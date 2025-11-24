local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = require("plugins.plugins")
require("lazy").setup(plugins)

require("core.keymap")
require("core.utils")
require("core.config")
require("plugins.dap")
require("plugins.dap-virtualtext")
require("plugins.indent")
require("plugins.ddc")
require("plugins.mason")
