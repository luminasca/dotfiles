vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

require('config')
require('keybind')
require('pack')
require('plugin')
