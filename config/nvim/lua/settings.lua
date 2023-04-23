vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.ambiwidth = "single"
vim.opt.wildmenu = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
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

-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', 'lua vim.lsp.buf.definition()')
vim.keymap.set('n', 'gD', 'lua vim.lsp.buf.declaration()')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

local cmp = require('cmp')
local lspkind = require('lspkind')

 cmp.setup({
   snippet = {
     expand = function(args)
       vim.fn['vsnip#anonymous'](args.body)
     end
   },

   window = {
      completion = cmp.config.window.bordered({
        border = 'single'
    }),
      documentation = cmp.config.window.bordered({
        border = 'single'
    }),
   },

   mapping = cmp.mapping.preset.insert({
     ['<Tab>'] = cmp.mapping.select_next_item(),
     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-Space>'] = cmp.mapping.complete(),
     ['<C-e>'] = cmp.mapping.abort(),
     ['<CR>'] = cmp.mapping.confirm({ select = true }),
   }),

 formatting = {
   format = lspkind.cmp_format({
     mode = 'symbol',
     maxwidth = 50,
     ellipsis_char = '...',
   })
  },

 sources = cmp.config.sources({
   { name = 'nvim_lsp' },
   { name = 'vsnip' },
   { name = 'nvim_lsp_signature_help' },
  }, {
   { name = 'buffer', keyword_length = 2 },
  })
 })

 cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
  { name = 'nvim_lsp_document_symbol' }
  }, {
   { name = 'buffer' }
  })
 })

 cmp.setup.cmdline(':', {
 mapping = cmp.mapping.preset.cmdline(),
 sources = cmp.config.sources({
   { name = 'path' }
  }, {
   { name = 'cmdline', keyword_length = 2 }
  })
 })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.cmd('let g:vsnip_filetypes = {}')

require('dap-python').setup(command)

vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})

require("dapui").setup({
  icons = { expanded = "", collapsed = "" },
  layouts = {
    {
      elements = {
        { id = "watches", size = 0.20 },
        { id = "stacks", size = 0.20 },
        { id = "breakpoints", size = 0.20 },
        { id = "scopes", size = 0.40 },
      },
      size = 64,
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.20,
      position = "bottom",
    },
  },
})

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
  globalstatus = true,
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

-- indent_line
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
