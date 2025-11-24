vim.opt.clipboard = "unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.ambiwidth = "single"
vim.opt.wildmenu = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.guicursor = ""
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
vim.opt.wrap = true
vim.opt.nrformats = "bin,hex"
vim.opt.swapfile = false
vim.opt.formatoptions:remove('t')
vim.opt.formatoptions:append('mM')
vim.cmd 'colorscheme nord'

vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
augroup END
]]
