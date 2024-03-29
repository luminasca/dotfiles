vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.ambiwidth = "single"
vim.opt.wildmenu = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.nrformats = "bin,hex"
vim.opt.swapfile = false
vim.opt.formatoptions:remove('t')
vim.opt.formatoptions:append('mM')

vim.cmd 'colorscheme nord'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { separator = true }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { separator = true }
)

require('lualine').setup {
 options = {
  icons_enabled = true,
  theme = 'auto',
  component_separators = { left = '|', right = '|'},
  section_separators = { left = '', right = ''},
  disabled_filetypes = {},
  always_divide_middle = true,
  colored = false,
  },
  sections = {
   lualine_a = {'mode'},
   lualine_b = {'branch', 'diff'},
   lualine_c = {
    {
     'filename',
     path = 1,
     file_status = true,
     shorting_target = 40,
     symbols = {
     modified = ' [+]',
     readonly = ' [RO]',
     unnamed = 'Untitled',
     }
    }
   },
   lualine_x = {'filetype', 'encoding'},
   lualine_y = {
    {
     'diagnostics',
     source = {'nvim-lsp'},
      }
     },
   lualine_z = {'location'}
 },
  inactive_sections = {
   lualine_a = {},
   lualine_b = {},
   lualine_c = {'filename'},
   lualine_x = {'location'},
   lualine_y = {},
   lualine_z = {}
 },
  tabline = {},
  extensions = {}
 }

 require("nvim-treesitter.configs").setup {
  yati = { enable = true },
}

require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

--Mason
local mason = require('mason')
 mason.setup({
   ui = {
     icons = {
       package_installed = "✓",
       package_pending = "➜",
       package_uninstalled = "✗"
     }
   }
 })
